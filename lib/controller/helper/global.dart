part of '../controller.dart';

class GlobalController extends StateNotifier<GlobalState> {
  GlobalController() : super(const GlobalState());
  void updateIsFirst({required bool value}) {
    state = state.copyWith(isFirst: value);
    PrefManager().setBool(key: PrefKey.isFirst, value: value);
    Logger.s('- from GlobalState \n >> save bool isFirst = ${state.isFirst}');
  }

  static void switchOverlayMode({required bool value}) {
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

  static Future<void> updateWakelock({required bool value}) async {
    if (value) {
      await Wakelock.enable();
      Logger.i(
        '- from GeneralState \n >> Wakelock enabled',
      );
    } else {
      await Wakelock.disable();
      Logger.i(
        '- from GeneralState \n >> Wakelock disabled',
      );
    }
  }

  static void makeNavBarTransparent() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent, // navigation bar color
        statusBarColor: Colors.transparent, // status bar color
        systemStatusBarContrastEnforced: false,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
