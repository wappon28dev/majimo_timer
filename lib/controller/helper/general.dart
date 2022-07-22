part of '../controller.dart';

class GeneralController extends StateNotifier<GeneralState> {
  GeneralController(this._read) : super(const GeneralState());
  final Reader _read;

  // change_value function
  void updateTopToast({required bool value}) {
    state = state.copyWith(topToast: value);
    PrefManager().setBool(key: PrefKey.topToast, value: value);
    Logger.s(
      '- from GeneralState \n >> save bool toptoast = ${state.topToast}',
    );
  }

  void updateToastDuration({required int value}) {
    state = state.copyWith(toastDuration: value);
    PrefManager().setInt(key: PrefKey.toastDuration, value: value);
    Logger.s(
      '- from GeneralState'
      '\n >> save int toastDuration = ${state.toastDuration}',
    );
  }

  Future<void> whenHome() async {
    await runFAB();
    updateShowFAB(value: true);

    await GlobalController.updateWakelock(value: false);
    GlobalController.makeNavBarTransparent();

    state = state.copyWith(opacity: 1);
    state = state.copyWith(status: t.greetings.t);

    await Future<void>.delayed(const Duration(seconds: 2));
    await updateStatus(text: DateTime.now().format('yMMMMEEEEd', t.lang.t));
  }

  Future<void> whenExpand() async {
    updateShowFAB(value: false);

    await GlobalController.updateWakelock(value: true);

    await updateStatus(text: '置き時計モード');
    await Future<void>.delayed(const Duration(seconds: 3));
    await updateStatus(
      text: '${DateTime.now().format('yMMMMEEEEd', t.lang.t)}'
          '・${AppDataStore().versionStr}',
    );
  }

  Future<void> updateStatus({required String text}) async {
    state = state.copyWith(opacity: 0);
    await Future<void>.delayed(const Duration(milliseconds: 600));
    state = state.copyWith(opacity: 1);
    state = state.copyWith(status: text);
  }

  Future<void> runFAB() async {
    state = state.copyWith(showFAB: false);
    await Future<void>.delayed(const Duration(milliseconds: 300));
    state = state.copyWith(showFAB: true);
  }

  void updateShowFAB({required bool value}) =>
      state = state.copyWith(showFAB: value);
}
