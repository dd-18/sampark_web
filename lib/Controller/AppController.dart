import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'dart:html' as html;

import 'package:url_launcher/url_launcher.dart';

class AppController extends GetxController {
  String appUrl =
      "https://github.com/dd-18/Sampark/releases/download/1.1.0/Sampark.1.1.0.apk";
  String apkName = "Sampark.apk";

  Future downloadApk() async {
    try {
      final anchor = html.AnchorElement(href: appUrl)..download = apkName;

      html.document.body!.children.add(anchor);
      anchor.click();
      html.document.body!.children.remove(anchor);
    } catch (e) {
      print(e);
    }
  }

  RxString currentVersion = ''.obs;
  RxString oldVersion = ''.obs;
  RxString newAppUrl = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    currentVersion.value = packageInfo.version;
    checkLatestVersion(showNoUpdateSnackbar: false);
  }

  Future<void> checkLatestVersion({bool showNoUpdateSnackbar = true}) async {
    const repositoryOwner = 'dd-18';
    const repoName = 'Sampark';
    final response = await http.get(
      Uri.parse(
        'https://api.github.com/repos/$repositoryOwner/$repoName/releases/latest',
      ),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final tagName = data['tag_name'];
      oldVersion.value = tagName;
      final assets = data['assets'] as List<dynamic>;
      for (var asset in assets) {
        final assetName = asset['name'];
        final assetUrl = asset['browser_download_url'];
        newAppUrl.value = assetUrl;
      }
      if (oldVersion.value != currentVersion.value) {
        checkUpdate();
      } else {
        if (showNoUpdateSnackbar) {
          Get.rawSnackbar(
            barBlur: 500,
            message: 'You are already on the latest version.',
            duration: Duration(seconds: 5),
            snackPosition: SnackPosition.BOTTOM,
            snackStyle: SnackStyle.FLOATING,
            icon: Icon(Icons.update_disabled_rounded, color: Colors.green),
          );
        }
      }
    } else {
      print(
        'Failed to fetch Github Release latest version: ${response.statusCode}',
      );
    }
  }

  void checkUpdate() {
    Get.rawSnackbar(
      title: 'New Update Available',
      message: 'Please update to the latest version.',
      mainButton: TextButton(
        onPressed: () {
          launchUrl(
            Uri.parse(newAppUrl.value),
            mode: LaunchMode.externalApplication,
          );
          Get.back();
        },
        child: Text('Update Now'),
      ),
      duration: Duration(days: 1),
      snackPosition: SnackPosition.BOTTOM,
      icon: Icon(Icons.update, color: Colors.white),
    );
  }
}
