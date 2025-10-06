import 'package:flutter/material.dart';
import 'package:sampark_web/Config/Themes.dart';
import 'package:sampark_web/View/HomePageView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sampark Web',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: HomePageView(),
    );
  }
}
