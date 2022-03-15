import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/helper/config.dart';
import 'package:majimo_timer/model/helper/translations.dart';

part 'state.freezed.dart';

@freezed
class GlobalState with _$GlobalState {
  const factory GlobalState({
    @Default(true) bool isFirst,
    @Default(false) bool isTimeKeeping,
  }) = _GlobalState;
}

@freezed
class GeneralState with _$GeneralState {
  const factory GeneralState({
    @Default('まじもタイマーへようこそ！') String status,
    @Default(false) bool topToast,
    @Default(3) int toastDuration,
    @Default(1) double opacity,
    @Default(false) bool showFAB,
  }) = _GeneralState;
  const GeneralState._();

  String get topToastCaption => topToast ? t.top.t : t.bottom.t;
  IconData get topToastIcon =>
      topToast ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down;
  String get toastDurationCaption => t.duration.p(toastDuration);
}

@freezed
class CurrentDurationState with _$CurrentDurationState {
  const factory CurrentDurationState(
      {@Default(Duration.zero) Duration current,
      @Default(0) int currentIntervalLoopingNum}) = _CurrentDurationState;
}

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({@Default(0) int theme}) = _ThemeState;
  const ThemeState._();

  ThemeMode get themeMode => get()[0] as ThemeMode;
  String get themeCaption => get()[1] as String;
  IconData get themeIcon => get()[2] as IconData;

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
  const factory LangState({@Default(0) int lang}) = _LangState;
  const LangState._();

  // create value
  String get langCaption {
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

  String get langLocale {
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
  const factory ClockState({
    @Default(true) bool is24,
    @Default(true) bool showSec,
    @Default(0) int animation,
  }) = _ClockState;
  const ClockState._();

  // create values
  String get is24Caption => _is24()[0] as String;
  IconData get is24Icon => _is24()[1] as IconData;

  String get showSecCaption => _showSec()[0] as String;
  IconData get showSecIcon => _showSec()[1] as IconData;

  String get animationCaption => _animation()[0] as String;
  IconData get animationIcon => _animation()[1] as IconData;
  Curve get animationCurve => _animation()[2] as Curve;

  /// ```
  /// return array = [String text, IconData icon];
  /// ```
  List<dynamic> _is24() {
    List<dynamic>? array;
    is24
        ? array = <dynamic>[t.style24.t, Icons.share_arrival_time_outlined]
        : array = <dynamic>[t.style12.t, Icons.share_arrival_time];
    return array;
  }

  /// ```
  /// return array = [String text, IconData icon];
  /// ```
  List<dynamic> _showSec() {
    List<dynamic>? array;
    showSec
        ? array = <dynamic>[t.show_sec.t, Icons.timer]
        : array = <dynamic>[t.not_show_sec.t, Icons.timer_off];
    return array;
  }

  /// ```
  /// return array = [String text, IconData icon, Curve curve];
  /// ```
  List<dynamic> _animation() {
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
  const factory ColorState({@Default(0) double opacity}) = _ColorState;
  const ColorState._();

  // create values
  Color clockColor({
    required BuildContext context,
    required WidgetRef ref,
  }) =>
      _color(context: context, ref: ref)[0] as Color;
  Color startColor({
    required BuildContext context,
    required WidgetRef ref,
  }) =>
      _color(context: context, ref: ref)[1] as Color;
  Color endColor({
    required BuildContext context,
    required WidgetRef ref,
  }) =>
      _color(context: context, ref: ref)[2] as Color;
  String picturePath({
    required BuildContext context,
    required WidgetRef ref,
  }) =>
      _color(context: context, ref: ref)[3] as String;
  ColorTween colorTween({
    required BuildContext context,
    required WidgetRef ref,
  }) =>
      ColorTween(
        begin: startColor(context: context, ref: ref),
        end: endColor(context: context, ref: ref),
      );

  /// ```
  /// return array = [Color clockcolor, Color start, Color end, String path]
  /// ```
  List<dynamic> _color({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    List<dynamic>? array;
    final isLight = ref.read(themeState.notifier).isLight(context: context);
    isLight
        ? array = <dynamic>[
            Colors.black,
            Colors.deepOrange,
            Colors.orangeAccent.shade200,
            PathStore().expandedPictureSun
          ]
        : array = <dynamic>[
            Colors.white,
            Colors.deepOrange.shade800,
            Colors.blue.shade900,
            PathStore().expandedPictureNight
          ];
    return array;
  }
}

@freezed
class AlarmState with _$AlarmState {
  const factory AlarmState({
    @Default(TimeOfDay(hour: 12, minute: 00)) TimeOfDay targetTime,
  }) = _AlarmState;
  const AlarmState._();
}

@freezed
class AlarmTimeKeepingState with _$AlarmTimeKeepingState {
  const factory AlarmTimeKeepingState({
    @Default(Duration(seconds: 1)) Duration targetDuration,
    @Default(TimeOfDay(hour: 12, minute: 00)) TimeOfDay startedTime,
    @Default('') String headerText,
  }) = _AlarmTimeKeepingState;
  const AlarmTimeKeepingState._();
}

@freezed
class TimerState with _$TimerState {
  const factory TimerState({
    @Default(Duration(minutes: 1)) Duration targetDuration,
    @Default(Duration(minutes: 1)) Duration targetIntervalDuration,
    @Default(false) bool isInterval,
    @Default(0) int targetIntervalLoopingNum,
  }) = _TimerState;

  const TimerState._();
  String get targetDurationStr =>
      '${targetDuration.inHours.toString().padLeft(2, '0')}h:'
      '${targetDuration.inMinutes.remainder(60).toString().padLeft(2, '0')}m';
  String get targetIntervalDurationStr =>
      '${targetIntervalDuration.inHours.toString().padLeft(2, '0')}h:'
      '${targetIntervalDuration.inMinutes.remainder(60).toString().padLeft(2, '0')}m';
}

@freezed
class TimerTimeKeepingState with _$TimerTimeKeepingState {
  const factory TimerTimeKeepingState({
    @Default(0) int fabMode,
    @Default(TimeOfDay(hour: 12, minute: 0)) TimeOfDay targetTime,
    @Default(TimeOfDay(hour: 12, minute: 30)) TimeOfDay targetIntervalTime,
  }) = _TimerTimeKeepingState;
  const TimerTimeKeepingState._();
}
