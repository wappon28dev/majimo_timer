import 'dart:ffi';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:ezanimation/ezanimation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_color/src/helper.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/notification.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import '../../../main.dart';
import 'pref.dart';
import 'theme.dart';
import 'package:wakelock/wakelock.dart';

class GeneralManager extends ChangeNotifier {
  Widget _status = const Text("まじもタイマーへようこそ！",
      style: TextStyle(fontWeight: FontWeight.bold));
  bool _topToast = false;
  Widget get status => _status;
  bool get topToast => _topToast;

  changetopToast({required bool value}) {
    _topToast = value;
    PrefManager.setBool(key: PrefKey.topToast, value: value);

    notifyListeners();
    Logger.s("- from GeneralManager \n" +
        " >> save bool toptoast = " +
        _topToast.toString());
  }

  gettopToast() {
    List array = [];
    (_topToast)
        ? array = ['top'.tr(), Icons.keyboard_arrow_up]
        : array = ['bottom'.tr(), Icons.keyboard_arrow_down];
    return array;
  }

  home() {
    Wakelock.disable();
    Logger.i("wakelock => disable");
    _status = const Text("まじもタイマーへようこそ！",
        style: TextStyle(fontWeight: FontWeight.bold));
    notifyListeners();
  }

  expand() async {
    Wakelock.enable();
    Logger.i("wakelock => enable");

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      DateTime now = DateTime.now();
      _status = Text(
          '${now.year}年${now.month}月${now.day}日  ・  Majimo-Timer v0.0.1',
          style: const TextStyle(fontWeight: FontWeight.bold));
      notifyListeners();
    });
  }

  push({required BuildContext context, required dynamic name}) {
    return Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => name,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return const OpenUpwardsPageTransitionsBuilder().buildTransitions(
                MaterialPageRoute(builder: (context) => name),
                context,
                animation,
                secondaryAnimation,
                child);
          },
        ),
        (_) => false);
  }
}

class ThemeManager extends ChangeNotifier {
  ThemeManager(this.read);
  final Reader read;

  ThemeMode _theme = ThemeMode.system;
  ThemeMode get theme => _theme;
  change({required int theme}) {
    switch (theme) {
      case 0:
        _theme = ThemeMode.system;
        PrefManager.setInt(key: PrefKey.appTheme, value: 0);
        break;
      case 1:
        _theme = ThemeMode.light;
        PrefManager.setInt(key: PrefKey.appTheme, value: 1);
        break;
      case 2:
        _theme = ThemeMode.dark;
        PrefManager.setInt(key: PrefKey.appTheme, value: 2);
        break;
    }
    notifyListeners();
    Logger.s(
        "- from ThemeManager \n" + " >> save int theme = " + theme.toString());
  }

  /// ```
  /// return array = [String title, IconData icon, int number]
  /// ```
  get() {
    List array = []..length = 3;
    switch (_theme) {
      case (ThemeMode.system):
        array = ['system'.tr(), Icons.settings_brightness, 0];
        break;
      case (ThemeMode.light):
        array = ['light'.tr(), Icons.brightness_7, 1];
        break;
      case (ThemeMode.dark):
        array = ['dark'.tr(), Icons.nights_stay, 2];
        break;
    }
    return array;
  }

  isLight({required BuildContext context}) {
    bool isLightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    if (isLightMode || _theme == ThemeMode.light) {
      read(colorManager).define(value: true);
      return true;
    } else {
      read(colorManager).define(value: false);
      return false;
    }
  }
}

class LangManager extends ChangeNotifier {
  int _value = 0;
  int get value => _value;
  change({required BuildContext context, required int lang}) {
    void locale(Locale locale) => context.setLocale(locale);
    Locale japanese = const Locale('ja', 'JP');
    Locale english = const Locale('en', 'US');
    if (lang == 0) {
      _value = 0;
      context.resetLocale();
      PrefManager.setInt(key: PrefKey.changeLanguage, value: 0);
    }
    if (lang == 1) {
      _value = 1;
      locale(japanese);
      PrefManager.setInt(key: PrefKey.changeLanguage, value: 1);
    }
    if (lang == 2) {
      _value = 2;
      locale(english);
      PrefManager.setInt(key: PrefKey.changeLanguage, value: 2);
    }
    notifyListeners();
    Logger.s(
        "- from LangManager \n" + " >> save int lang = " + lang.toString());
  }

  /// ```
  ///  int mode 0 => return Text
  ///           1 => return String
  /// ```
  get() {
    switch (value) {
      case 0:
        return 'system'.tr();
      case 1:
        return "日本語/Japanese";
      case 2:
        return "英語/English";
    }
  }
}

class ClockManager extends ChangeNotifier {
  bool _is24 = true;
  bool get is24 => _is24;
  is24change({required bool value}) {
    _is24 = value;
    PrefManager.setBool(key: PrefKey.clockStyle, value: value);
    notifyListeners();
    Logger.s(
        "- from ClockManager \n" + " >> save bool is24 = " + value.toString());
  }

  /// ```
  /// return array = [String text, IconData icon];
  /// ```
  is24get() {
    List array = []..length = 2;
    (_is24)
        ? array = ['24style'.tr(), Icons.share_arrival_time_outlined]
        : array = ['12style'.tr(), Icons.share_arrival_time];
    return array;
  }
}

class ColorManager extends ChangeNotifier {
  ColorManager(this.read);
  final Reader read;

  EzAnimation _color = EzAnimation.tween(
    ColorTween(begin: null, end: null),
    const Duration(seconds: 1),
  );
  EzAnimation get color => _color;
  final opacity = EzAnimation(0.0, 1.0, const Duration(seconds: 1));

  define({required bool value}) {
    if (value) {
      _color = EzAnimation.tween(
        ColorTween(begin: Colors.deepOrange, end: Colors.orangeAccent.shade200),
        const Duration(seconds: 1),
      );
    } else {
      _color = EzAnimation.tween(
        ColorTween(
            begin: Colors.deepOrange.darker(70), end: Colors.blue.shade900),
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

  /// ```
  /// return array = [Color clockcolor, Color start, Color end, String path]
  /// ```
  get({required BuildContext context}) {
    bool isLight = read(themeManager).isLight(context: context);
    List array = []..length = 4;
    (isLight)
        ? array = [
            Colors.black,
            Colors.orangeAccent.shade200,
            'assets/splash/sun.json'
          ]
        : array = [
            Colors.white,
            Colors.blue.shade900,
            'assets/splash/wolf.json'
          ];
    return array;
  }

  stop() {
    _color.reset(); // It may be ignore
    exit();
  }

  static void exit() async {
    await FullScreen.exitFullScreen();
  }
}

class AlarmManager extends ChangeNotifier {
  AlarmManager(this.read);
  final Reader read;

  int _alarmHour = 12;
  int _alarmMinute = 00;
  // ignore: non_constant_identifier_names
  double _FABsize = 0;
  final _iconsize = EzAnimation(0.0, 30.0, const Duration(milliseconds: 200));
  int get alarmHour => _alarmHour;
  int get alarmMinute => _alarmMinute;
  // ignore: non_constant_identifier_names
  double get FABsize => _FABsize;
  EzAnimation get iconsize => _iconsize;

  /// set internal time
  ///
  ///   ex.) 5:42 => 5:50
  internal() {
    DateTime now = DateTime.now();

    // in case n:00, make into n:10 forcedly.
    if (now.minute == 00) {
      _alarmMinute++;
    }

    int minute = (now.minute / 10).ceil() * 10;

    // in case n:53, it'll get n:60. So, make into n+1:00 forcedly.
    if (minute == 60) {
      _alarmHour = now.hour + 1;
      _alarmMinute = 0;
    } else {
      _alarmHour = now.hour;
      _alarmMinute = minute;
    }
    notifyListeners();
    Logger.s("- from AlarmManager \n" +
        " > now = ${now.toString()}\n" +
        " >> save int alarmHour = " +
        _alarmHour.toString() +
        "\n >> save int alarmMinute = " +
        _alarmMinute.toString());
  }

  change({required TimeOfDay value}) {
    _alarmHour = value.hour;
    _alarmMinute = value.minute;
    notifyListeners();
  }

  /// ```
  ///  int mode 0 => return String for clock style name
  ///           1 => return Icon
  ///           2 => return bool is24
  /// ```
  get({required int mode}) {
    TimeOfDay value = TimeOfDay(hour: _alarmHour, minute: _alarmMinute);
    switch (mode) {
      case (0):
        return value;
      case (1):
        return _alarmHour.toString().padLeft(2, "0") +
            ":" +
            _alarmMinute.toString().padLeft(2, "0");
      case (2):
        return value.replacing(hour: value.hourOfPeriod);
      case (3):
        return read(alarmManager).alarmHour < 12;
    }
  }

  show() async {
    Logger.e("- from AlarmManager\n > showFAB called ! ");
    _iconsize.reset();
    _FABsize = 0;
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 300));
    _iconsize.start();
    _FABsize = 40;
    notifyListeners();
  }
}