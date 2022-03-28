part of '../controller.dart';

class ThemeController extends StateNotifier<ThemeState> {
  ThemeController() : super(const ThemeState());
  // change_value functions
  void updateTheme({required int value}) {
    state = state.copyWith(theme: value);
    PrefManager().setInt(key: PrefKey.appTheme, value: value);
    Logger.s('- from ThemeState \n >> save int theme = ${state.theme}');
  }

  bool isLight({required BuildContext context}) {
    final isLightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    final pref = state.theme;

    return (pref != 0) ? (pref == 1) : isLightMode;
  }
}
