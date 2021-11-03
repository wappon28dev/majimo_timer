// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/view/home/widget.dart';
import '../../main.dart';
import 'body.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/model/pref.dart';

class LangManager with ChangeNotifier {
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
    print("save int lang = " + lang.toString());
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

class ClockManager with ChangeNotifier {
  bool _is24 = true;
  bool get is24 => _is24;
  is24change({required bool value}) {
    _is24 = value;
    setBool(key: PrefKey.clockStyle, value: value);
    notifyListeners();
    print("save bool is24 = " + value.toString());
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

class ThemeManager with ChangeNotifier {
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

    print("save int theme = " + theme.toString());
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
