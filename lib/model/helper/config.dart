import 'package:flutter/material.dart';
import 'package:majimo_timer/view/setting/about.dart';

class PathStore {
  final String appIcon = 'assets/images/icons/icon.png';
  final String meidenLogo = 'assets/images/meiden_logo.png';
  final String translationJSON = 'assets/l10n';
  final String splashLight = 'assets/splash/splash_light.riv';
  final String splashDark = 'assets/splash/splash_dark.riv';
  final String expandedPictureSun = 'assets/splash/sun.json';
  final String expandedPictureNight = 'assets/splash/wolf.json';
  final String licenseURL =
      'https://github.com/wappon-28-dev/majimo_timer/blob/main/LICENSE';
  final String githubURL = 'https://github.com/wappon-28-dev/majimo_timer/';
  final String meidenURL = 'https://www.meiden.ed.jp/sp/';
  final String miscURL = 'https://www.meiden.ed.jp/club/detail.html?id=305';
}

class AppTeam extends AboutAppTeam {
  AppTeam({Key? key}) : super(key: key);
  final Map<String, String> debuggers = {
    'katoso_1': 'assets/images/me.png',
    'katoso_2': 'assets/images/me.png',
    'katoso_3': 'assets/images/me.png',
  };
}

class AppDataStore {
  final String versionStr = 'majimo_timer v0.4.2 β';
  final String buildDate = '2022/04/05 3:34';
  final String changeLog = '''
[fix]
  1. Made interval logic more safe
  2. Renamed some function & name names
  3. Added goal page & auto focus to keyboard
  4. Improved 3 pages' UI using Scaffold
  5. Prepare digital signature
      for Google Play Console, AppStore!

[known-bug]
  1. Overlay TK screen always applied
  2. native splash appears twice on A12
  3. home shortcut icons are blank
    ''';
}
