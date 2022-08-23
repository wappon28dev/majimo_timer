import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/controller/controller.dart';
import 'package:majimo_timer/model/helper/config.dart';
import 'package:majimo_timer/model/helper/translations.dart';

part 'state.freezed.dart';

//global
final globalState = StateNotifierProvider<GlobalController, GlobalState>(
  (ref) => GlobalController(),
);
final generalState = StateNotifierProvider<GeneralController, GeneralState>(
  (ref) => GeneralController(ref.read),
);
final themeState = StateNotifierProvider<ThemeController, ThemeState>(
  (ref) => ThemeController(),
);
final langState =
    StateNotifierProvider<LangController, LangState>((ref) => LangController());
final clockState = StateNotifierProvider<ClockController, ClockState>(
  (ref) => ClockController(),
);
final colorState = StateNotifierProvider<ColorController, ColorState>(
  (ref) => ColorController(),
);
final alarmState = StateNotifierProvider<AlarmController, AlarmState>(
  (ref) => AlarmController(ref.read),
);
final alarmTKState =
    StateNotifierProvider<AlarmTimeKeepingController, AlarmTimeKeepingState>(
  (ref) => AlarmTimeKeepingController(ref.read),
);
final timerState = StateNotifierProvider<TimerController, TimerState>(
  (ref) => TimerController(ref.read),
);
final timerTKState =
    StateNotifierProvider<TimerTimeKeepingController, TimerTimeKeepingState>(
  (ref) => TimerTimeKeepingController(ref.read),
);
final goalState =
    StateNotifierProvider<GoalController, GoalState>((ref) => GoalController());
final goalTKState =
    StateNotifierProvider<GoalTimeKeepingController, GoalTimeKeepingState>(
  (ref) => GoalTimeKeepingController(ref.read),
);
final nowStream = StreamProvider.autoDispose<DateTime>((ref) async* {
  while (true) {
    await Future<void>.delayed(const Duration(milliseconds: 10));
    yield DateTime.now();
  }
});

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
class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(0) int theme,
    @Default(false) bool isUsingMaterialYou,
    @Default(Colors.white) Color seedColor,
  }) = _ThemeState;
  const ThemeState._();

  ThemeMode get themeMode => getThemeArray()[0] as ThemeMode;
  String get themeCaption => getThemeArray()[1] as String;
  IconData get themeIcon => getThemeArray()[2] as IconData;

  String get seedColorCaption =>
      isUsingMaterialYou ? t.use_material_you.t : 'こんな色';

  List<dynamic> getThemeArray() {
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
        ? array = <dynamic>[t.show_sec.t, Icons.timer_outlined]
        : array = <dynamic>[t.not_show_sec.t, Icons.timer_off_outlined];
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
    final color = Theme.of(context).appBarTheme.backgroundColor!;
    isLight
        ? array = <dynamic>[
            Colors.black,
            color,
            Colors.orangeAccent.shade200,
            PathStore().expandedPictureSun
          ]
        : array = <dynamic>[
            Colors.white,
            color,
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

@Freezed(makeCollectionsUnmodifiable: false)
class TimerState with _$TimerState {
  const factory TimerState({
    @Default([
      Duration(minutes: 1),
      Duration(minutes: 2),
    ])
        List<Duration> targetDuration,

    // fragment whether asking continue timer by showing done modal
    @Default([
      false,
      false,
    ])
        List<bool> shouldAskContinue,

    // targetIntervalLoopingNumber aka targetILN
    @Default(0)
        int targetIntervalLoopingNum,
    @Default(1)
        int targetRepeatNum,
  }) = _TimerState;

  const TimerState._();

  /// targetLoopingNumber aka targetLN
  int get targetLoopingNum => targetDuration.length;

  List<List<int>> get targetDurationList {
    final value = [<int>[]];

    for (final element in targetDuration) {
      final hours = element.inHours;
      final minute = element.inMinutes.remainder(60);
      final seconds = element.inSeconds.remainder(60);

      value.add([hours, minute, seconds]);
    }

    value.removeAt(0);

    return value;
  }

  bool get canStart => !targetDuration.contains(Duration.zero);
}

@freezed
class TimerTimeKeepingState with _$TimerTimeKeepingState {
  const factory TimerTimeKeepingState({
    // started
    DateTime? startedTime,

    // paused
    @Default(false) bool isPaused,
    DateTime? pausedTime,
    @Default(Duration.zero) Duration pausedDuration,

    // currentLoopingNumber aka currentLN
    @Default(0) int currentLoopingNum,
  }) = _TimerTimeKeepingState;
  const TimerTimeKeepingState._();
}

@freezed
class GoalState with _$GoalState {
  const factory GoalState({
    @Default('') String goal,
  }) = _GoalState;
  const GoalState._();
}

@freezed
class GoalTimeKeepingState with _$GoalTimeKeepingState {
  const factory GoalTimeKeepingState({
    // fab
    @Default(0) int fabMode,

    // started
    DateTime? startedTime,

    // paused
    @Default(false) bool isPaused,
    DateTime? pausedTime,
    @Default(Duration.zero) Duration pausedDuration,
  }) = _GoalTimeKeepingState;
  const GoalTimeKeepingState._();

  Duration diff({required WidgetRef ref}) {
    final now = ref.watch(nowStream).value ?? DateTime.now();
    final diff = now.difference(startedTime!);
    if (!isPaused) {
      return diff - pausedDuration;
    } else {
      return pausedTime!.difference(startedTime!) - pausedDuration;
    }
  }
}
