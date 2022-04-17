part of '../controller.dart';

class ColorController extends StateNotifier<ColorState> {
  ColorController() : super(const ColorState());
  Future<void> updateColor({required bool isLight}) async {
    state = state.copyWith(opacity: 0);
    await Future<void>.delayed(const Duration(milliseconds: 100)); // 何故か必要
    state = state.copyWith(opacity: 1);
  }

  void stop() {
    state = state.copyWith(opacity: 0);
    _runExit();
  }

  Future<void> _runExit() async {
    await FullScreen.exitFullScreen();
  }
}
