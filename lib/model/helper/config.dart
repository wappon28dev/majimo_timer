class PathStore {
  final String translationCSV = 'assets/translations/langs.csv';
  final String splashLight = 'assets/splash/splash_light.riv';
  final String splashDark = 'assets/splash/splash_dark.riv';
  final String expandedPictureSun = 'assets/splash/sun.json';
  final String expandedPictureNight = 'assets/splash/wolf.json';
}

class AppDataStore {
  final String versionStr = 'majimo_timer v0.3.1 β';
  final String buildDate = '2022/03/16 3:00';
  final String changeLog = '''
[fix]
  1. ALL classes & variables renamed
  2. variables' & functions' name:
      lowercase_with_underscores
         -> lowerCamelCase
  3. Rewrite .gitignore
  4. Preparing iOS build !

[known-bug]
  1. Overlay TK screen always applied
  2. native splash appears twice on A12
  3. home shortcut icons are blank
  4. multiple heroes exception appears
    ''';
}
