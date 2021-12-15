// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

import 'package:ezanimation/ezanimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fader/flutter_fader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/manager.dart';
import 'package:majimo_timer/model/translations.dart';

import '../../../main.dart';

class GeneralManagerVM extends ChangeNotifier {
  GeneralManagerVM(GeneralManager generalManager) : _ = generalManager;
  final GeneralManager _;

  // obtain values
  String get status => _.status;
  bool get topToast => _.topToast;
  int get toastDuration => _.toastDuration;
  double get opacity => _.opacity;

  // create values
  String get topToast_caption => topToast ? t.top.t : t.bottom.t;
  IconData get topToast_icon =>
      topToast ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down;
  String get toastDuration_caption => t.duration.p(toastDuration);

  // create & forward functions
  void change_topToast({required bool value}) {
    _.change_topToast(value: value);
    notifyListeners();
  }

  void change_toastDuration({required int value}) {
    _.change_toastDuration(value: value);
    notifyListeners();
  }

  Future<void> home() async {
    await _.home(0);
    notifyListeners();
    await Future<void>.delayed(const Duration(seconds: 3));
    await _.home(1);
    notifyListeners();
    await Future<void>.delayed(const Duration(milliseconds: 600));
    await _.home(2);
    notifyListeners();
  }

  Future<void> expand() async {
    await _.expand(0);
    notifyListeners();
    await Future<void>.delayed(const Duration(seconds: 3));
    await _.expand(1);
    notifyListeners();
    await Future<void>.delayed(const Duration(milliseconds: 600));
    await _.expand(2);
    notifyListeners();
  }

  void push({required BuildContext context, required Widget name}) {
    _.push(context: context, name: name);
    notifyListeners();
  }
}

class ThemeManagerVM extends ChangeNotifier {
  ThemeManagerVM(ThemeManager themeManager, this.read) : _ = themeManager;
  final ThemeManager _;
  final Reader read;

  // obtain values
  int get theme => _.theme;

  // create values
  ThemeMode get theme_value => get()[0] as ThemeMode;
  String get theme_caption => get()[1] as String;
  IconData get theme_icon => get()[2] as IconData;

  // create & forward functions
  void change({required int value}) {
    _.change(value: value);
    notifyListeners();
  }

  bool isLight({required BuildContext context}) => _.isLight(context: context);

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

class LangManagerVM extends ChangeNotifier {
  LangManagerVM(LangManager langManager) : _ = langManager;
  final LangManager _;

  // obtain value
  int get lang => _.value;

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

  // create & forward function
  void change({required BuildContext context, required int lang}) {
    _.change(context: context, lang: lang);
    notifyListeners();
  }
}

class ClockManagerVM extends ChangeNotifier {
  ClockManagerVM(ClockManager clockManager) : _ = clockManager;
  final ClockManager _;

  // obtain values
  bool get is24 => _.is24;
  bool get showSec => _.showSec;
  int get animation => _.animation;

  // create values
  String get is24_caption => get_is24()[0] as String;
  IconData get is24_icon => get_is24()[1] as IconData;

  String get showSec_caption => get_showSec()[0] as String;
  IconData get showSec_icon => get_showSec()[1] as IconData;

  String get animation_caption => get_animation()[0] as String;
  IconData get animation_icon => get_animation()[1] as IconData;
  Curve get animation_curve => get_animation()[2] as Curve;

  //create & forward functions
  void change_is24({required bool value}) {
    _.change_is24(value: value);
    notifyListeners();
  }

  void change_showSec({required bool value}) {
    _.change_showSec(value: value);
    notifyListeners();
  }

  void change_animation({required int value}) {
    _.change_animation(value: value);
    notifyListeners();
  }

  // get_value functions

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
    switch (_.animation) {
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

class ColorManagerVM extends ChangeNotifier {
  ColorManagerVM(ColorManager colorManager, this.read) : _ = colorManager;
  final ColorManager _;
  final Reader read;

  // obtain values
  EzAnimation get color => _.color;
  EzAnimation get opacity => _.opacity;

  // create values
  Color color_clockcolor({required BuildContext context}) =>
      get(context: context)[0] as Color;
  Color color_start_color({required BuildContext context}) =>
      get(context: context)[1] as Color;
  Color color_end_color({required BuildContext context}) =>
      get(context: context)[2] as Color;
  String color_picture_path({required BuildContext context}) =>
      get(context: context)[3] as String;

  // create & forward function
  void change({required bool isLight}) {
    _.change(isLight: isLight);
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void stop() => _.stop();

  // get_value function
  /// ```
  /// return array = [Color clockcolor, Color start, Color end, String path]
  /// ```
  List<dynamic> get({required BuildContext context}) {
    List<dynamic>? array;
    final isLight = read(themeManager).isLight(context: context);
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

class AlarmManagerVM extends ChangeNotifier {
  AlarmManagerVM(AlarmManager alarmManager) : _ = alarmManager;
  final AlarmManager _;

  // obtain values
  int get alarmHour => _.alarmHour;
  int get alarmMinute => _.alarmMinute;
  double get FABsize => _.FABsize;
  EzAnimation get iconsize => _.iconsize;

  // create values
  TimeOfDay get alarm_value => TimeOfDay(hour: alarmHour, minute: alarmMinute);
  String get alarm_value_str => get_str();
  TimeOfDay get alarm_ampm => get_ampm();
  bool get alarm_is12 => alarmHour < 12;

  // create & forward values
  void internal() {
    _.internal();
    notifyListeners();
  }

  void change({required TimeOfDay value}) {
    _.change(value: value);
    notifyListeners();
  }

  Future<void> show() async {
    await _.show();
    notifyListeners();
  }

  // get_value function
  TimeOfDay get_value() => TimeOfDay(hour: alarmHour, minute: alarmMinute);
  String get_str() =>
      '${alarmHour.toString().padLeft(2, '0')}:${alarmMinute.toString().padLeft(2, '0')}';
  TimeOfDay get_ampm() => alarm_value.replacing(hour: alarm_value.hourOfPeriod);
}
