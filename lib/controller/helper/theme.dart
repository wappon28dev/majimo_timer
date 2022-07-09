part of '../controller.dart';

class ThemeController extends StateNotifier<ThemeState> {
  ThemeController() : super(const ThemeState());

  void updateTheme({required int value}) {
    state = state.copyWith(theme: value);
    PrefManager().setInt(key: PrefKey.appTheme, value: value);
    Logger.s('- from ThemeState \n >> save int theme = ${state.theme}');
  }

  void updateIsUsingMaterialYou({required bool value}) {
    state = state.copyWith(isUsingMaterialYou: value);
    PrefManager().setBool(key: PrefKey.isUsingMaterialYou, value: value);
    Logger.s(
      '- from ThemeState \n'
      '>> save bool isUsingMaterialYou = ${state.isUsingMaterialYou}',
    );
  }

  void updateSeedColor({required Color value}) {
    state = state.copyWith(seedColor: value);

    PrefManager().setInt(key: PrefKey.seedColor, value: value.value);
    Logger.s(
      '- from ThemeState \n'
      '>> save bool seedColor = ${state.seedColor}',
    );
  }

  bool isLight({required BuildContext context}) {
    final isLightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    final pref = state.theme;

    return (pref != 0) ? (pref == 1) : isLightMode;
  }

  // Color getOnBackgroundColor({
  //   required BuildContext context,
  //   required WidgetRef ref,
  // }) {
  //   final value = ref.read(themeState.notifier).isLight(context: context);
  //   final seedColor = ref.read(themeState).seedColor;
  //   return value
  //       ? lightTheme.colorScheme.primary
  //       : darkTheme.colorScheme.primary;
  // }

  ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: state.seedColor,
      inversePrimary: state.seedColor,
      background:
          ColorScheme.fromSeed(seedColor: state.seedColor).primaryContainer,
    );
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      colorSchemeSeed: state.seedColor,
      scaffoldBackgroundColor: colorScheme.secondaryContainer,
      backgroundColor: colorScheme.secondaryContainer,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colorScheme.inversePrimary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        actionsIconTheme: const IconThemeData(color: Colors.white),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      fontFamily: 'M-plus-M',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      pageTransitionsTheme: MyTheme.back,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  ThemeData get darkTheme {
    final colorSchemeDark = ColorScheme.fromSeed(
      seedColor: state.seedColor,
      inversePrimary: state.seedColor,
      brightness: Brightness.dark,
      background: ColorScheme.fromSeed(seedColor: state.seedColor).onSecondary,
    );
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      colorSchemeSeed: state.seedColor,
      scaffoldBackgroundColor: colorSchemeDark.onSecondary,
      backgroundColor: colorSchemeDark.onSecondary,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colorSchemeDark.primaryContainer,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      fontFamily: 'M-plus-M',
      pageTransitionsTheme: MyTheme.back,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
