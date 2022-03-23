import 'dart:async';
import 'dart:io';

import 'package:dart_date/dart_date.dart';
import 'package:easy_localization/easy_localization.dart';
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
import 'package:ripple_backdrop_animate_route/ripple_backdrop_animate_route.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wakelock/wakelock.dart';

class GlobalController extends StateNotifier<GlobalState> {
  GlobalController() : super(const GlobalState());
  void updateIsFirst({required bool value}) {
    state = state.copyWith(isFirst: value);
    PrefManager().setBool(key: PrefKey.isFirst, value: value);
    Logger.s('- from GlobalState \n >> save bool isFirst = ${state.isFirst}');
  }

  static void switchFullScreen({required bool value}) {
    if (Platform.isAndroid) {
      if (value) {
        FlutterWindowManager.clearFlags(
          FlutterWindowManager.FLAG_DISMISS_KEYGUARD,
        );
        FlutterWindowManager.clearFlags(
          FlutterWindowManager.FLAG_SHOW_WHEN_LOCKED,
        );
      } else {
        FlutterWindowManager.clearFlags(
          FlutterWindowManager.FLAG_DISMISS_KEYGUARD,
        );
        FlutterWindowManager.clearFlags(
          FlutterWindowManager.FLAG_SHOW_WHEN_LOCKED,
        );
      }
    }
  }
}

class GeneralController extends StateNotifier<GeneralState> {
  GeneralController() : super(const GeneralState());

  // change_value function
  void updateTopToast({required bool value}) {
    state = state.copyWith(topToast: value);
    PrefManager().setBool(key: PrefKey.topToast, value: value);
    Logger.s(
      '- from GeneralState \n >> save bool toptoast = ${state.topToast}',
    );
  }

  void updateToastDuration({required int value}) {
    state = state.copyWith(toastDuration: value);
    PrefManager().setInt(key: PrefKey.toastDuration, value: value);
    Logger.s(
      '- from GeneralState'
      '\n >> save int toastDuration = ${state.toastDuration}',
    );
  }

  Future<void> whenHome() async {
    await runFAB();
    updateShowFAB(value: true);
    await Wakelock.disable();
    state = state.copyWith(opacity: 1);
    state = state.copyWith(status: t.greetings.t);

    await Future<void>.delayed(const Duration(seconds: 2));
    await updateStatus(text: DateTime.now().format('yMMMMEEEEd', t.lang.t));
  }

  Future<void> whenExpand() async {
    updateShowFAB(value: false);
    await Wakelock.enable();
    await updateStatus(text: '置き時計モード');
    await Future<void>.delayed(const Duration(seconds: 3));
    await updateStatus(
      text: '${DateTime.now().format('yMMMMEEEEd', t.lang.t)}'
          '・${AppDataStore().versionStr}',
    );
  }

  Future<void> updateStatus({required String text}) async {
    state = state.copyWith(opacity: 0);
    await Future<void>.delayed(const Duration(milliseconds: 600));
    state = state.copyWith(opacity: 1);
    state = state.copyWith(status: text);
  }

  void runPush({
    required BuildContext context,
    required Widget page,
    required bool isReplace,
  }) =>
      !isReplace
          ? Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => page,
              ),
            )
          : Navigator.pushAndRemoveUntil<void>(
              context,
              MaterialPageRoute<void>(builder: (context) => page),
              (_) => false,
            );

  Future<void> runFAB() async {
    state = state.copyWith(showFAB: false);
    await Future<void>.delayed(const Duration(milliseconds: 300));
    state = state.copyWith(showFAB: true);
  }

  void updateShowFAB({required bool value}) =>
      state = state.copyWith(showFAB: value);

  Future<void> runURL({required String url}) async {
    await launch(url);
  }
}

class CurrentDurationController extends StateNotifier<CurrentDurationState> {
  CurrentDurationController() : super(const CurrentDurationState());
  void change({required Duration value}) {
    // final _value = ((value.inMilliseconds) / 100).round();
    // state = state.copyWith(current: Duration(milliseconds: _value * 100));
    state = state.copyWith(current: value);
  }
}

class ThemeController extends StateNotifier<ThemeState> {
  ThemeController() : super(const ThemeState());
  // change_value functions
  void updateTheme({required int value}) {
    state = state.copyWith(theme: value);
    PrefManager().setInt(key: PrefKey.appTheme, value: value);
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
  void updateLang({required BuildContext context, required int value}) {
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
    PrefManager().setInt(key: PrefKey.changeLanguage, value: state.lang);
    Logger.s('- from LangState \n >> save int lang = ${state.lang}');
  }
}

class ClockController extends StateNotifier<ClockState> {
  ClockController() : super(const ClockState());
  // change_value functions
  void updateIs24({required bool value}) {
    state = state.copyWith(is24: value);
    PrefManager().setBool(key: PrefKey.clockStyle, value: value);
    Logger.s('- from ClockState \n >> save bool is24 = $value');
  }

  void updateShowSec({required bool value}) {
    state = state.copyWith(showSec: value);
    PrefManager().setBool(key: PrefKey.showSec, value: value);
    Logger.s('- from ClockState \n >> save bool showSec = $value');
  }

  void updateAnimation({required int value}) {
    state = state.copyWith(animation: value);
    PrefManager().setInt(key: PrefKey.clockAnimation, value: value);
    Logger.s('- from ClockState \n >> save int animation = $value');
  }
}

class ColorController extends StateNotifier<ColorState> {
  ColorController() : super(const ColorState());
  // change_value function
  Future<void> updateColor({required bool isLight}) async {
    state = state.copyWith(opacity: 0);
    await Future<void>.delayed(const Duration(milliseconds: 100)); // 何故か必要
    state = state.copyWith(opacity: 1);
  }

  void stop() {
    state = state.copyWith(opacity: 0);
    runExit();
  }

  static Future<void> runExit() async {
    await FullScreen.exitFullScreen();
  }
}

class AlarmController extends StateNotifier<AlarmState> {
  AlarmController(this.read) : super(const AlarmState());
  final Reader read;

  void runPush({required BuildContext context, required WidgetRef ref}) {
    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const AlarmTimeKeepingPage(),
      ),
      (_) => false,
    );

    ref.read(generalState.notifier).runFAB();
    ref.read(alarmTKState.notifier).whenStart();
  }

  void runTooltip({required BuildContext context}) {
    RippleBackdropAnimatePage.show(
      context: context,
      childFade: true,
      duration: 300,
      blurRadius: 20,
      bottomHeight: 110,
      child: GestureDetector(
        behavior: HitTestBehavior.deferToChild,
        // onTap: () => Navigator.of(context).pop(),
        child: const Text(
          'test widget',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  /// set internal time
  ///
  ///   ex.) 5:42 => 5:50
  void runInitialize() {
    final now = DateTime.now();
    final amount = ((now.minute / 10).ceil() * 10) - now.minute;
    final target = now.addMinutes(amount);

    updateTargetTime(value: TimeOfDay.fromDateTime(target));

    Logger.s(
      '''
    - from AlarmState
    >   DateTime.now()      =  ${now.toString()}
    >> save int alarmHour   =  ${state.targetTime}
    ''',
    );
  }

  void updateTargetTime({required TimeOfDay value}) =>
      state = state.copyWith(targetTime: value);

  String get targetTimeStr {
    if (read(clockState).is24) {
      final now = DateTime.now();
      final dt = DateTime(
        now.year,
        now.month,
        now.day,
        state.targetTime.hour,
        state.targetTime.minute,
      );
      final format = DateFormat.jm();
      return format.format(dt);
    } else {
      final now = DateTime.now();
      final dt = DateTime(
        now.year,
        now.month,
        now.day,
        state.targetTime.hour,
        state.targetTime.minute,
      );
      final format = DateFormat.jm();
      return format.format(dt);
    }
  }
}

class AlarmTimeKeepingController extends StateNotifier<AlarmTimeKeepingState> {
  AlarmTimeKeepingController(this.read) : super(const AlarmTimeKeepingState());
  final Reader read;

  final controller = CountDownController();

  void whenStart() {
    final tar = _calculateDuration(target: read(alarmState).targetTime);
    final duration = DateTimeRange(start: DateTime.now(), end: tar).duration;
    state = state.copyWith(targetDuration: duration);
    Logger.i('tar => $tar');
    Logger.i('duration => $duration');
    _state();
    NotificationManager().alarmFinish(target: tar);
    NotificationManager().alarmTimeKeeping(target: tar);
    GlobalController.switchFullScreen(value: false);
  }

  Future<void> _state() async {
    late String duration;
    duration = '約 ${state.targetDuration.inMinutes} 分間';
    if (state.targetDuration.inSeconds < 60) {
      duration = '１分未満';
    }
    if (state.targetDuration.inMinutes > 60) {
      duration = '約 ${state.targetDuration.inHours} 時間';
    }
    await read(generalState.notifier).updateStatus(text: '終了まで $duration です');
    await Future<void>.delayed(const Duration(seconds: 5));
    await read(generalState.notifier).updateStatus(text: 'アラームモード');
  }

  DateTime _calculateDuration({required TimeOfDay target}) {
    final now = DateTime.now();
    final tar = target;
    final intNow = (now.hour * 3600) + (now.minute * 60) + (now.second);
    final intVal = (tar.hour * 3600) + (tar.minute * 60);
    final day = (intNow < intVal) ? now.day : now.day + 1;
    return DateTime(now.year, now.month, day, tar.hour, tar.minute);
  }
}

class TimerController extends StateNotifier<TimerState> {
  TimerController() : super(const TimerState());

  void updateTargetDuration({required int value}) {
    state = state.copyWith(targetDuration: Duration(minutes: value));
    PrefManager().setInt(key: PrefKey.timerTarget, value: value);
    Logger.s('- from TimerState \n >> save int timerTarget = $value');
  }

  void updateTargetIntervalDuration({required int value}) {
    state = state.copyWith(targetIntervalDuration: Duration(minutes: value));
    PrefManager().setInt(key: PrefKey.timerInterval, value: value);
    Logger.s('- from TimerState \n >> save int timerInterval = $value');
  }

  void updateIntervalLoopingNum({required int value}) {
    state = state.copyWith(targetIntervalLoopingNum: value);
    PrefManager().setInt(key: PrefKey.timerInterval, value: value);
    Logger.s('- from TimerState \n >> save int intervalLoopingNum = $value');
  }
}

class TimerTimeKeepingController extends StateNotifier<TimerTimeKeepingState> {
  TimerTimeKeepingController(this.read) : super(const TimerTimeKeepingState());
  final Reader read;

  final controller = CountDownController();

  void whenStart() {
    updateFabMode(value: 0);
    final target = DateTime.now().add(read(timerState).targetDuration);
    state = state.copyWith(
      targetTime: TimeOfDay(hour: target.hour, minute: target.minute),
    );
    Logger.i(
      ' now     => ${DateTime.now()}'
      'duration => ${read(timerState).targetDuration} \n target  => $target',
    );
    NotificationManager().timerFinish(target: target);
    NotificationManager().timerTimeKeeping(target: target);
    // controller.start();
  }

  void updateFabMode({required int value}) =>
      state = state.copyWith(fabMode: value);

  void whenPause() {
    controller.pause();
    NotificationManager().cancelAllNotifications();
    updateFabMode(value: 1);
  }

  void whenResume() {
    final target = DateTime.now().add(read(currentDurationState).current);
    Logger.i(
      ' now     => ${DateTime.now()} \n'
      'current => ${read(currentDurationState).current} \n target  => $target',
    );
    NotificationManager().timerFinish(target: target);
    NotificationManager().timerTimeKeeping(target: target);
    controller.resume();
    updateFabMode(value: 0);
  }

  TimeOfDay get startedTime {
    final now = DateTime.now();
    final tar = DateTime(
      now.year,
      now.month,
      now.day,
      state.targetTime.hour,
      state.targetTime.minute,
    );
    final sta = tar.add(read(timerState).targetDuration * -1);
    return TimeOfDay(hour: sta.hour, minute: sta.minute);
  }

  String get startedTimeStr => '${startedTime.hour}:'
      '${startedTime.minute}';
}
