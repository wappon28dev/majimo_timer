<<<<<<< HEAD
// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

import 'package:ezanimation/ezanimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fader/flutter_fader.dart';
=======
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
>>>>>>> 11f2098393c2b2228b4fe5801ca023b585fd671b
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/manager.dart';
import 'package:majimo_timer/model/translations.dart';

import '../../../main.dart';

<<<<<<< HEAD
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
=======
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
>>>>>>> 11f2098393c2b2228b4fe5801ca023b585fd671b
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
<<<<<<< HEAD

  String get lang_locale {
    switch (lang) {
      case 0:
        return t.lang.t;
      case 1:
        return const Locale('ja', 'JP').toString();
      case 2:
        return const Locale('en', 'US').toString();
=======
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
>>>>>>> 11f2098393c2b2228b4fe5801ca023b585fd671b
      default:
        throw Exception('error!');
    }
  }

<<<<<<< HEAD
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
=======
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

>>>>>>> 11f2098393c2b2228b4fe5801ca023b585fd671b
  /// ```
  /// return array = [Color clockcolor, Color start, Color end, String path]
  /// ```
  List<dynamic> get({required BuildContext context}) {
<<<<<<< HEAD
    List<dynamic>? array;
    final isLight = read(themeManager).isLight(context: context);
=======
    final isLight = read(themeManager).isLight(context: context);
    var array = <dynamic>[]..length = 4;
>>>>>>> 11f2098393c2b2228b4fe5801ca023b585fd671b
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
<<<<<<< HEAD
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
=======

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
>>>>>>> 11f2098393c2b2228b4fe5801ca023b585fd671b
}
