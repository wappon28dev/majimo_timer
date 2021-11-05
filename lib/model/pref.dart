import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKey {
  changeLanguage, //int 0 = system, 1 = Japanese, 2 = English
  clockStyle, //bool true = 24h, false = 12h
  appTheme, //int 0 = system, 1 = light, 2 = dark
  alarmHour, //int alarm timeOfDay
  alarmMinute, //int alarm timeOfDay
}

// extension TypeExtension on ValueKey {
//   String? get valueKey => valueKeys[this];
//   static final valueKeys = {
//     ValueKey.pref1: 'ChangeLanguage',
//     ValueKey.pref2: 'ClockStyle',
//     ValueKey.pref3: 'AppTheme'
//   };
// }

class PrefManager {
  static Future<bool> getBool({required PrefKey key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = prefs.getBool(key.toString()) ?? true;
    return result;
  }

  static Future<int> getInt({required PrefKey key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int result = prefs.getInt(key.toString()) ?? 0;
    return result;
  }

  static void setBool({required PrefKey key, required bool value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key.toString(), value);
  }

  static void setInt({required PrefKey key, required int value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key.toString(), value);
  }

  static void remove({required Type key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key.toString());
  }
}
