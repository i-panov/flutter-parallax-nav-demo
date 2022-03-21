import 'package:flutter/material.dart';

class NavRouteView extends AnimatedWidget {
  final Animation<double> animation;
  final Widget child;
  final int index;

  NavRouteView({
    required this.child,
    required this.index,
    required this.animation,
  }): super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? _) {
        double delta = animation.value - index + 1;
        double scale = delta >= 0.0 && delta <= 1.0 ? delta : (delta > 1 && delta < 2 ? 2 - delta : 0);
        double _transform = ((double p) => 1.0 - (1.0 - (scale * (1.0 - p)) - p))(0.8);

        return Transform.scale(
          scale: _transform,
          child: Opacity(child: child, opacity: scale),
        );
      }
    );
  }
}
