import 'package:flutter/material.dart';

class PinchAndShrink extends StatefulWidget {
  final Widget child;

  PinchAndShrink({required this.child});

  @override
  _PinchAndShrinkState createState() => _PinchAndShrinkState();
}

class _PinchAndShrinkState extends State<PinchAndShrink> {
  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (ScaleStartDetails details) {
        _previousScale = _scale;
        setState(() {});
      },
      onScaleUpdate: (ScaleUpdateDetails details) {
        _scale = _previousScale * details.scale;
        setState(() {});
      },
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
