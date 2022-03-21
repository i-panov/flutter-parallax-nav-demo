import 'dart:async';
import 'package:flutter/material.dart';

import './background.dart';
import './nav-container.dart';

class AppContainer extends StatelessWidget {
  final List<String> screens;

  AppContainer({required this.screens});

  Widget build(BuildContext context) {
    final animationStorageController = StreamController<Animation<double>>();

    return Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Background(assetName: 'assets/bg_01.jpg', animationStream: animationStorageController.stream),
            NavContainer(children: screens, animationSink: animationStorageController.sink),
          ],
        )
    );
  }
}
