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
  alarmTK, // bool alarmTimeKeeping
  isAlarmFinish, // bool isAlarmFinish

}

class PrefManager {
  static Future<void> restore(WidgetRef ref, BuildContext context) async {
    var _is24 = await PrefManager.getBool(key: PrefKey.clockStyle);
    var _theme = await PrefManager.getInt(key: PrefKey.appTheme);
    var _lang = await PrefManager.getInt(key: PrefKey.changeLanguage);
    var _topToast = await PrefManager.getBool(key: PrefKey.topToast);
    var _toastDuration = await PrefManager.getInt(key: PrefKey.toastDuration);
    var _clockAnimation = await PrefManager.getInt(key: PrefKey.clockAnimation);
    var _showSec = await PrefManager.getBool(key: PrefKey.showSec);
    var _alarmTK = await PrefManager.getBool(key: PrefKey.showSec);
    var _isAlarmFinish = await PrefManager.getBool(key: PrefKey.showSec);

    Logger.r(' >> restore bool is24 = $_is24 \n'
        '>> restore int theme = $_theme \n '
        '>> restore int lang = $_lang \n'
        '>> restore bool topToast = $_topToast \n'
        '>> restore int toastDuration = $_toastDuration \n'
        '>> restore int clockAnimation = $_clockAnimation \n'
        '>> restore bool showSec = $_showSec \n'
        '>> restore bool alarmTK = $_alarmTK \n'
        '>> restore bool isAlarmFinish = $_isAlarmFinish \n');

    if (_is24 == null) {
      Logger.r('Warning! : _is24 is null => true');
    }
    if (_theme == null) {
      Logger.r('Warning! : _theme is null => true');
    }
    if (_lang == null) {
      Logger.r('Warning! : _lang is null => true');
    }
    if (_topToast == null) {
      Logger.r('Warning! : _is24 is null => true');
    }
    if (_toastDuration == null) {
      Logger.r('Warning! : _toastDuration is null => 4');
    }
    if (_clockAnimation == null) {
      Logger.r('Warning! : _clockAnimation is null => 0');
    }
    if (_showSec == null) {
      Logger.r('Warning! : _showSec is null => true');
    }
    if (_alarmTK == null) {
      Logger.r('Warning! : _alarmTK is null => false');
    }
    if (_isAlarmFinish == null) {
      Logger.r('Warning! : _isAlarmFinish is null => false');
    }

    _is24 ??= true;
    _theme ??= 0;
    _lang ??= 0;
    _topToast ??= true;
    _toastDuration ??= 4;
    _clockAnimation ??= 0;
    _showSec ??= true;
    _alarmTK ??= false;
    _isAlarmFinish ??= false;

    ref.read(clockManager.notifier).change_is24(value: _is24);
    ref.read(themeManager.notifier).change(value: _theme);
    ref.read(langManager.notifier).change(context: context, value: _lang);
    ref.read(generalManager.notifier).change_topToast(value: _topToast);
    ref
        .read(generalManager.notifier)
        .change_toastDuration(value: _toastDuration);
    ref.read(clockManager.notifier).change_animation(value: _clockAnimation);
    ref.read(clockManager.notifier).change_showSec(value: _showSec);
    ref.read(alarmTimeKeepingManager.notifier).change_alarmTK(value: _alarmTK);
    ref
        .read(alarmTimeKeepingManager.notifier)
        .change_isAlarmFinish(value: _isAlarmFinish);
  }

  static Future<bool?> getBool({required PrefKey key}) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getBool(key.toString());
    return result;
  }

  static Future<int?> getInt({required PrefKey key}) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getInt(key.toString());
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
