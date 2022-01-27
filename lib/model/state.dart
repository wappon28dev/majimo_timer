// ignore_for_file: non_constant_identifier_names, sort_unnamed_constructors_first, unnecessary_parenthesis

// ignore: implementation_imports
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/helper/translations.dart';

part 'state.freezed.dart';
// part 'state.g.dart';

@freezed
class GlobalState with _$GlobalState {
  const factory GlobalState({
    @Default(true) bool isFirst,
  }) = _GlobalState;
}

@freezed
class GeneralState with _$GeneralState {
  const GeneralState._();
  const factory GeneralState({
    @Default('まじもタイマーへようこそ！') String status,
    @Default(false) bool topToast,
    @Default(3) int toastDuration,
    @Default(1) double opacity,
    @Default(false) bool showFAB,
  }) = _GeneralState;

  // define custom getter
  String get topToast_caption => topToast ? t.top.t : t.bottom.t;
  IconData get topToast_icon =>
      topToast ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down;
  String get toastDuration_caption => t.duration.p(toastDuration);
}

@freezed
class ThemeState with _$ThemeState {
  const ThemeState._();
  const factory ThemeState({@Default(0) int theme}) = _ThemeState;

  // define custom getter
  ThemeMode get theme_value => get()[0] as ThemeMode;
  String get theme_caption => get()[1] as String;
  IconData get theme_icon => get()[2] as IconData;

  // get_value function
  List<dynamic> get() {
    var array = <dynamic>[]..length = 3;
    switch (theme) {
      case 0:
        array = <dynamic>[
          ThemeMode.system,
          t.system.t,
          Icons.settings_brightness
        ];
        break;
      case 1:
        array = <dynamic>[
          ThemeMode.light,
          t.light.t,
          Icons.brightness_7,
        ];
        break;
      case 2:
        array = <dynamic>[
          ThemeMode.dark,
          t.dark.t,
          Icons.nights_stay,
        ];
        break;
      default:
        throw Exception('error!');
    }
    return array;
  }
}

@freezed
class LangState with _$LangState {
  const LangState._();
  const factory LangState({@Default(0) int lang}) = _LangState;

  // create value
  String get lang_caption {
    switch (lang) {
      case 0:
        return t.system.t;
      case 1:
        return '日本語/Japanese';
      case 2:
        return '英語/English';
      default:
        throw Exception('error!');
    }
  }

  String get lang_locale {
    switch (lang) {
      case 0:
        return t.lang.t;
      case 1:
        return const Locale('ja', 'JP').toString();
      case 2:
        return const Locale('en', 'US').toString();
      default:
        throw Exception('error!');
    }
  }
}

@freezed
class ClockState with _$ClockState {
  const ClockState._();
  const factory ClockState(
      {@Default(true) bool is24,
      @Default(true) bool showSec,
      @Default(0) int animation}) = _ClockState;

  // create values
  String get is24_caption => get_is24()[0] as String;
  IconData get is24_icon => get_is24()[1] as IconData;

  String get showSec_caption => get_showSec()[0] as String;
  IconData get showSec_icon => get_showSec()[1] as IconData;

  String get animation_caption => get_animation()[0] as String;
  IconData get animation_icon => get_animation()[1] as IconData;
  Curve get animation_curve => get_animation()[2] as Curve;

  /// ```
  /// return array = [String text, IconData icon];
  /// ```
  List<dynamic> get_is24() {
    List<dynamic>? array;
    is24
        ? array = <dynamic>[t.style24.t, Icons.share_arrival_time_outlined]
        : array = <dynamic>[t.style12.t, Icons.share_arrival_time];
    return array;
  }

  /// ```
  /// return array = [String text, IconData icon];
  /// ```
  List<dynamic> get_showSec() {
    List<dynamic>? array;
    showSec
        ? array = <dynamic>[t.show_sec.t, Icons.timer]
        : array = <dynamic>[t.not_show_sec.t, Icons.timer_off];
    return array;
  }

  /// ```
  /// return array = [String text, IconData icon, Curve curve];
  /// ```
  List<dynamic> get_animation() {
    List<dynamic>? array;
    switch (animation) {
      case 0:
        array = <dynamic>[
          t.easeOutExpo.t,
          Icons.moving,
          Curves.easeOutExpo,
        ];
        break;
      case 1:
        array = <dynamic>[
          t.elasticOut.t,
          Icons.bubble_chart,
          Curves.elasticOut,
        ];
    }
    if (array == null) {
      throw Exception('error');
    }
    return array;
  }
}

@freezed
class ColorState with _$ColorState {
  const ColorState._();
  const factory ColorState({@Default(0) double opacity}) = _ColorState;

  // create values
  Color color_clockcolor(
          {required BuildContext context, required WidgetRef ref}) =>
      get(context: context, ref: ref)[0] as Color;
  Color color_start_color(
          {required BuildContext context, required WidgetRef ref}) =>
      get(context: context, ref: ref)[1] as Color;
  Color color_end_color(
          {required BuildContext context, required WidgetRef ref}) =>
      get(context: context, ref: ref)[2] as Color;
  String color_picture_path(
          {required BuildContext context, required WidgetRef ref}) =>
      get(context: context, ref: ref)[3] as String;
  ColorTween color_tween(
          {required BuildContext context, required WidgetRef ref}) =>
      ColorTween(
          begin: color_start_color(context: context, ref: ref),
          end: color_end_color(context: context, ref: ref));

  // get_value function
  /// ```
  /// return array = [Color clockcolor, Color start, Color end, String path]
  /// ```
  List<dynamic> get({required BuildContext context, required WidgetRef ref}) {
    List<dynamic>? array;
    final isLight = ref.read(themeState.notifier).isLight(context: context);
    isLight
        ? array = <dynamic>[
            Colors.black,
            Colors.deepOrange,
            Colors.orangeAccent.shade200,
            'assets/splash/sun.json'
          ]
        : array = <dynamic>[
            Colors.white,
            Colors.deepOrange.shade800,
            Colors.blue.shade900,
            'assets/splash/wolf.json'
          ];
    return array;
  }
}

@freezed
class AlarmState with _$AlarmState {
  const AlarmState._();
  const factory AlarmState({
    @Default(12) int alarmHour,
    @Default(00) int alarmMinute,
  }) = _AlarmState;

  // create values
  TimeOfDay get alarm_value => TimeOfDay(hour: alarmHour, minute: alarmMinute);
  String get alarm_value_str => get_str();
  TimeOfDay get alarm_ampm => get_ampm();
  bool get alarm_is12 => alarmHour < 12;

  // get_value function
  TimeOfDay get_value() => TimeOfDay(hour: alarmHour, minute: alarmMinute);
  String get_str() =>
      '${alarmHour.toString().padLeft(2, '0')}:${alarmMinute.toString().padLeft(2, '0')}';
  TimeOfDay get_ampm() => alarm_value.replacing(hour: alarm_value.hourOfPeriod);
}

@freezed
class AlarmTimeKeepingState with _$AlarmTimeKeepingState {
  const AlarmTimeKeepingState._();
  const factory AlarmTimeKeepingState({
    @Default(0) double rate,
    @Default(Duration(seconds: 1)) Duration duration,
    @Default(false) bool alarmTK,
    @Default(false) bool isAlarmFinish,
  }) = _AlarmTimeKeepingState;
  int get progress => 100 - rate.round() * 100;
}

@freezed
class TimerState with _$TimerState {
  const TimerState._();
  const factory TimerState(
      {@Default(Duration(minutes: 1)) Duration target,
      @Default(Duration(minutes: 1)) Duration interval,
      @Default(false) bool isInterval}) = _TimerState;

  String get target_str => '${target.inHours.toString().padLeft(2, '0')}h:'
      '${target.inMinutes.remainder(60).toString().padLeft(2, '0')}m';
}

@freezed
class TimerTimeKeepingState with _$TimerTimeKeepingState {
  const TimerTimeKeepingState._();
  const factory TimerTimeKeepingState({@Default(0) double rate}) =
      _TimerTimeKeepingState;
}
