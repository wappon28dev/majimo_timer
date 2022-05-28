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

  void updateSeedColor({required BuildContext context, required Color value}) {
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
}
