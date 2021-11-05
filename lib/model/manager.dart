import 'package:ezanimation/ezanimation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/plugin/let_log.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import '../../../main.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'pref.dart';
import 'theme.dart';

class ThemeManager extends ChangeNotifier {
  ThemeMode _theme = ThemeMode.system;
  ThemeMode get theme => _theme;
  change({required int theme}) {
    if (theme == 0) {
      _theme = ThemeMode.system;
      setInt(key: PrefKey.appTheme, value: 0);
    }
    if (theme == 1) {
      _theme = ThemeMode.light;
      setInt(key: PrefKey.appTheme, value: 1);
    }
    if (theme == 2) {
      _theme = ThemeMode.dark;
      setInt(key: PrefKey.appTheme, value: 2);
    }
    notifyListeners();

    Logger.s(
        "- from ThemeManager \n" + " >> save int theme = " + theme.toString());
  }

  get({required int mode}) {
    // int mode : 0 => return text,
    //            1 => return icon,
    //            2 => return int (theme number)
    switch (mode) {
      case (0):
        if (_theme == ThemeMode.system) {
          return 'system'.tr();
        }
        if (_theme == ThemeMode.light) {
          return 'light'.tr();
        }
        if (_theme == ThemeMode.dark) {
          return 'dark'.tr();
        }
        break;
      case (1):
        if (_theme == ThemeMode.system) {
          return const Icon(Icons.settings_brightness);
        }
        if (_theme == ThemeMode.light) {
          return const Icon(Icons.brightness_7);
        }
        if (_theme == ThemeMode.dark) {
          return const Icon(Icons.nights_stay);
        }
        break;
      case (2):
        if (_theme == ThemeMode.system) {
          return 0;
        }
        if (_theme == ThemeMode.light) {
          return 1;
        }
        if (_theme == ThemeMode.dark) {
          return 2;
        }
        break;
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
      setInt(key: PrefKey.changeLanguage, value: 0);
    }
    if (lang == 1) {
      _value = 1;
      locale(japanese);
      setInt(key: PrefKey.changeLanguage, value: 1);
    }
    if (lang == 2) {
      _value = 2;
      locale(english);
      setInt(key: PrefKey.changeLanguage, value: 2);
    }
    notifyListeners();
    Logger.s(
        "- from LangManager \n" + " >> save int lang = " + lang.toString());
  }

  get({required int mode}) {
    // int mode : 0 => return text,
    //            1 => return icon,
    //            2 => return int (theme number)
    switch (mode) {
      case (0):
        if (value == 0) {
          return 'system'.tr();
        }
        if (value == 1) {
          return "日本語/Japanese";
        }
        if (value == 2) {
          return "英語/English";
        }
        break;
      case (1):
        return null;
      case (2):
        return null;
    }
  }
}

class ClockManager extends ChangeNotifier {
  bool _is24 = true;
  bool get is24 => _is24;
  is24change({required bool value}) {
    _is24 = value;
    setBool(key: PrefKey.clockStyle, value: value);
    notifyListeners();
    Logger.s(
        "- from ClockManager \n" + " >> save bool is24 = " + value.toString());
  }

  is24get({required int mode}) {
    // int mode : 0 => return text,
    //            1 => return icon,
    //            2 => return int (theme number)
    switch (mode) {
      case (0):
        return (_is24) ? '24style'.tr() : '12style'.tr();
      case (1):
        return (_is24)
            ? const Icon(Icons.share_arrival_time_outlined)
            : const Icon(Icons.share_arrival_time);
      case (2):
        return (_is24) ? true : false;
    }
  }
}

class ColorManager extends ChangeNotifier {
  EzAnimation _color = EzAnimation.tween(
    ColorTween(begin: MyTheme.getcolor("orange"), end: null),
    // end: MyTheme.getcolor("darkblue")),
    const Duration(seconds: 1),
  );
  EzAnimation get color => _color;
  final opacity = EzAnimation(0.0, 1.0, const Duration(seconds: 1));

  define({required bool value}) {
    if (value) {
      _color = EzAnimation.tween(
        ColorTween(
            begin: MyTheme.getcolor("orange"),
            end: Colors.orangeAccent.shade200),
        // end: MyTheme.getcolor("darkblue")),
        const Duration(seconds: 1),
      );
    } else {
      _color = EzAnimation.tween(
        ColorTween(
            begin: MyTheme.getcolor("orange"), end: Colors.blue.shade900),
        // end: MyTheme.getcolor("darkblue")),
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

  get(int mode, BuildContext context) {
    switch (mode) {
      case (0):
        return (MyTheme.isLight(context)) ? Colors.black : Colors.white;
      case (1):
        return (MyTheme.isLight(context))
            ? Colors.orangeAccent.shade200
            : Colors.blue.shade900;
      case (2):
        return (MyTheme.isLight(context))
            ? 'assets/splash/sun.json'
            : 'assets/splash/wolf.json';
    }
  }

  stop() {
    exit();
  }

  static void exit() async {
    await FullScreen.exitFullScreen();
  }
}

class AlarmManager extends ChangeNotifier {
  int _alarmHour = 12;
  int _alarmMinute = 00;
  int get alarmHour => _alarmHour;
  int get alarmMinute => _alarmMinute;

  state({required TimeOfDay value}) {
    _alarmHour = value.hour;
    _alarmMinute = value.minute;
    notifyListeners();
  }

  change({required TimeOfDay value}) {
    _alarmHour = value.hour;
    _alarmMinute = value.minute;
    setInt(key: PrefKey.alarmHour, value: _alarmHour);
    setInt(key: PrefKey.alarmMinute, value: _alarmMinute);
    Logger.s("- from AlarmManager \n" +
        " >> save int alarmHour = " +
        _alarmHour.toString() +
        "\n >> save int alarmMinute = " +
        _alarmMinute.toString());
    notifyListeners();
  }

  get() {
    TimeOfDay value = TimeOfDay(hour: _alarmHour, minute: _alarmMinute);
    return value;
  }
}
