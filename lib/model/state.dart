// ignore_for_file: non_constant_identifier_names, sort_unnamed_constructors_first

// ignore: implementation_imports
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/helper/translations.dart';

part 'state.freezed.dart';
// part 'state.g.dart';

@freezed
class GeneralManager with _$GeneralManager {
  const GeneralManager._();
  const factory GeneralManager({
    @Default('まじもタイマーへようこそ！') String status,
    @Default(false) bool topToast,
    @Default(3) int toastDuration,
    @Default(1) double opacity,
  }) = _GeneralManager;

  // define custom getter
  String get topToast_caption => topToast ? t.top.t : t.bottom.t;
  IconData get topToast_icon =>
      topToast ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down;
  String get toastDuration_caption => t.duration.p(toastDuration);
}

@freezed
class ThemeManager with _$ThemeManager {
  const ThemeManager._();
  const factory ThemeManager({@Default(0) int theme}) = _ThemeManager;

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
class LangManager with _$LangManager {
  const LangManager._();
  const factory LangManager({@Default(0) int lang}) = _LangManager;

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
class ClockManager with _$ClockManager {
  const ClockManager._();
  const factory ClockManager(
      {@Default(true) bool is24,
      @Default(true) bool showSec,
      @Default(0) int animation}) = _ClockManager;

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
class ColorManager with _$ColorManager {
  const ColorManager._();
  const factory ColorManager({@Default(0) double opacity}) = _ColorManager;

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
    final isLight = ref.read(themeManager.notifier).isLight(context: context);
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
class AlarmManager with _$AlarmManager {
  const AlarmManager._();
  const factory AlarmManager({
    @Default(12) int alarmHour,
    @Default(00) int alarmMinute,
    @Default(false) bool showFAB,
  }) = _AlarmManager;

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
class AlarmTimeKeepingManager with _$AlarmTimeKeepingManager {
  const factory AlarmTimeKeepingManager({
    @Default(Duration(seconds: 1)) Duration duration,
    @Default(false) bool alarmTK,
    @Default(false) bool isAlarmFinish,
  }) = _AlarmTimeKeepingManager;
}
