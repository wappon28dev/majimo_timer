import 'package:ezanimation/ezanimation.dart';
import 'package:flutter/material.dart';
import 'package:majimo_timer/plugin/circular_reveal_animation/src/circular_reveal_clipper.dart';
export 'package:majimo_timer/plugin/circular_reveal_animation/circular_reveal_animation.dart';

class CircularRevealAnimation extends StatelessWidget {
  final Alignment? centerAlignment;
  final Offset? centerOffset;
  final double? minRadius;
  final double? maxRadius;
  final Widget child;
  final EzAnimation animation;

  CircularRevealAnimation({
    required this.child,
    required this.animation,
    this.centerAlignment,
    this.centerOffset,
    this.minRadius,
    this.maxRadius,
  }) : assert(centerAlignment == null || centerOffset == null);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? _) {
        return ClipPath(
          clipper: CircularRevealClipper(
            fraction: animation.value as double,
            centerAlignment: centerAlignment,
            centerOffset: centerOffset,
            minRadius: minRadius,
            maxRadius: maxRadius,
          ),
          child: child,
        );
      },
    );
  }
}
