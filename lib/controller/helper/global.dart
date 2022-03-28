part of '../controller.dart';

class GlobalController extends StateNotifier<GlobalState> {
  GlobalController() : super(const GlobalState());
  void updateIsFirst({required bool value}) {
    state = state.copyWith(isFirst: value);
    PrefManager().setBool(key: PrefKey.isFirst, value: value);
    Logger.s('- from GlobalState \n >> save bool isFirst = ${state.isFirst}');
  }

  static void switchFullScreen({required bool value}) {
    if (Platform.isAndroid) {
      if (value) {
        FlutterWindowManager.clearFlags(
          FlutterWindowManager.FLAG_DISMISS_KEYGUARD,
        );
        FlutterWindowManager.clearFlags(
          FlutterWindowManager.FLAG_SHOW_WHEN_LOCKED,
        );
      } else {
        FlutterWindowManager.clearFlags(
          FlutterWindowManager.FLAG_DISMISS_KEYGUARD,
        );
        FlutterWindowManager.clearFlags(
          FlutterWindowManager.FLAG_SHOW_WHEN_LOCKED,
        );
      }
    }
  }
}
