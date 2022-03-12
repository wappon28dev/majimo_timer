class PathStore {
  final String translationCSV = 'assets/translations/langs.csv';
  final String splashLight = 'assets/splash/splash_light.riv';
  final String splashDark = 'assets/splash/splash_dark.riv';
  final String expandedPictureSun = 'assets/splash/sun.json';
  final String expandedPictureNight = 'assets/splash/wolf.json';
}

class AppDataStore {
  final String versionStr = 'majimo_timer v0.3.0 β';
  final String buildDate = '2022/03/13 2:52';
  final String changeLog = '''
[fix]
  1. Follow new linter rules: dart(require_trailing_commas)
  2. Classes & variables renamed
  3. Switch 2 splash rive animations with themeMode
  4. New columns in setting screen
  5. Available Android Notification Channel's translated name
  6. Rewrite .gitignore
  7. Preparing iOS build !

[known-bug]
  1. Overlay TK screen always applied
  2. native splash appears twice on A12
  3. home shortcut icons are blank
  4. multiple heroes exception appears
    ''';
}
