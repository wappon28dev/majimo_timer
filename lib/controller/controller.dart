// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars, implementation_imports

import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:dart_date/src/dart_date.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/helper/notification.dart';
import 'package:majimo_timer/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/helper/pref.dart';
import 'package:majimo_timer/helper/translations.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/view/home/alarm/timekeeping/body.dart';
import 'package:majimo_timer/view/home/root/body.dart';
import 'package:ripple_backdrop_animate_route/ripple_backdrop_animate_route.dart';
import 'package:wakelock/wakelock.dart';

import '../../../helper/config.dart';
import '../../../main.dart';

class GeneralController extends StateNotifier<GeneralState> {
  GeneralController() : super(const GeneralState());

  // change_value function
  void change_topToast({required bool value}) {
    state = state.copyWith(topToast: value);
    PrefManager.setBool(key: PrefKey.topToast, value: value);
    Logger.s(
        '- from GeneralState \n >> save bool toptoast = ${state.topToast}');
  }

  void change_toastDuration({required int value}) {
    (value == 0) ? value = 4 : null;
    state = state.copyWith(toastDuration: value);
    PrefManager.setInt(key: PrefKey.toastDuration, value: value);
    Logger.s(
        '- from GeneralState \n >> save int toastDuration = ${state.toastDuration}');
  }

  Future<void> home() async {
    await Wakelock.disable();
    state = state.copyWith(opacity: 1);
    state = state.copyWith(status: 'まじもタイマーへようこそ！');

    await Future<void>.delayed(const Duration(seconds: 2));
    await change_status(text: DateTime.now().format('yMMMMEEEEd', t.lang.t));
  }

  Future<void> expand(int i) async {
    await Wakelock.enable();
    await change_status(text: '置き時計モード');
    await Future<void>.delayed(const Duration(seconds: 3));
    await change_status(
        text: '${DateTime.now().format('yMMMMEEEEd', t.lang.t)}・$version');
  }

  Future<void> change_status({required String text}) async {
    state = state.copyWith(opacity: 0);
    await Future<void>.delayed(const Duration(milliseconds: 600));
    state = state.copyWith(opacity: 1);
    state = state.copyWith(status: text);
  }

  void push({required BuildContext context, required Widget page}) =>
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => page,
        ),
      );

  void push_home({required BuildContext context}) {
    Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(builder: (context) => const HomePage()),
        (_) => false);
    FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_DISMISS_KEYGUARD);
    FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SHOW_WHEN_LOCKED);
  }

  Future<void> showFAB() async {
    state = state.copyWith(showFAB: false);

    await Future<void>.delayed(const Duration(milliseconds: 300));
    state = state.copyWith(showFAB: true);
  }
}

class ThemeController extends StateNotifier<ThemeState> {
  ThemeController() : super(const ThemeState());
  // change_value functions
  void change({required int value}) {
    state = state.copyWith(theme: value);
    PrefManager.setInt(key: PrefKey.appTheme, value: value);
    Logger.s('- from ThemeState \n >> save int theme = ${state.theme}');
  }

  bool isLight({required BuildContext context}) {
    final isLightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    final pref = state.theme;

    return (pref != 0) ? (pref == 1) : isLightMode;
  }
}

class LangController extends StateNotifier<LangState> {
  LangController() : super(const LangState());
  void change({required BuildContext context, required int value}) {
    void locale(Locale locale) => context.setLocale(locale);
    const japanese = Locale('ja', 'JP');
    const english = Locale('en', 'US');
    state = state.copyWith(lang: value);
    switch (value) {
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
    PrefManager.setInt(key: PrefKey.changeLanguage, value: state.lang);
    Logger.s('- from LangState \n >> save int lang = ${state.lang}');
  }
}

class ClockController extends StateNotifier<ClockState> {
  ClockController() : super(const ClockState());
  // change_value functions
  void change_is24({required bool value}) {
    state = state.copyWith(is24: value);
    PrefManager.setBool(key: PrefKey.clockStyle, value: value);
    Logger.s('- from ClockState \n >> save bool is24 = $value');
  }

  void change_showSec({required bool value}) {
    state = state.copyWith(showSec: value);
    PrefManager.setBool(key: PrefKey.showSec, value: value);
    Logger.s('- from ClockState \n >> save bool showSec = $value');
  }

  void change_animation({required int value}) {
    state = state.copyWith(animation: value);
    PrefManager.setInt(key: PrefKey.clockAnimation, value: value);
    Logger.s('- from ClockState \n >> save int animation = $value');
  }
}

class ColorController extends StateNotifier<ColorState> {
  ColorController() : super(const ColorState());
  // change_value function
  Future<void> change({required bool isLight}) async {
    state = state.copyWith(opacity: 0);
    await Future<void>.delayed(const Duration(milliseconds: 100)); // 何故か必要
    state = state.copyWith(opacity: 1);
  }

  void stop() {
    state = state.copyWith(opacity: 0);
    exit();
  }

  static Future<void> exit() async {
    await FullScreen.exitFullScreen();
  }
}

class AlarmController extends StateNotifier<AlarmState> {
  AlarmController() : super(const AlarmState());

  void push({required BuildContext context, required WidgetRef ref}) {
    Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(
            builder: (context) => const AlarmTimeKeepingPage()),
        (_) => false);

    ref.read(generalState.notifier).showFAB();
    ref.read(alarmTKState.notifier).start();
  }

  void tooltip({required BuildContext context}) {
    // Navigator.of(context).push(TransparentRoute(
    //   builder: (BuildContext context) => RippleBackdropAnimatePage(
    //       childFade: true,
    //       duration: 300,
    //       blurRadius: 20,
    //       bottomHeight: 0,
    //       child: Center(child: Text('test widget'))),
    // ));
    RippleBackdropAnimatePage.show(
        context: context,
        childFade: true,
        duration: 300,
        blurRadius: 20,
        bottomHeight: 110,
        child: GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            // onTap: () => Navigator.of(context).pop(),
            child: const Text('test widget',
                style: TextStyle(color: Colors.white))));
  }

  // change_value function
  /// set internal time
  ///
  ///   ex.) 5:42 => 5:50
  void internal() {
    final now = DateTime.now();

    // in case n:00, make into n:10 forcedly.
    if (now.minute == 00) {
      state = state.copyWith(alarmMinute: state.alarmMinute + 1);
    }

    final minute = (now.minute / 10).ceil() * 10;

    // in case n:53, it'll get n:60. So, make into n+1:00 forcedly.
    if (minute == 60) {
      state = state.copyWith(alarmHour: now.hour + 1);
      state = state.copyWith(alarmMinute: 0);
    } else {
      state = state.copyWith(alarmHour: now.hour);
      state = state.copyWith(alarmMinute: minute);
    }
    Logger.s(
        '- from AlarmState \n > now = ${now.toString()}\n >> save int alarmHour = ${state.alarmHour}\n >> save int alarmMinute = ${state.alarmMinute}');
  }

  void change({required TimeOfDay value}) {
    state = state.copyWith(alarmHour: value.hour);
    state = state.copyWith(alarmMinute: value.minute);
  }
}

class AlarmTimeKeepingController extends StateNotifier<AlarmTimeKeepingState> {
  AlarmTimeKeepingController(this.read) : super(const AlarmTimeKeepingState());
  final Reader read;

  // change_value function
  void start() {
    final _target = read(alarmState).get_value();
    final _now = DateTime.now();
    final _tar =
        DateTime(_now.year, _now.month, _now.day, _target.hour, _target.minute);

    late Duration _duration;

    try {
      _duration = DateTimeRange(start: _now, end: _tar).duration;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      final _tar = DateTime(
          _now.year, _now.month, _now.day + 1, _target.hour, _target.minute);
      _duration = DateTimeRange(start: _now, end: _tar).duration;
    }
    state = state.copyWith(duration: _duration);
    final _rate = _duration.inSeconds / state.duration.inSeconds;
    Logger.i(' ${_duration.inSeconds} / ${state.duration.inSeconds} = $_rate');

    state = state.copyWith(rate: _rate);

    Logger.i('duration => $_duration');
    Logger.i('tar => $_tar');
    status();
    NotificationManager().alarm_finish(target: _tar);
    NotificationManager().alarm_tk(target: _tar);
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_DISMISS_KEYGUARD);
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SHOW_WHEN_LOCKED);
  }

  void onTimer(Timer timer) {
    final _target = read(alarmState).get_value();

    final _now = DateTime.now();
    final _tar =
        DateTime(_now.year, _now.month, _now.day, _target.hour, _target.minute);

    late Duration _duration;

    try {
      _duration = DateTimeRange(start: _now, end: _tar).duration;
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      final _tar = DateTime(
          _now.year, _now.month, _now.day + 1, _target.hour, _target.minute);
      _duration = DateTimeRange(start: _now, end: _tar).duration;
    }
    final _rate = _duration.inSeconds / state.duration.inSeconds;
    Logger.i(' ${_duration.inSeconds} / ${state.duration.inSeconds} = $_rate');

    state = state.copyWith(rate: _rate);
    Logger.i('onTimer => $_duration');
  }

  Future<void> status() async {
    late String duration;

    duration = '約 ${state.duration.inMinutes} 分間';
    if (state.duration.inSeconds < 60) {
      duration = '１分未満';
    }
    if (state.duration.inMinutes > 60) {
      duration = '約 ${state.duration.inHours} 時間';
    }
    await read(generalState.notifier).change_status(text: '終了まで $duration です');

    await Future<void>.delayed(const Duration(seconds: 5));
    await read(generalState.notifier).change_status(text: 'アラームモード');
  }
}

class TimerController extends StateNotifier<TimerState> {
  TimerController() : super(const TimerState());

  void change_target({required int value}) {
    state = state.copyWith(target: Duration(minutes: value));
    PrefManager.setInt(key: PrefKey.timerTarget, value: value);
    Logger.s('- from TimerState \n >> save int timerTarget = $value');
  }

  void change_interval({required int value}) {
    state = state.copyWith(interval: Duration(minutes: value));
    PrefManager.setInt(key: PrefKey.timerInterval, value: value);
    Logger.s('- from TimerState \n >> save int timerInterval = $value');
  }
}

class TimerTimeKeepingController extends StateNotifier<TimerTimeKeepingState> {
  TimerTimeKeepingController() : super(const TimerTimeKeepingState());

  final controller = CountDownController();
  void restart() => controller.restart();
}
