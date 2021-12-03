import 'package:ezanimation/ezanimation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import '../../../main.dart';
import 'pref.dart';
import 'theme.dart';

class ThemeManager extends ChangeNotifier {
  ThemeMode _theme = ThemeMode.system;
  ThemeMode get theme => _theme;
  change({required int theme}) {
    if (theme == 0) {
      _theme = ThemeMode.system;
      PrefManager.setInt(key: PrefKey.appTheme, value: 0);
    }
    if (theme == 1) {
      _theme = ThemeMode.light;
      PrefManager.setInt(key: PrefKey.appTheme, value: 1);
    }
    if (theme == 2) {
      _theme = ThemeMode.dark;
      PrefManager.setInt(key: PrefKey.appTheme, value: 2);
    }
    notifyListeners();

    Logger.s(
        "- from ThemeManager \n" + " >> save int theme = " + theme.toString());
  }

  /// ```
  ///  int mode 0 => return String
  ///           1 => return Icon
  ///           2 => return int 0,1,2
  /// ```
  get({required int mode}) {
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
  change(
      {required WidgetRef ref,
      required BuildContext context,
      required int lang}) {
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
  ///           1 => return String date
  /// ```
  get({required int mode}) {
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
    PrefManager.setBool(key: PrefKey.clockStyle, value: value);
    notifyListeners();
    Logger.s(
        "- from ClockManager \n" + " >> save bool is24 = " + value.toString());
  }

  /// ```
  ///  int mode 0 => return String for clock style name
  ///           1 => return Icon
  ///           2 => return bool
  /// ```
  is24get({required int mode}) {
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
    ColorTween(begin: MyTheme.getcolor(ColorKey.orange), end: null),
    const Duration(seconds: 1),
  );
  EzAnimation get color => _color;
  final opacity = EzAnimation(0.0, 1.0, const Duration(seconds: 1));

  define({required bool value}) {
    if (value) {
      _color = EzAnimation.tween(
        ColorTween(
            begin: MyTheme.getcolor(ColorKey.orange),
            end: Colors.orangeAccent.shade200),
        const Duration(seconds: 1),
      );
    } else {
      _color = EzAnimation.tween(
        ColorTween(
            begin: MyTheme.getcolor(ColorKey.orange),
            end: Colors.blue.shade900),
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
  ///  int mode 0 => return Colors for clock
  ///           1 => return Colors for end color
  ///           2 => return String for lottie
  /// ```
  get(WidgetRef ref, int mode, BuildContext context) {
    switch (mode) {
      case (0):
        return (MyTheme.isLight(ref: ref, context: context))
            ? Colors.black
            : Colors.white;
      case (1):
        return (MyTheme.isLight(ref: ref, context: context))
            ? Colors.orangeAccent.shade200
            : Colors.blue.shade900;
      case (2):
        return (MyTheme.isLight(ref: ref, context: context))
            ? 'assets/splash/sun.json'
            : 'assets/splash/wolf.json';
    }
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
  get(int mode, WidgetRef ref) {
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
        return ref.read(alarmManager).alarmHour < 12;
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
