part of '../controller.dart';

class LangController extends StateNotifier<LangState> {
  LangController() : super(const LangState());
  void updateLang({required BuildContext context, required int value}) {
    void locale(Locale locale) => context.setLocale(locale);
    state = state.copyWith(lang: value);
    switch (value) {
      case 0:
        context.resetLocale();
        break;
      case 1:
        locale(const Locale('ja', 'JP'));
        break;
      case 2:
        locale(const Locale('en', 'US'));
        break;
    }
    PrefManager().setInt(key: PrefKey.changeLanguage, value: state.lang);
    Logger.s('- from LangState \n >> save int lang = ${state.lang}');
  }
}
