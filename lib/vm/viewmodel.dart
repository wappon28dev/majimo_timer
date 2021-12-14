// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/manager.dart';
import 'package:majimo_timer/model/translations.dart';

import '../../../main.dart';

class GeneralManagerVM extends GeneralManager {
  String get topToast_caption => topToast ? t.top.t : t.bottom.t;

  IconData get topToast_icon =>
      topToast ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down;

  String get toastDuration_caption => t.duration.p(toastDuration);

  void change_topToast({required bool value}) {
    change_topToast(value: value);
  }
}

class ThemeManagerVM extends ThemeManager {
  ThemeManagerVM(Reader read) : super(read);

  ThemeMode get themeMode_value {
    switch (theme) {
      case 0:
        return ThemeMode.system;
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      default:
        throw Exception('error!');
    }
  }

  String get themeMode_caption {
    switch (theme) {
      case 0:
        return t.system.t;
      case 1:
        return t.light.t;
      case 2:
        return t.dark.t;
      default:
        throw Exception('error!');
    }
  }

  IconData get themeMode_icon {
    switch (theme) {
      case 0:
        return Icons.settings_brightness;
      case 1:
        return Icons.brightness_7;
      case 2:
        return Icons.nights_stay;
      default:
        throw Exception('error!');
    }
  }
}

class LangManagerVM extends LangManager {
  String get lang_caption {
    switch (value) {
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
}

class ClockManagerVM extends ClockManager {
  String get is24_caption => is24 ? t.style24.t : t.style12.t;
  IconData get is24_icon =>
      is24 ? Icons.share_arrival_time_outlined : Icons.share_arrival_time;
  String get showSec_caption => showSec ? t.show_sec.t : t.not_show_sec.t;
  IconData get showSec_icon => showSec ? Icons.timer : Icons.timer_off;
  String get animation_caption {
    switch (animation) {
      case 0:
        return t.easeOutExpo.t;
      case 1:
        return t.elasticOut.t;
      default:
        throw Exception('error!');
    }
  }

  IconData get animation_icon {
    switch (animation) {
      case 0:
        return Icons.moving;
      case 1:
        return Icons.bubble_chart;
      default:
        throw Exception('error!');
    }
  }

  Curve get animation_curve {
    switch (animation) {
      case 0:
        return Curves.easeOutExpo;
      case 1:
        return Curves.elasticOut;
      default:
        throw Exception('error!');
    }
  }
}

class ColorManagerVM extends ColorManager {
  ColorManagerVM(Reader read) : super(read);

  /// ```
  /// return array = [Color clockcolor, Color start, Color end, String path]
  /// ```
  List<dynamic> get({required BuildContext context}) {
    final isLight = read(themeManager).isLight(context: context);
    var array = <dynamic>[]..length = 4;
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

  Color color_clockcolor({required BuildContext context}) =>
      get(context: context)[0] as Color;
  Color color_start_color({required BuildContext context}) =>
      get(context: context)[1] as Color;
  Color color_end_color({required BuildContext context}) =>
      get(context: context)[2] as Color;
  String color_picture_path({required BuildContext context}) =>
      get(context: context)[3] as String;
}

class AlarmManagerVM extends AlarmManager {
  AlarmManagerVM(Reader read) : super(read);

  TimeOfDay get alarm_value => TimeOfDay(hour: alarmHour, minute: alarmMinute);
  String get alarm_value_str => '${alarmHour.toString().padLeft(2, '0')}:'
      '${alarmMinute.toString().padLeft(2, '0')}';
  TimeOfDay get alarm_ampm =>
      alarm_value.replacing(hour: alarm_value.hourOfPeriod);
  bool get alarm_is12 => alarmHour < 12;
}
