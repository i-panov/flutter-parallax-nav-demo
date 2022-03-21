import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final String assetName;
  final Stream<Animation<double>> animationStream;

  Background({
    required this.assetName,
    required this.animationStream,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: animationStream,
      builder: (context, AsyncSnapshot<Animation<double>> snapshot) {
        final animation = snapshot.data ?? AlwaysStoppedAnimation(1.0);

        return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {
              return OverflowBox(
                  maxWidth: double.infinity,
                  alignment: Alignment(animation.value * 0.1, 0),
                  child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(assetName)),
                          )
                      )
                  )
              );
            }
        );
      },
    );
  }
}
