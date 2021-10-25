import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/view/home/widget.dart';
import '../../main.dart';
import 'body.dart';
import '/model/theme.dart';
import 'package:ezanimation/ezanimation.dart';
import 'package:fullscreen/fullscreen.dart';

class ColorChanger {
  final animation = EzAnimation.tween(
    ColorTween(
        begin: MyTheme.getcolor("orange"), end: MyTheme.getcolor("darkblue")),
    const Duration(seconds: 1),
  );
  changecolor() async {
    animation.reset();
    animation.start();
  }

  stop() {
    exit();
  }

  static void exit() async {
    await FullScreen.exitFullScreen();
  }
}
