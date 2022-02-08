// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars, implementation_imports

import 'dart:async';

import 'package:dart_date/src/dart_date.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/helper/config.dart';
import 'package:majimo_timer/model/helper/notification.dart';
import 'package:majimo_timer/model/helper/plugin/circular_countdown_timer-0.2.0/circular_countdown_timer.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/helper/pref.dart';
import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/view/home/alarm/timekeeping/body.dart';
import 'package:majimo_timer/view/home/root/body.dart';
import 'package:ripple_backdrop_animate_route/ripple_backdrop_animate_route.dart';
import 'package:wakelock/wakelock.dart';

class GlobalController extends StateNotifier<GlobalState> {
  GlobalController() : super(const GlobalState());
  void change_isFirst({required bool value}) {
    state = state.copyWith(isFirst: value);
    PrefManager.setBool(key: PrefKey.isFirst, value: value);
    Logger.s('- from GlobalState \n >> save bool isFirst = ${state.isFirst}');
  }

  static void switch_full_screen({required bool value}) {
    if (value) {
      FlutterWindowManager.clearFlags(
          FlutterWindowManager.FLAG_DISMISS_KEYGUARD);
      FlutterWindowManager.clearFlags(
          FlutterWindowManager.FLAG_SHOW_WHEN_LOCKED);
    } else {
      FlutterWindowManager.clearFlags(
          FlutterWindowManager.FLAG_DISMISS_KEYGUARD);
      FlutterWindowManager.clearFlags(
          FlutterWindowManager.FLAG_SHOW_WHEN_LOCKED);
    }
  }
}

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
    await showFAB();
    change_showFAB(value: true);
    await Wakelock.disable();
    state = state.copyWith(opacity: 1);
    state = state.copyWith(status: 'まじもタイマーへようこそ！');

    await Future<void>.delayed(const Duration(seconds: 2));
    await change_status(text: DateTime.now().format('yMMMMEEEEd', t.lang.t));
  }

  Future<void> expand(int i) async {
    change_showFAB(value: false);
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

  void push_replace({required BuildContext context, required Widget page}) {
    Navigator.pushAndRemoveUntil<void>(context,
        MaterialPageRoute<void>(builder: (context) => page), (_) => false);
  }

  Future<void> showFAB() async {
    state = state.copyWith(showFAB: false);
    await Future<void>.delayed(const Duration(milliseconds: 300));
    state = state.copyWith(showFAB: true);
  }

  void change_showFAB({required bool value}) =>
      state = state.copyWith(showFAB: value);

  void change_current({required Duration value}) {
    final _value = ((value.inMilliseconds) / 100).round();
    state = state.copyWith(current: Duration(milliseconds: _value * 100));
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
    state = state.copyWith(lang: value);
    switch (value) {
      case 0:
        context.resetLocale();
        break;
      case 1:
        locale(const Locale('ja', 'JP'));
        break;
      case 2:
        locale(const Locale('en', 'US'));
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
    Logger.s('''
    - from AlarmState
    > now = ${now.toString()}
      >> save int alarmHour   =  ${state.alarmHour}
      >> save int alarmMinute =  ${state.alarmMinute}
    ''');
  }

  void change({required TimeOfDay value}) {
    state = state.copyWith(alarmHour: value.hour);
    state = state.copyWith(alarmMinute: value.minute);
  }
}

class AlarmTimeKeepingController extends StateNotifier<AlarmTimeKeepingState> {
  AlarmTimeKeepingController(this.read) : super(const AlarmTimeKeepingState());
  final Reader read;

  final controller = CountDownController();

  void start() {
    final _tar = calculate_duration(
        hour: read(alarmState).alarmHour, minute: read(alarmState).alarmMinute);
    final _duration = DateTimeRange(start: DateTime.now(), end: _tar).duration;
    state = state.copyWith(duration: _duration);
    Logger.i('tar => $_tar');
    Logger.i('duration => $_duration');
    status();
    NotificationManager().alarm_finish(target: _tar);
    NotificationManager().alarm_tk(target: _tar);
    GlobalController.switch_full_screen(value: false);
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

  DateTime calculate_duration({required int hour, required int minute}) {
    final _now = DateTime.now();
    final _val = TimeOfDay(hour: hour, minute: minute);
    final _now_int = (_now.hour * 3600) + (_now.minute * 60) + (_now.second);
    final _val_int = (_val.hour * 3600) + (_val.minute * 60);
    final _day = (_now_int < _val_int) ? _now.day : _now.day + 1;
    return DateTime(_now.year, _now.month, _day, _val.hour, _val.minute);
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
  TimerTimeKeepingController(this.read) : super(const TimerTimeKeepingState());
  final Reader read;

  final controller = CountDownController();

  void start() {
    change_fabMode(value: 0);
    final _target = DateTime.now().add(read(timerState).target);
    Logger.i(
        ' now     => ${DateTime.now()} \n duration  => ${read(timerState).target} \n target  => $_target');
    NotificationManager().timer_finish(target: _target);
    NotificationManager().timer_tk(target: _target);
    // controller.start();
  }

  void change_fabMode({required int value}) =>
      state = state.copyWith(fabMode: value);

  void pause() {
    controller.pause();
    NotificationManager().cancel_notification();
    change_fabMode(value: 1);
  }

  void resume() {
    final _target = DateTime.now().add(read(generalState).current);
    Logger.i(
        ' now     => ${DateTime.now()} \n current => ${read(generalState).current} \n target  => $_target');
    NotificationManager().timer_finish(target: _target);
    NotificationManager().timer_tk(target: _target);
    controller.resume();
    change_fabMode(value: 0);
  }
}
