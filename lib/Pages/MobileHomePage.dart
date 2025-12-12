import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampark_web/Widgets/Divider.dart';
import 'package:sampark_web/Widgets/ScreenShot.dart';

import '../Controller/AppController.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.put(AppController());
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/images/logo.png"),
        ),
        title: Text(
          'SAMPARK - Connect & Chat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Obx(
              () => ElevatedButton(
                onPressed: () {
                  appController.checkLatestVersion(showNoUpdateSnackbar: true);
                  appController.downloadApk();
                },
                style: ButtonStyle(
                  animationDuration: const Duration(milliseconds: 150),
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  backgroundColor: WidgetStateProperty.resolveWith(
                    (states) {
                      final base = const Color(0xff0057FF);
                      if (states.contains(WidgetState.pressed)) {
                        return base.withOpacity(0.85);
                      }
                      return base;
                    },
                  ),
                  elevation: WidgetStateProperty.resolveWith((states) {
                    if (states.contains(WidgetState.pressed)) return 1;
                    return 0;
                  }),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.download, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      'Download v${appController.oldVersion.value == '' ? '...' : appController.oldVersion.value}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/logo.png", width: 40),
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        "SAMPARK",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Connect. Communicate. Collaborate.",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                SizedBox(height: 10),
                Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (appController.oldVersion.value == '') ...[
                        SizedBox(
                          height: 14,
                          width: 14,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
                          ),
                        ),
                        SizedBox(width: 8),
                      ],
                      Text(
                        "App Version ${appController.oldVersion.value == '' ? 'Loading' : appController.oldVersion.value}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                          color: Color(0xFF4CAF50),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "A fast, modern way to stay close to the people who matter. Enjoy reliable messaging, beautifully crafted group chats, and crystal‑clear calls — all in a thoughtful, privacy‑minded experience.",
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                SizedBox(height: 25),
                Center(
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 320),
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () {
                          appController.checkLatestVersion(
                              showNoUpdateSnackbar: true);
                          appController.downloadApk();
                        },
                        style: ButtonStyle(
                          animationDuration: const Duration(milliseconds: 160),
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(vertical: 16),
                          ),
                          backgroundColor: WidgetStateProperty.all(
                            Theme.of(context).colorScheme.primary,
                          ),
                          elevation: WidgetStateProperty.all(4),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.android, size: 26, color: Colors.white),
                            const SizedBox(width: 10),
                            Text(
                              "Download v${appController.oldVersion.value == '' ? '...' : appController.oldVersion.value}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Center(
              child: Container(
                width: w * 0.8,
                height: w * 0.8,
                constraints: BoxConstraints(maxWidth: 400, maxHeight: 400),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  image: DecorationImage(
                    image: AssetImage("assets/images/main.png"),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(height: 40),
            MyDivider(),
            SizedBox(height: 20),
            Text(
              "Features",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Everything you need to stay connected",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 30),
            _buildFeatureCard(
              context,
              icon: Icons.message_rounded,
              title: "Real-Time Messaging",
              description: "Instant delivery with read receipts",
            ),
            _buildFeatureCard(
              context,
              icon: Icons.call,
              title: "HD Voice Calls",
              description: "Crystal-clear audio calls",
            ),
            _buildFeatureCard(
              context,
              icon: Icons.videocam,
              title: "HD Video Calls",
              description: "Face-to-face conversations",
            ),
            _buildFeatureCard(
              context,
              icon: Icons.groups,
              title: "Group Management",
              description: "Create and manage groups easily",
            ),
            _buildFeatureCard(
              context,
              icon: Icons.security,
              title: "Secure & Private",
              description: "End-to-end encrypted messages",
            ),
            _buildFeatureCard(
              context,
              icon: Icons.devices,
              title: "Cross-Platform",
              description: "Works on all Android devices",
            ),
            SizedBox(height: 40),
            MyDivider(),
            SizedBox(height: 20),
            Screenshot(),
            SizedBox(height: 40),
            MyDivider(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    "Made with ❤️ by Devang Dhameliya © 2025",
                    style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    launchUrl(
                      Uri.parse('https://github.com/dd-18/sampark_web'),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
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
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
