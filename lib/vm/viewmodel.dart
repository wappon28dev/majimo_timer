// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

import 'package:dart_date/src/dart_date.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/pref.dart';
import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:majimo_timer/view/home/alarm/timekeep/body.dart';
import 'package:majimo_timer/view/home/root/body.dart';
import 'package:ripple_backdrop_animate_route/ripple_backdrop_animate_route.dart';
import 'package:wakelock/wakelock.dart';

import '../../../main.dart';

class CounterStateController extends StateNotifier<CounterState> {
  CounterStateController() : super(const CounterState());
  void increment() => state = state.copyWith(
        count: state.count + 1,
        count10: state.count10 + 10,
      );
}

class GeneralManagerVM extends StateNotifier<GeneralManager> {
  GeneralManagerVM() : super(const GeneralManager());

  // change_value function
  void change_topToast({required bool value}) {
    state = state.copyWith(topToast: value);
    PrefManager.setBool(key: PrefKey.topToast, value: value);
    Logger.s(
        '- from GeneralManager \n >> save bool toptoast = ${state.topToast}');
  }

  void change_toastDuration({required int value}) {
    (value == 0) ? value = 4 : null;
    state = state.copyWith(toastDuration: value);
    PrefManager.setInt(key: PrefKey.toastDuration, value: value);
    Logger.s(
        '- from GeneralManager \n >> save int toastDuration = ${state.toastDuration}');
  }

  Future<void> home() async {
    await Wakelock.disable();
    state = state.copyWith(opacity: 1);
    state = state.copyWith(status: 'まじもタイマーへようこそ！');

    await Future<void>.delayed(const Duration(seconds: 2));
    state = state.copyWith(opacity: 0);

    await Future<void>.delayed(const Duration(milliseconds: 600));

    state =
        state.copyWith(status: DateTime.now().format('yMMMMEEEEd', t.lang.t));
    state = state.copyWith(opacity: 1);
  }

  Future<void> expand(int i) async {
    await Wakelock.enable();
    await change_status(text: '置き時計モード');
    await Future<void>.delayed(const Duration(seconds: 3));
    await change_status(
        text:
            '${DateTime.now().format('yMMMMEEEEd', t.lang.t)}・Majimo-Timer v0.0.2');
  }

  Future<void> change_status({required String text}) async {
    state = state.copyWith(opacity: 0);
    await Future<void>.delayed(const Duration(milliseconds: 600));
    state = state.copyWith(opacity: 1);
    state = state.copyWith(status: text);
  }

  void change_timekeeping({required bool value}) =>
      state = state.copyWith(timekeeping: value);

  void push({required BuildContext context, required Widget page}) =>
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => page,
        ),
      );

  void push_home({required BuildContext context}) =>
      Navigator.pushAndRemoveUntil<void>(
          context,
          MaterialPageRoute<void>(builder: (context) => const HomePage()),
          (_) => false);
}

class ThemeManagerVM extends StateNotifier<ThemeManager> {
  ThemeManagerVM() : super(const ThemeManager());
  // change_value functions
  void change({required int value}) {
    state = state.copyWith(theme: value);
    PrefManager.setInt(key: PrefKey.appTheme, value: value);
    Logger.s('- from ThemeManager \n >> save int theme = ${state.theme}');
  }

  bool isLight({required BuildContext context}) {
    final isLightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    final pref = state.theme;

    return (pref != 0) ? (pref == 1) : isLightMode;
  }
}

class LangManagerVM extends StateNotifier<LangManager> {
  LangManagerVM() : super(const LangManager());
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
    Logger.s('- from LangManager \n >> save int lang = ${state.lang}');
  }
}

class ClockManagerVM extends StateNotifier<ClockManager> {
  ClockManagerVM() : super(const ClockManager());
  // change_value functions
  void change_is24({required bool value}) {
    state = state.copyWith(is24: value);
    PrefManager.setBool(key: PrefKey.clockStyle, value: value);
    Logger.s('- from ClockManager \n >> save bool is24 = $value');
  }

  void change_showSec({required bool value}) {
    state = state.copyWith(showSec: value);
    PrefManager.setBool(key: PrefKey.showSec, value: value);
    Logger.s('- from ClockManager \n >> save bool showSec = $value');
  }

  void change_animation({required int value}) {
    state = state.copyWith(animation: value);
    PrefManager.setInt(key: PrefKey.clockAnimation, value: value);
    Logger.s('- from ClockManager \n >> save int animation = $value');
  }
}

class ColorManagerVM extends StateNotifier<ColorManager> {
  ColorManagerVM() : super(const ColorManager());
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

class AlarmManagerVM extends StateNotifier<AlarmManager> {
  AlarmManagerVM() : super(const AlarmManager());

  void push({required BuildContext context, required WidgetRef ref}) {
    Navigator.pushAndRemoveUntil<void>(
        context,
        MaterialPageRoute<void>(
            builder: (context) => const AlarmTimeKeepingPage()),
        (_) => false);

    show();
    ref.read(alarmTimeKeepingManager.notifier).start();
    ref.read(generalManager.notifier).change_timekeeping(value: true);
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
        '- from AlarmManager \n > now = ${now.toString()}\n >> save int alarmHour = ${state.alarmHour}\n >> save int alarmMinute = ${state.alarmMinute}');
  }

  void change({required TimeOfDay value}) {
    state = state.copyWith(alarmHour: value.hour);
    state = state.copyWith(alarmMinute: value.minute);
  }

  Future<void> show() async {
    state = state.copyWith(showFAB: false);

    await Future<void>.delayed(const Duration(milliseconds: 300));
    state = state.copyWith(showFAB: true);
  }
}

class AlarmTimeKeepingManagerVM extends StateNotifier<AlarmTimeKeepingManager> {
  AlarmTimeKeepingManagerVM(this.read) : super(const AlarmTimeKeepingManager());
  final Reader read;

  // change_value function
  void start() {
    final target = read(alarmManager).get_value();
    final duration = define_duration(target: target);
    state = state.copyWith(duration: duration);
    Logger.i('duration => $duration');
    status();
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
    await read(generalManager.notifier)
        .change_status(text: '終了まで $duration です');

    await Future<void>.delayed(const Duration(seconds: 5));
    await read(generalManager.notifier).change_status(text: 'アラームモード');
  }

  Duration define_duration({required TimeOfDay target}) {
    final now = DateTime.now();
    final nowInSeconds = now.hour * 3600 + now.minute * 60 + now.second;
    final targetInSeconds = target.hour * 3600 + target.minute * 60;
    final duration = targetInSeconds - nowInSeconds;
    Logger.i('$targetInSeconds-$nowInSeconds=$duration');

    return Duration(seconds: (duration > 0) ? duration : 3600 * 24 - duration);
  }
}
