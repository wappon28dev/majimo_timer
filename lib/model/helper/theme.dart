import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../main.dart';

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

// テーマ変更用の状態クラス
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

  final ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    primaryColor: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.deepOrange.shade100.lighter(10),
    backgroundColor: ColorKey.orange.value,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.deepOrange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    fontFamily: 'M-plus-M',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: back,
  );

  final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.deepOrange.shade50.darker(70),
    backgroundColor: Colors.deepOrange.shade900.darker(50),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.deepOrange.shade800,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.deepOrange.shade800,
      ),
    ),
    fontFamily: 'M-plus-M',
    pageTransitionsTheme: back,
  );

  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;

  ThemeData get_theme({required BuildContext context, required WidgetRef ref}) {
    final value = ref.read(themeState.notifier).isLight(context: context);
    return value ? _lightTheme : _darkTheme;
  }

  Color get_background({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final value = ref.read(themeState.notifier).isLight(context: context);
    return value
        ? _lightTheme.scaffoldBackgroundColor
        : _darkTheme.scaffoldBackgroundColor;
  }

  static Color get_color(ColorKey color) {
    return color.value;
  }

  void foo() {}
}
