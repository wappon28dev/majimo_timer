import 'package:flutter/material.dart';

class CircularClipper extends CustomClipper<Rect> {

  CircularClipper(this.fraction, this.center);
  final Offset? center;
  final double fraction;
  @override
  Rect getClip(Size size) {
    final rect = Rect.fromCircle(
        center: center ?? Offset(size.width / 2, size.height / 2),
        radius: (size.height > size.width ? size.height : size.width) *
            fraction,);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
