import 'dart:async';
import 'package:flutter/material.dart';

import './nav-route-view.dart';
import './nav-tab-icon.dart';

class NavContainer extends StatefulWidget {
  NavContainer({
    required this.children,
    required this.animationSink,
  });

  final List<String> children;
  final StreamSink<Animation<double>> animationSink;

  @override
  _NavContainerState createState() => _NavContainerState();
}

class _NavContainerState extends State<NavContainer> with SingleTickerProviderStateMixin {
  TabController? _controller;
  late Animation<double> _animation;

  List<Tab> get _tabs => Iterable.generate(widget.children.length, (index) => Tab(
    icon: NavTabIcon(index: index, name: widget.children[index], animation: _animation),
  )).toList();

  List<Widget> get _routes {
    final style = Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.white);

    return Iterable.generate(widget.children.length, (index) => NavRouteView(
      index: index,
      child: Container(
        constraints: BoxConstraints.expand(),
        child: Center(child: Text(widget.children[index], style: style)),
      ),
      animation: _animation,
    )).toList();
  }

  @override
  void initState() {
    super.initState();

    _controller = TabController(vsync: this, length: widget.children.length);
    _animation = _controller!.animation!;
    widget.animationSink.add(_animation);
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        padding: EdgeInsets.only(bottom: 64),
        constraints: BoxConstraints.expand(),
        child: TabBarView(
          controller: _controller,
          children: _routes,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(8, 16, 32, 16), Color.fromARGB(192, 32, 16, 32)]
              )
            ),
            child: TabBar(
              indicator: BoxDecoration(),
              labelPadding: EdgeInsets.only(bottom: 6, top: 4),
              indicatorPadding: EdgeInsets.only(top: 6, bottom: 12),
              controller: _controller,
              tabs: _tabs
            )
          ),
        ]
      )
    ]);
  }
}
