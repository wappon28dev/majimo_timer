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
  final String privacyURL =
      'https://github.com/wappon-28-dev/majimo_timer/blob/main/privacy_policy.txt';
}

class AppTeam extends AboutAppTeam {
  AppTeam({super.key});
  final Map<String, String> debuggers = {
    'nagi65536': 'assets/images/me.png',
    'yukina': 'assets/images/me.png',
    'HiRO': 'assets/images/me.png',
    'katohiro': 'assets/images/me.png',
    'oyama': 'assets/images/me.png',
    'nasubi': 'assets/images/me.png',
    'takumi': 'assets/images/me.png',
    'naka': 'assets/images/me.png',
    'Ta': 'assets/images/me.png',
    'aisukeee': 'assets/images/me.png',
    'moto0701': 'assets/images/me.png',
    'Yoyoyoyoyoyo': 'assets/images/me.png',
    'gu': 'assets/images/me.png',
    'katoso': 'assets/images/me.png',
    'roto': 'assets/images/me.png',
    'hyodosyun': 'assets/images/me.png',
  };
}

class AppDataStore {
  final String versionStr = 'majimo_timer v0.7.3 β';
  final String buildDate = '2022/09/26 0:20';
  final String changeLog = '''

[fix]
  1. updated flutter & dart packages
  2. added numberPad UI
  3. fixed redundancy syntax for update
  4. follow some lint rules
  5. dart fix applied

[known-bug]
  1. Overlay TK screen always applied
  2. home shortcut icons are blank
    ''';
}
