import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKey {
  changeLanguage, //int 0 = system, 1 = Japanese, 2 = English
  clockStyle, //bool true = 24h, false = 12h
  appTheme, //int 0 = system, 1 = light, 2 = dark
  topToast, //bool toptoast
  toastDuration, //int Duration of toast notification
}

// extension TypeExtension on ValueKey {
//   String? get valueKey => valueKeys[this];
//   static final valueKeys = {
//     ValueKey.pref1: 'ChangeLanguage',
//     ValueKey.pref2: 'ClockStyle',
//     ValueKey.pref3: 'AppTheme'
//   };
// }

class PrefManager {
  static void restore(WidgetRef ref, BuildContext context) async {
    final _is24 = await PrefManager.getBool(key: PrefKey.clockStyle);
    final _theme = await PrefManager.getInt(key: PrefKey.appTheme);
    final _lang = await PrefManager.getInt(key: PrefKey.changeLanguage);
    final _topToast = await PrefManager.getBool(key: PrefKey.topToast);
    final _toastDuration = await PrefManager.getInt(key: PrefKey.toastDuration);
    Logger.r(" >> restore bool is24 = " +
        _is24.toString() +
        "\n >> restore int theme = " +
        _theme.toString() +
        "\n >> restore int lang = " +
        _lang.toString() +
        "\n >> restore bool topToast = " +
        _topToast.toString() +
        "\n >> restore int toastDuration = " +
        _toastDuration.toString());
    ref.read(clockManager).change_is24(value: _is24);
    ref.read(themeManager).change(theme: _theme);
    ref.read(langManager).change(context: context, lang: _lang);
    ref.read(generalManager).change_topToast(value: _topToast);
    ref.read(generalManager).change_toastDuration(value: _toastDuration);
  }

  static Future<bool> getBool({required PrefKey key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = prefs.getBool(key.toString()) ?? true;
    return result;
  }

  static Future<int> getInt({required PrefKey key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int result = prefs.getInt(key.toString()) ?? 0;
    return result;
  }

  static void setBool({required PrefKey key, required bool value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key.toString(), value);
  }

  static void setInt({required PrefKey key, required int value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key.toString(), value);
  }

  static void remove({required Type key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key.toString());
  }

  static void allremove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
