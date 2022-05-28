import 'package:auto_size_text/auto_size_text.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dynamic_color/dynamic_color.dart';

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

ColorScheme getColorScheme({
  required WidgetRef ref,
  required BuildContext context,
}) =>
    MyTheme().getThemeData(context: context, ref: ref).colorScheme;

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

  ThemeData lightTheme({required WidgetRef ref}) {
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

  ThemeData darkTheme({required WidgetRef ref}) {
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

  ThemeData getThemeData({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final value = ref.read(themeState.notifier).isLight(context: context);
    return value ? lightTheme(ref: ref) : darkTheme(ref: ref);
  }

  Color getBackgroundColor({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final value = ref.read(themeState.notifier).isLight(context: context);
    return value
        ? lightTheme(ref: ref).scaffoldBackgroundColor
        : darkTheme(ref: ref).scaffoldBackgroundColor;
  }

  Color getOnBackgroundColor({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final value = ref.read(themeState.notifier).isLight(context: context);
    return value
        ? lightTheme(ref: ref).colorScheme.onPrimaryContainer
        : darkTheme(ref: ref).colorScheme.primary;
  }

  static Color getColor(ColorKey color) {
    return color.value;
  }

  void foo() {}
}
