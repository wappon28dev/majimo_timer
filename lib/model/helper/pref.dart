import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKey {
  isFirst, // bool: isFirst ?
  changeLanguage, //int: 0 = system, 1 = Japanese, 2 = English
  clockStyle, //bool: true = 24h, false = 12h
  appTheme, //int: 0 = system, 1 = light, 2 = dark
  topToast, //bool: toptoast
  toastDuration, //int: Duration of toast notification
  clockAnimation, //int: Curve of Clock Animation
  showSec, // bool: show clock seconds
  timerTarget, // int: timerTarget in minute
  timerInterval, // int: timerInterval in minute
  timerIntervalNum, // int: how many intervals of timer
  isUsingMaterialYou, // bool: is using Material You (Android 12 only)
  seedColor, // Color: app's seedColor
}

class PrefManager {
  Future<void> restore(WidgetRef ref, BuildContext context) async {
    var isFirst = await getBool(key: PrefKey.isFirst);
    var is24 = await getBool(key: PrefKey.clockStyle);
    var theme = await getInt(key: PrefKey.appTheme);
    var lang = await getInt(key: PrefKey.changeLanguage);
    var topToast = await getBool(key: PrefKey.topToast);
    var toastDuration = await getInt(key: PrefKey.toastDuration);
    var clockAnimation = await getInt(key: PrefKey.clockAnimation);
    var showSec = await getBool(key: PrefKey.showSec);
    var timerTarget = await getInt(key: PrefKey.timerTarget);
    var timerInterval = await getInt(key: PrefKey.timerInterval);
    var timerIntervalNum = await getInt(key: PrefKey.timerIntervalNum);
    var isUsingMaterialYou = await getBool(key: PrefKey.isUsingMaterialYou);
    var seedColor = await getInt(key: PrefKey.seedColor);

    Logger.r(
      '''
      restore values :
        >> bool  isFirst             =   $isFirst
        >> bool  is24                =   $is24
        >> int   theme               =   $theme
        >> int   lang                =   $lang
        >> bool  topToast            =   $topToast
        >> int   toastDuration       =   $toastDuration 
        >> int   clockAnimation      =   $clockAnimation
        >> bool  showSec             =   $showSec
        >> int   timerTarget         =   $timerTarget
        >> int   timerInterval       =   $timerInterval
        >> int   timerIntervalNum    =   $timerIntervalNum
        >> bool  isUsingMaterialYou  =   $isUsingMaterialYou
        >> int   seedColor           =   $seedColor
      ''',
    );

    if (isFirst == null) {
      Logger.e('Warning! : _isFirst is null! => true');
    }
    if (is24 == null) {
      Logger.r('Warning! : _is24 is null => true');
    }
    if (theme == null) {
      Logger.r('Warning! : _theme is null => true');
    }
    if (lang == null) {
      Logger.r('Warning! : _lang is null => true');
    }
    if (topToast == null) {
      Logger.r('Warning! : _is24 is null => true');
    }
    if (toastDuration == null) {
      Logger.r('Warning! : _toastDuration is null => 4');
    }
    if (clockAnimation == null) {
      Logger.r('Warning! : _clockAnimation is null => 0');
    }
    if (showSec == null) {
      Logger.r('Warning! : _showSec is null => true');
    }
    if (timerTarget == null) {
      Logger.e('Warning! : _timerTarget is null! => 30');
    }
    if (timerInterval == null) {
      Logger.e('Warning! : _timerInterval is null! => 30');
    }
    if (timerIntervalNum == null) {
      Logger.e('Warning! : timerIntervalNum is null! => 1');
    }
    if (isUsingMaterialYou == null) {
      Logger.e('Warning! : isUsingMaterialYou is null! => false');
    }
    if (seedColor == null) {
      Logger.e('Warning! : seedColor is null! => 0xffff5722');
    }

    isFirst ??= true;
    is24 ??= true;
    theme ??= 0;
    lang ??= 0;
    topToast ??= true;
    toastDuration ??= 4;
    clockAnimation ??= 0;
    showSec ??= true;
    timerTarget ??= 30;
    timerInterval ??= 30;
    timerIntervalNum ??= 1;
    isUsingMaterialYou ??= false;
    seedColor ??= 0xffff5722;

    final globalFunc = ref.read(globalState.notifier);
    final generalFunc = ref.read(generalState.notifier);
    final themeFunc = ref.read(themeState.notifier);
    final langFunc = ref.read(langState.notifier);
    final clockFunc = ref.read(clockState.notifier);
    final timerFunc = ref.read(timerState.notifier);

    globalFunc.updateIsFirst(value: isFirst);
    clockFunc.updateIs24(value: is24);
    themeFunc
      ..updateTheme(value: theme)
      ..updateIsUsingMaterialYou(value: isUsingMaterialYou)
      ..updateSeedColor(value: Color(seedColor));
    langFunc.updateLang(context: context, value: lang);
    generalFunc
      ..updateTopToast(value: topToast)
      ..updateToastDuration(value: toastDuration);
    clockFunc
      ..updateAnimation(value: clockAnimation)
      ..updateShowSec(value: showSec);
    timerFunc
      ..updateTargetDuration(value: timerTarget)
      ..updateTargetIntervalDuration(value: timerInterval)
      ..updateIntervalLoopingNum(value: timerIntervalNum);
  }

  Future<bool?> getBool({required PrefKey key}) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getBool(key.toString());
    return result;
  }

  Future<int?> getInt({required PrefKey key}) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getInt(key.toString());
    return result;
  }

  Future<void> setBool({
    required PrefKey key,
    required bool value,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key.toString(), value);
  }

  Future<void> setInt({required PrefKey key, required int value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key.toString(), value);
  }

  Future<void> remove({required Type key}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key.toString());
  }

  Future<void> allremove() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
