import 'package:flutter/material.dart';

class NavTabIcon extends StatelessWidget {
  final String name;
  final int index;
  final Animation<double> animation;

  NavTabIcon({
    required this.name,
    required this.index,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.white);
    final icon = Text(name.substring(0, 1), style: style);

    return AnimatedBuilder(
      animation: animation,
      child: icon,
      builder: (BuildContext context, Widget? _) {
        double delta = animation.value - index + 1;
        double opacity = delta >= 0.0 && delta <= 1.0 ? delta : (delta > 1 && delta < 2 ? 2 - delta : 0);
        opacity = opacity > 0.84 ? 0.84 : (opacity < 0.26 ? 0.26 : opacity);

        return Container(
          constraints: BoxConstraints.expand(),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Opacity(opacity: opacity, child: icon)),
          ),
        );
      }
    );
  }
}
