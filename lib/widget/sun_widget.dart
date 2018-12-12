import 'dart:math';

import 'package:flutter/material.dart';

class SunWidget extends StatefulWidget {
  @override
  _SunWidgetState createState() => _SunWidgetState();
}

class _SunWidgetState extends State<SunWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> rotateAnimation;

  static const Color sunColor = Color(0xFFb1695a);

  @override
  void initState() {
    _controller = AnimationController(vsync: this);

    rotateAnimation =
        Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);

    _controller.repeat(period: Duration(seconds: 4));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget child) =>
            Transform.rotate(angle: rotateAnimation.value, child: child),
        child: Image.asset(
          'images/sun.png',
          color: sunColor,
          scale: 2,
        ),
      );
}
