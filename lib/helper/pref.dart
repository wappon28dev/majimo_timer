// ignore_for_file: avoid_classes_with_only_static_members, depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/helper/plugin/let_log/let_log.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKey {
  changeLanguage, //int 0 = system, 1 = Japanese, 2 = English
  clockStyle, //bool true = 24h, false = 12h
  appTheme, //int 0 = system, 1 = light, 2 = dark
  topToast, //bool toptoast
  toastDuration, //int Duration of toast notification
  clockAnimation, //int Curve of Clock Animation
  showSec, // bool show clock seconds
  timerTarget, // int timerTarget in minute
  timerInterval, // int timerInterval in minute
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
    var _timerTarget = await PrefManager.getInt(key: PrefKey.timerTarget);
    var _timerInterval = await PrefManager.getInt(key: PrefKey.timerInterval);

    Logger.r('''
      restore values :
        >> bool  is24            =   $_is24
        >> int   theme           =   $_theme
        >> int   lang            =   $_lang
        >> bool  topToast        =   $_topToast
        >> int   toastDuration   =   $_toastDuration 
        >> int   clockAnimation  =   $_clockAnimation
        >> bool  showSec         =   $_showSec
        >> int   timerTarget     =   $_timerTarget
        >> int   timerInterval   =   $_timerInterval
      ''');

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

    if (_timerTarget == null) {
      Logger.e('Warning! : _timerTarget is null! => 30');
    }

    if (_timerInterval == null) {
      Logger.e('Warning! : _timerInterval is null! => 30');
    }

    _is24 ??= true;
    _theme ??= 0;
    _lang ??= 0;
    _topToast ??= true;
    _toastDuration ??= 4;
    _clockAnimation ??= 0;
    _showSec ??= true;
    _timerTarget ??= 30;
    _timerInterval ??= 30;

    ref.read(clockState.notifier).change_is24(value: _is24);
    ref.read(themeState.notifier).change(value: _theme);
    ref.read(langState.notifier).change(context: context, value: _lang);
    ref.read(generalState.notifier).change_topToast(value: _topToast);
    ref.read(generalState.notifier).change_toastDuration(value: _toastDuration);
    ref.read(clockState.notifier).change_animation(value: _clockAnimation);
    ref.read(clockState.notifier).change_showSec(value: _showSec);
    ref.read(timerState.notifier).change_target(value: _timerTarget);
    ref.read(timerState.notifier).change_interval(value: _timerInterval);
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
