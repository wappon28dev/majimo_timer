import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';

enum ColorKey {
  red,
  blue,
  green,
  orange,
  darkred,
  darkblue,
  darkgreen,
  darkorange
}

extension TypeExtension on ColorKey {
  static final colorKeys = {
    ColorKey.red: const Color.fromRGBO(255, 101, 76, 1),
    ColorKey.blue: const Color.fromRGBO(0, 163, 255, 1),
    ColorKey.green: const Color.fromRGBO(95, 216, 49, 1),
    ColorKey.orange: const Color.fromRGBO(255, 102, 0, 1),
    ColorKey.darkred: const Color.fromRGBO(0, 32, 96, 1),
  };
  Color get value => colorKeys[this]!;
}

class MyTheme {
  static const back = PageTransitionsTheme(
    builders: {
      TargetPlatform.android:
          CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
      TargetPlatform.iOS:
          CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
    },
  );
  static const up = PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: OpenUpwardsPageTransitionsBuilder(),
    },
  );
}
