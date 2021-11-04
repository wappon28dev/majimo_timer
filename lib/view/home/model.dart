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

class ColorManager extends ChangeNotifier {
  EzAnimation _color = EzAnimation.tween(
    ColorTween(begin: MyTheme.getcolor("orange"), end: null),
    // end: MyTheme.getcolor("darkblue")),
    const Duration(seconds: 1),
  );
  EzAnimation get color => _color;
  final opacity = EzAnimation(0.0, 1.0, const Duration(seconds: 1));

  define({required bool value}) {
    if (value) {
      _color = EzAnimation.tween(
        ColorTween(
            begin: MyTheme.getcolor("orange"),
            end: Colors.orangeAccent.shade200),
        // end: MyTheme.getcolor("darkblue")),
        const Duration(seconds: 1),
      );
    } else {
      _color = EzAnimation.tween(
        ColorTween(
            begin: MyTheme.getcolor("orange"), end: Colors.blue.shade900),
        // end: MyTheme.getcolor("darkblue")),
        const Duration(seconds: 1),
      );
    }
  }

  change() async {
    _color.reset();
    opacity.reset();
    _color.start();
    opacity.start();
  }

  get(int mode, BuildContext context) {
    switch (mode) {
      case (0):
        return (MyTheme.isLight(context)) ? Colors.black : Colors.white;
      case (1):
        return (MyTheme.isLight(context))
            ? Colors.orangeAccent.shade200
            : Colors.blue.shade900;
      case (2):
        return (MyTheme.isLight(context))
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
