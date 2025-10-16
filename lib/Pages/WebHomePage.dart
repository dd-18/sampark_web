import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampark_web/Widgets/Divider.dart';
import 'package:sampark_web/Widgets/MainInfo.dart';
import 'package:sampark_web/Widgets/WebFeatures.dart';

import '../Controller/AppController.dart';
import '../Widgets/ScreenShot.dart';
import 'package:url_launcher/url_launcher.dart';

class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.put(AppController());
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/logo.png'),
        ),
        title: Text("SAMPARK - Connect & Chat"),
        actions: [
          Obx(
            () => Tooltip(
              message: 'Download latest APK',
              child: ElevatedButton.icon(
              onPressed: () {
                appController.checkLatestVersion(showNoUpdateSnackbar: true);
                appController.downloadApk();
              },
                style: ButtonStyle(
                  animationDuration: const Duration(milliseconds: 150),
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  ),
                  backgroundColor: WidgetStateProperty.resolveWith(
                    (states) {
                      final base = const Color(0xff0057FF);
                      if (states.contains(WidgetState.pressed)) {
                        return base.withOpacity(0.85);
                      }
                      if (states.contains(WidgetState.hovered)) {
                        return base.withOpacity(0.92);
                      }
                      return base;
                    },
                  ),
                  elevation: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.hovered)) return 6;
                    if (states.contains(WidgetState.pressed)) return 2;
                    return 0;
                  }),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                icon: const Icon(Icons.download),
                label: Text(
                  "Download v${appController.oldVersion.value == '' ? '...' : appController.oldVersion.value}",
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainInfo(),
              SizedBox(height: 80),
              MyDivider(),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Features",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Effortless communication, designed for real life",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WebFeatures(
                    title: "Real-Time Messaging",
                    description:
                        "Instant message delivery with read receipts and online status",
                    icon: Icons.message_rounded,
                  ),
                  WebFeatures(
                    title: "Intuitive Interface",
                    description:
                        "Clean, modern design that's easy to navigate for everyone",
                    icon: Icons.touch_app,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WebFeatures(
                    title: "HD Voice Calls",
                    description:
                        "Crystal-clear audio calls with low latency connection",
                    icon: Icons.call,
                  ),
                  WebFeatures(
                    title: "HD Video Calls",
                    description:
                        "Face-to-face conversations with high-quality video",
                    icon: Icons.videocam,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WebFeatures(
                    title: "Group Management",
                    description:
                        "Create groups, add members, and collaborate seamlessly",
                    icon: Icons.groups,
                  ),
                  WebFeatures(
                    title: "Cross-Platform",
                    description:
                        "Works flawlessly on all Android devices and versions",
                    icon: Icons.devices,
                  ),
                ],
              ),
              SizedBox(height: 80),
              MyDivider(),
              SizedBox(height: 40),
              Screenshot(),
              SizedBox(height: 80),
              MyDivider(),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Made with ❤️ by Devang Dhameliya © 2025",
                            style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey),
                          ),
                          SizedBox(width: 12),
                          InkWell(
                            onTap: () {
                              launchUrl(
                                Uri.parse('https://github.com/dd-18/sampark_web'),
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            child: Row(
                              children: [
                                Icon(Icons.code, size: 14, color: Colors.grey),
                                SizedBox(width: 6),
                                Text(
                                  "GitHub",
                                  style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey, decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
