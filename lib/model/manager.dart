// ignore_for_file: non_constant_identifier_names

import 'package:dart_date/dart_date.dart';
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:majimo_timer/model/theme.dart';
import 'package:majimo_timer/model/translations.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:majimo_timer/view/home/root/body.dart';
import 'package:wakelock/wakelock.dart';
import 'package:simple_animations/simple_animations.dart';

import 'pref.dart';

class GeneralManager {
  String _status = 'まじもタイマーへようこそ！';
  bool _topToast = false;
  int _toastDuration = 3;
  double _opacity = 1;
  bool _timekeeping = false;

  String get status => _status;
  bool get topToast => _topToast;
  int get toastDuration => _toastDuration;
  double get opacity => _opacity;
  bool get timekeeping => _timekeeping;

  void change_topToast({required bool value}) {
    _topToast = value;
    PrefManager.setBool(key: PrefKey.topToast, value: value);
    Logger.s('- from GeneralManager \n >> save bool toptoast = $_topToast');
  }

  void change_toastDuration({required int value}) {
    (value == 0) ? value = 4 : null;
    _toastDuration = value;
    PrefManager.setInt(key: PrefKey.toastDuration, value: value);
    // ignore: lines_longer_than_80_chars
    Logger.s(
        '- from GeneralManager \n >> save int toastDuration = $_toastDuration');
  }

  Future<void> home(int i) async {
    await Wakelock.disable();

    if (i == 0) {
      _opacity = 1.0;
      _status = 'まじもタイマーへようこそ！';
    }
    if (i == 1) {
      _opacity = 0.0;
    }
    if (i == 2) {
      _status = DateTime.now().format('yMMMMEEEEd', t.lang.t);
      _opacity = 1.0;
    }
  }

  Future<void> expand(int i) async {
    await Wakelock.enable();

    if (i == 0) {
      _opacity = 1.0;
      _status = '置き時計モード';
    }
    if (i == 1) {
      _opacity = 0.0;
    }
    if (i == 2) {
      _status = DateTime.now().format('yMMMMEEEEd', t.lang.t) +
          '・Majimo-Timer v0.0.2';
      _opacity = 1.0;
    }
  }

  void change_timekeeping({required bool value}) => _timekeeping = value;
}

class ThemeManager {
  int _theme = 0;
  int get theme => _theme;

  void change({required int value}) {
    _theme = value;
    PrefManager.setInt(key: PrefKey.appTheme, value: value);
    Logger.s('- from ThemeManager \n >> save int theme = $theme');
  }

  bool isLight({required BuildContext context}) {
    final isLightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    final pref = theme;

    return (pref != 0) ? (pref == 1) : isLightMode;
  }
}

class LangManager {
  int _value = 0;
  int get value => _value;
  void change({required BuildContext context, required int lang}) {
    void locale(Locale locale) => context.setLocale(locale);
    const japanese = Locale('ja', 'JP');
    const english = Locale('en', 'US');
    _value = lang;
    switch (lang) {
      case 0:
        context.resetLocale();
        break;
      case 1:
        locale(japanese);
        break;
      case 2:
        locale(english);
        break;
    }
    PrefManager.setInt(key: PrefKey.changeLanguage, value: lang);
    Logger.s('- from LangManager \n >> save int lang = $lang');
  }
}

class ClockManager {
  bool _is24 = true;
  bool _showSec = true;
  int _animation = 0;
  bool get is24 => _is24;
  bool get showSec => _showSec;
  int get animation => _animation;

  void change_is24({required bool value}) {
    _is24 = value;
    PrefManager.setBool(key: PrefKey.clockStyle, value: value);
    Logger.s('- from ClockManager \n >> save bool is24 = $value');
  }

  void change_showSec({required bool value}) {
    _showSec = value;
    PrefManager.setBool(key: PrefKey.showSec, value: value);
    Logger.s('- from ClockManager \n >> save bool showSec = $value');
  }

  void change_animation({required int value}) {
    _animation = value;
    PrefManager.setInt(key: PrefKey.clockAnimation, value: value);
    Logger.s('- from ClockManager \n >> save int animation = $value');
  }
}

class ColorManager {
  // ignore: prefer_final_fields
  // var _color = EzAnimation.tween(
  //     ColorTween(begin: Colors.deepOrange, end: Colors.orangeAccent.shade200),
  //     const Duration(seconds: 1));

  ColorTween _color =
      ColorTween(begin: Colors.deepOrange, end: Colors.orangeAccent.shade200);
  double _opacity = 0;

  ColorTween get color => _color;
  double get opacity => _opacity;

  void change({required bool isLight}) {
    if (isLight) {
      _color = ColorTween(
          begin: Colors.deepOrange, end: Colors.orangeAccent.shade200);
    } else {
      _color = ColorTween(
          begin: Colors.deepOrange.shade800, end: Colors.blue.shade900);
    }
    _opacity = 1.0;
    // Logger.e('EZAnimation _color => ${_color.value}');
  }

  void stop() {
    _opacity = 0.0;
    exit();
  }

  static Future<void> exit() async {
    await FullScreen.exitFullScreen();
  }
}

class AlarmManager {
  int _alarmHour = 12;
  int _alarmMinute = 00;
  double _FABsize = 0;
  double _iconsize = 0;
  int get alarmHour => _alarmHour;
  int get alarmMinute => _alarmMinute;
  double get FABsize => _FABsize;
  double get iconsize => _iconsize;

  /// set internal time
  ///
  ///   ex.) 5:42 => 5:50
  void internal() {
    final now = DateTime.now();

    // in case n:00, make into n:10 forcedly.
    if (now.minute == 00) {
      _alarmMinute++;
    }

    final minute = (now.minute / 10).ceil() * 10;

    // in case n:53, it'll get n:60. So, make into n+1:00 forcedly.
    if (minute == 60) {
      _alarmHour = now.hour + 1;
      _alarmMinute = 0;
    } else {
      _alarmHour = now.hour;
      _alarmMinute = minute;
    }
    Logger.s(
        '- from AlarmManager \n > now = ${now.toString()}\n >> save int alarmHour = $_alarmHour\n >> save int alarmMinute = $_alarmMinute');
  }

  void change({required TimeOfDay value}) {
    _alarmHour = value.hour;
    _alarmMinute = value.minute;
  }

  Future<void> show() async {
    Logger.e('- from AlarmManager\n > showFAB called ! ');
    _iconsize = 0;
    _FABsize = 0;
    await Future<void>.delayed(const Duration(milliseconds: 300));
    _iconsize = 100;
    _FABsize = 40;
  }
}

class AlarmTimeKeepingManager {
  Duration _duration = const Duration(seconds: 1);
  Duration get duration => _duration;
  void start({required Duration duration}) {
    _duration = duration;
    print("duration =>" + duration.toString());
  }

  // late ColorTween _color;
  // ColorTween get color => _color;

  // void start({required Duration duration}) {
  //   _color = Tween(begin: Colors.blue, ), Duration.zero);
  // }

  // late EzAnimation _rate;
  // EzAnimation _color =
  //     EzAnimation.tween(Tween(begin: Colors.blue), Duration.zero);
  // EzAnimation get rate => _rate;
  // EzAnimation get color => _color;

  // void start({required Duration duration}) {
  //   _rate = EzAnimation(0.0, 1.0, duration);
  //   _color = EzAnimation.tween(Tween(begin: Colors.blue), Duration.zero);
  // }

  // void finish() {
  //   _color = EzAnimation.tween(
  //       Tween(begin: Colors.blue, end: ColorKey.orange.value),
  //       const Duration(milliseconds: 300));
  // }
}
