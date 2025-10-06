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
        leading: Icon(Icons.chat),
        title: Text("Web Home Page"),
        actions: [
          ElevatedButton.icon(
            onPressed: () {},
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
              SizedBox(height: 40),
              MyDivider(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
