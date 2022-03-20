class PathStore {
  final String appIcon = 'assets/icons/icon.png';
  final String translationCSV = 'assets/translations/langs.csv';
  final String splashLight = 'assets/splash/splash_light.riv';
  final String splashDark = 'assets/splash/splash_dark.riv';
  final String expandedPictureSun = 'assets/splash/sun.json';
  final String expandedPictureNight = 'assets/splash/wolf.json';
  final String licenseURL =
      'https://github.com/wappon-28-dev/majimo_timer/blob/main/LICENSE';
  final String githubURL = 'https://github.com/wappon-28-dev/majimo_timer/';
}

class AppDataStore {
  final String versionStr = 'majimo_timer v0.3.3 β';
  final String buildDate = '2022/03/20 2:23';
  final String changeLog = '''
[fix]
  1. body, widget renamed to body, horizontal, vertical
  2. updated tutorial screen
  3. include url_launcher
  4. showSecond icon changed
  5. Added AboutDialog, LicensePage
  6. Preparing iOS build !

[known-bug]
  1. Overlay TK screen always applied
  2. native splash appears twice on A12
  3. home shortcut icons are blank
  4. multiple heroes exception appears
    ''';
}
