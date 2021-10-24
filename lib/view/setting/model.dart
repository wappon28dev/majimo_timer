import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/view/home/widget.dart';
import '../../main.dart';
import 'body.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/model/pref.dart';

class LangChanger with ChangeNotifier {
  changelang({required BuildContext context, required int lang}) {
    void locale(Locale locale) => context.setLocale(locale);
    Locale japanese = const Locale('ja', 'JP');
    Locale english = const Locale('en', 'US');
    if (lang == 0) {
      context.resetLocale();
      setInt(key: PrefKey.changeLanguage, value: 0);
    }
    if (lang == 1) {
      locale(japanese);
      setInt(key: PrefKey.changeLanguage, value: 1);
    }
    if (lang == 2) {
      locale(english);
      setInt(key: PrefKey.changeLanguage, value: 2);
    }
    notifyListeners();
    print("save int lang = " + lang.toString());
  }
}

class ClockChanger with ChangeNotifier {
  bool _is24 = true;
  bool get is24 => _is24;
  is24changer(bool mode) {
    _is24 = mode;
    setBool(key: PrefKey.clockStyle, value: mode);
    notifyListeners();
    print("save bool is24 = " + mode.toString());
  }
}

class ThemeChanger with ChangeNotifier {
  ThemeMode _theme = ThemeMode.system;
  ThemeMode get theme => _theme;
  changetheme({required int theme}) {
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

  thememode() {
    if (_theme == ThemeMode.light) {
      return 'light'.tr();
    }
    if (_theme == ThemeMode.dark) {
      return 'dark'.tr();
    }
    if (_theme == ThemeMode.system) {
      return 'system'.tr();
    }
  }

  thememodeicon() {
    if (_theme == ThemeMode.system) {
      return Icons.settings_brightness;
    }
    if (_theme == ThemeMode.light) {
      return Icons.brightness_7;
    }
    if (_theme == ThemeMode.dark) {
      return Icons.nights_stay;
    }
  }
}
