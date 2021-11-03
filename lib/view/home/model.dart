import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/view/home/widget.dart';
import 'package:majimo_timer/view/setting/model.dart';
import '../../main.dart';
import 'body.dart';
import '/model/theme.dart';
import 'package:ezanimation/ezanimation.dart';
import 'package:fullscreen/fullscreen.dart';

class ColorManager {
  final opacity = EzAnimation(0.0, 1.0, const Duration(seconds: 1));
  final color = EzAnimation.tween(
    ColorTween(begin: MyTheme.getcolor("orange"), end: get(1)),
    // end: MyTheme.getcolor("darkblue")),
    const Duration(seconds: 1),
  );
  change() async {
    color.reset();
    opacity.reset();
    color.start();
    opacity.start();
  }

  static get(int mode) {
    switch (mode) {
      case (0):
        return (MyTheme.isLight()) ? Colors.black : Colors.white;
      case (1):
        return (MyTheme.isLight())
            ? Colors.orangeAccent.shade200
            : Colors.blue.shade900;
      case (2):
        return (MyTheme.isLight())
            ? 'assets/splash/sun.json'
            : 'assets/splash/wolf.json';
    }
  }

  stop() {
    exit();
  }

  static void exit() async {
    await FullScreen.exitFullScreen();
  }
}
