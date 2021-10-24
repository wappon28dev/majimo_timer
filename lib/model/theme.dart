import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';

// テーマ変更用の状態クラス
class MyTheme extends ChangeNotifier {
  bool _custom = true;
  bool _isDark = true;

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepOrange,
    primaryColor: Colors.deepOrange,
    accentColor: Colors.blue,
    fontFamily: 'M-plus-M',
    pageTransitionsTheme: PageTransitionsTheme(
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
    pageTransitionsTheme: PageTransitionsTheme(
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
}
