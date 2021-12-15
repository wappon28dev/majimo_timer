// ignore_for_file: non_constant_identifier_names

// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:ezanimation/ezanimation.dart';
import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/translations.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:majimo_timer/vm/viewmodel.dart';
import 'package:wakelock/wakelock.dart';
import '../../../main.dart';
import 'pref.dart';

class GeneralManager extends ChangeNotifier {
  Widget _status = const Text('まじもタイマーへようこそ！',
      style: TextStyle(fontWeight: FontWeight.bold));
  bool _topToast = false;
  int _toastDuration = 3;

  Widget get status => _status;
  bool get topToast => _topToast;
  int get toastDuration => _toastDuration;

  void change_topToast({required bool value}) {
    _topToast = value;
    PrefManager.setBool(key: PrefKey.topToast, value: value);
    Logger.s('- from GeneralManager \n >> save bool toptoast = $_topToast');
    notifyListeners();
  }

  void change_toastDuration({required int value}) {
    (value == 0) ? value = 4 : null;
    _toastDuration = value;
    PrefManager.setInt(key: PrefKey.toastDuration, value: value);
    // ignore: lines_longer_than_80_chars
    Logger.s(
        '- from GeneralManager \n >> save int toastDuration = $_toastDuration');
    notifyListeners();
  }

  void home() {
    Wakelock.disable();
    Logger.i('wakelock => disable');
    _status = const Text('まじもタイマーへようこそ！',
        style: TextStyle(fontWeight: FontWeight.bold));
    notifyListeners();
  }

  Future<void> expand() async {
    await Wakelock.enable();
    Logger.i('wakelock => enable');
    final now = DateTime.now();
    _status = const Text('あいすくりーむ');
    await Future<void>.delayed(const Duration(seconds: 5));
    _status = Text(
        '${now.year}年${now.month}月${now.day}日  ・  Majimo-Timer v0.0.1',
        style: const TextStyle(fontWeight: FontWeight.bold));
  }

  Future<void> push({required BuildContext context, required Widget name}) {
    return Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => name,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return const OpenUpwardsPageTransitionsBuilder()
                .buildTransitions<Widget>(
                    MaterialPageRoute(builder: (context) => name),
                    context,
                    animation,
                    secondaryAnimation,
                    child);
          },
        ),
        (_) => false);
  }
}

class ThemeManager extends ChangeNotifier {
  ThemeManager(this.read);
  final Reader read;

  int _theme = 0;
  int get theme => _theme;

  void change({required int value}) {
    _theme = value;
    PrefManager.setInt(key: PrefKey.appTheme, value: 0);
    notifyListeners();
    Logger.s('- from ThemeManager \n >> save int theme = $theme');
  }

  bool isLight({required BuildContext context}) {
    final isLightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    final pref = theme;

    return (pref != 0) ? (pref == 1) : isLightMode;
  }
}

class LangManager extends ChangeNotifier {
  int _value = 0;
  int get value => _value;
  void change({required BuildContext context, required int lang}) {
    void locale(Locale locale) => context.setLocale(locale);
    const japanese = Locale('ja', 'JP');
    const english = Locale('en', 'US');
    _value = lang;
    switch (lang) {
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
    PrefManager.setInt(key: PrefKey.changeLanguage, value: lang);
    notifyListeners();
    Logger.s('- from LangManager \n >> save int lang = $lang');
  }
}

class ClockManager extends ChangeNotifier {
  bool _is24 = true;
  bool _showSec = true;
  int _animation = 0;
  bool get is24 => _is24;
  bool get showSec => _showSec;
  int get animation => _animation;

  void change_is24({required bool value}) {
    _is24 = value;
    PrefManager.setBool(key: PrefKey.clockStyle, value: value);
    notifyListeners();
    Logger.s('- from ClockManager \n >> save bool is24 = $value');
  }

  void change_showSec({required bool value}) {
    _showSec = value;
    PrefManager.setBool(key: PrefKey.showSec, value: value);
    notifyListeners();
    Logger.s('- from ClockManager \n >> save bool showSec = $value');
  }

  void change_animation({required int value}) {
    _animation = value;
    PrefManager.setInt(key: PrefKey.clockAnimation, value: value);
    notifyListeners();
    Logger.s('- from ClockManager \n >> save int animation = $value');
  }
}

class ColorManager extends ChangeNotifier {
  ColorManager(this.read);
  final Reader read;
  // ignore: prefer_final_fields
  EzAnimation _color = EzAnimation.tween(
      ColorTween(begin: null, end: null), const Duration(seconds: 1));
  final _opacity = EzAnimation(0.0, 1.0, const Duration(milliseconds: 300),
      curve: Curves.easeOutQuad);
  EzAnimation get color => _color;
  EzAnimation get opacity => _opacity;

  void change({required bool isLight}) {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (isLight) {
        _color = EzAnimation.tween(
            ColorTween(
                begin: Colors.deepOrange, end: Colors.orangeAccent.shade200),
            const Duration(seconds: 1),
            curve: Curves.easeOutQuad);
      } else {
        _color = EzAnimation.tween(
            ColorTween(
                begin: Colors.deepOrange.shade800, end: Colors.blue.shade900),
            const Duration(seconds: 1),
            curve: Curves.easeOutQuad);
      }
      WidgetsBinding.instance!.addPostFrameCallback((_) async {
        _color.start();
        _opacity.start();
      });
      Logger.e('EZAnimation _color => ${_color.value}');
      notifyListeners();
    });
  }

  void stop() {
    _color.reset(); // It may be ignore
    _opacity.reset();
    exit();
  }

  static Future<void> exit() async {
    await FullScreen.exitFullScreen();
  }
}

class AlarmManager extends ChangeNotifier {
  AlarmManager(this.read);
  final Reader read;

  int _alarmHour = 12;
  int _alarmMinute = 00;
  double _FABsize = 0;
  final _iconsize = EzAnimation(0.0, 30.0, const Duration(milliseconds: 200));
  int get alarmHour => _alarmHour;
  int get alarmMinute => _alarmMinute;
  double get FABsize => _FABsize;
  EzAnimation get iconsize => _iconsize;

  /// set internal time
  ///
  ///   ex.) 5:42 => 5:50
  void internal() {
    final now = DateTime.now();

    // in case n:00, make into n:10 forcedly.
    if (now.minute == 00) {
      _alarmMinute++;
    }

    final minute = (now.minute / 10).ceil() * 10;

    // in case n:53, it'll get n:60. So, make into n+1:00 forcedly.
    if (minute == 60) {
      _alarmHour = now.hour + 1;
      _alarmMinute = 0;
    } else {
      _alarmHour = now.hour;
      _alarmMinute = minute;
    }
    notifyListeners();
    Logger.s(
        '- from AlarmManager \n > now = ${now.toString()}\n >> save int alarmHour = $_alarmHour\n >> save int alarmMinute = $_alarmMinute');
  }

  void change({required TimeOfDay value}) {
    _alarmHour = value.hour;
    _alarmMinute = value.minute;
    notifyListeners();
  }

  Future<void> show() async {
    Logger.e('- from AlarmManager\n > showFAB called ! ');
    _iconsize.reset();
    _FABsize = 0;
    notifyListeners();
    await Future<void>.delayed(const Duration(milliseconds: 300));
    _iconsize.start();
    _FABsize = 40;
    notifyListeners();
  }
}
