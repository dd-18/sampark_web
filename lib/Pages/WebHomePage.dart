import 'package:flutter/material.dart';
import 'package:sampark_web/Widgets/Divider.dart';
import 'package:sampark_web/Widgets/MainInfo.dart';

class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.chat),
        title: Text("Web Home Page"),
        actions: [
          ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff0057FF),
              foregroundColor: Colors.white,
            ),
            icon: Icon(Icons.download),
            label: Text("Download"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainInfo(),
              SizedBox(height: 80),
              MyDivider(),
              SizedBox(height: 40),
              Container(
                width: w,
                height: h * 0.6,
                color: Colors.grey[300],
                child: Center(
                  child: Text(
                    "Map Placeholder",
                    style: TextStyle(fontSize: 24, color: Colors.black54),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
