import 'package:flutter/material.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/pref.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:majimo_timer/view/setting/body.dart';
import '../../main.dart';
import 'package:flutter_color/flutter_color.dart';

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
class MyTheme extends ChangeNotifier {
  MyTheme(this.read);
  final Reader read;

  static const back = PageTransitionsTheme(
    builders: {
      TargetPlatform.android:
          CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
      TargetPlatform.iOS:
          CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
    },
  );
  static const up =
      PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
    TargetPlatform.iOS: OpenUpwardsPageTransitionsBuilder(),
  });

  final ThemeData _lightTheme = ThemeData(
      primarySwatch: Colors.deepOrange,
      primaryColor: Colors.deepOrange,
      scaffoldBackgroundColor: Colors.deepOrange.shade100.lighter(12),
      backgroundColor: Colors.deepOrange.shade100.lighter(12),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        brightness: Brightness.dark,
      ),
      fontFamily: 'M-plus-M',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pageTransitionsTheme: back);

  final ThemeData _darkTheme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.deepOrange,
      backgroundColor: Colors.deepOrange.darker(70),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.deepOrange.shade800,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        brightness: Brightness.dark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Colors.deepOrange.shade800,
        ),
      ),
      scaffoldBackgroundColor: Colors.deepOrange.shade50.darker(70),
      fontFamily: 'M-plus-M',
      pageTransitionsTheme: back);

  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;

  static getcolor(ColorKey color) {
    return color.value;
  }
}
