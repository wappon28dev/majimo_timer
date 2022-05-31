import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';

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
  const MyTheme({required this.context, required this.ref});
  final BuildContext context;
  final WidgetRef ref;

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

  ThemeData get lightTheme {
    final seedColor = ref.read(themeState).seedColor;
    final colorScheme = ColorScheme.fromSeed(
      seedColor: seedColor,
      inversePrimary: seedColor,
    );
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      scaffoldBackgroundColor: colorScheme.primaryContainer,
      backgroundColor: colorScheme.primaryContainer,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colorScheme.inversePrimary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      fontFamily: 'M-plus-M',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pageTransitionsTheme: back,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  ThemeData get darkTheme {
    final seedColor = ref.read(themeState).seedColor;

    final colorSchemeDark = ColorScheme.fromSeed(
      seedColor: seedColor,
      brightness: Brightness.dark,
    );
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorSchemeSeed: seedColor,
      scaffoldBackgroundColor: colorSchemeDark.onSecondary,
      backgroundColor: colorSchemeDark.onSecondary,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colorSchemeDark.inversePrimary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      fontFamily: 'M-plus-M',
      pageTransitionsTheme: back,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  ThemeData get getThemeData {
    final value = ref.read(themeState.notifier).isLight(context: context);
    return value ? lightTheme : darkTheme;
  }

  Color get getBackgroundColor {
    final value = ref.read(themeState.notifier).isLight(context: context);
    return value
        ? lightTheme.scaffoldBackgroundColor
        : darkTheme.scaffoldBackgroundColor;
  }

  Color get getOnBackgroundColor {
    final value = ref.read(themeState.notifier).isLight(context: context);
    return value
        ? lightTheme.colorScheme.onPrimaryContainer
        : darkTheme.colorScheme.primary;
  }

  ColorScheme get getColorScheme => getThemeData.colorScheme;

  void foo() {}
}
