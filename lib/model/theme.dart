import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/pref.dart';
import 'package:majimo_timer/view/home/body.dart';
import 'package:majimo_timer/view/home/model.dart';
import 'package:majimo_timer/view/setting/body.dart';
import 'package:majimo_timer/view/setting/model.dart';
import '../../main.dart';

// テーマ変更用の状態クラス
class MyTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepOrange,
    primaryColor: Colors.deepOrange,
    accentColor: Colors.blue,
    fontFamily: 'M-plus-M',
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        // for Android - default page transition
        TargetPlatform.android:
            CupertinoPageTransitionsBuilderCustomBackGestureWidth(),

        // for iOS - one which considers ancestor BackGestureWidthTheme
        TargetPlatform.iOS:
            CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
      },
    ),
  );

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    primaryColor: Colors.deepOrange,
    accentColor: Colors.blue,
    fontFamily: 'M-plus-M',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        // for Android - default page transition
        TargetPlatform.android:
            CupertinoPageTransitionsBuilderCustomBackGestureWidth(),

        // for iOS - one which considers ancestor BackGestureWidthTheme
        TargetPlatform.iOS:
            CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
      },
    ),
  );

  static getcolor(String colorname) {
    switch (colorname) {
      case ("blue"):
        return const Color.fromRGBO(0, 163, 255, 1);
      case ("red"):
        return const Color.fromRGBO(255, 101, 76, 1);
      case ("green"):
        return const Color.fromRGBO(95, 216, 49, 1);
      case ("orange"):
        return const Color.fromRGBO(255, 102, 0, 1);
      case ("darkblue"):
        return const Color.fromRGBO(0, 32, 96, 1);
    }
  }

  static isLight(BuildContext context) {
    bool isLightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    int themenum = context.read(themeManager).get(mode: 2);
    if (themenum == 1 && isLightMode) {
      context.read(colorManager).define(value: true);
      return true;
    } else {
      context.read(colorManager).define(value: false);
      return false;
    }
  }
}
