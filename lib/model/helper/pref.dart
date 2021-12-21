// ignore_for_file: avoid_classes_with_only_static_members, depend_on_referenced_packages

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
  clockAnimation, //int Curve of Clock Animation
  showSec, // bool show clock seconds
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
  static Future<void> restore(WidgetRef ref, BuildContext context) async {
    final _is24 = await PrefManager.getBool(key: PrefKey.clockStyle);
    final _theme = await PrefManager.getInt(key: PrefKey.appTheme);
    final _lang = await PrefManager.getInt(key: PrefKey.changeLanguage);
    final _topToast = await PrefManager.getBool(key: PrefKey.topToast);
    final _toastDuration = await PrefManager.getInt(key: PrefKey.toastDuration);
    final _clockAnimation =
        await PrefManager.getInt(key: PrefKey.clockAnimation);
    final _showSec = await PrefManager.getBool(key: PrefKey.showSec);

    Logger.r(
        ' >> restore bool is24 = $_is24\n >> restore int theme = $_theme\n >> restore int lang = $_lang\n >> restore bool topToast = $_topToast\n >> restore int toastDuration = $_toastDuration\n >> restore int clockAnimation = $_clockAnimation\n >> restore bool showSec = $_showSec');

    ref.read(clockManager.notifier).change_is24(value: _is24);
    ref.read(themeManager.notifier).change(value: _theme);
    ref.read(langManager.notifier).change(context: context, value: _lang);
    ref.read(generalManager.notifier).change_topToast(value: _topToast);
    ref
        .read(generalManager.notifier)
        .change_toastDuration(value: _toastDuration);
    ref.read(clockManager.notifier).change_animation(value: _clockAnimation);
    ref.read(clockManager.notifier).change_showSec(value: _showSec);
  }

  static Future<bool> getBool({required PrefKey key}) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getBool(key.toString()) ?? true;
    return result;
  }

  static Future<int> getInt({required PrefKey key}) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getInt(key.toString()) ?? 0;
    return result;
  }

  static Future<void> setBool(
      {required PrefKey key, required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key.toString(), value);
  }

  static Future<void> setInt({required PrefKey key, required int value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key.toString(), value);
  }

  static Future<void> remove({required Type key}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key.toString());
  }

  static Future<void> allremove() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
