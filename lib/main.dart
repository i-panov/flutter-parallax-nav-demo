// https://itnext.io/creating-a-parallax-background-in-flutter-5e8b5f4bb837
// https://github.com/kenreilly/flutter-parallax-nav-demo

import 'package:flutter/material.dart';

import './components/app-container.dart';

class ParallaxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Parallax BG",
      theme: ThemeData(primarySwatch: Colors.brown),
      home: AppContainer(screens: ["A", "B", "C", "D", "E"]),
    );
  }
}

Future<void> main() async {
  runApp(ParallaxDemo());
}
