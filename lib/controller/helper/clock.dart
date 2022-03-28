part of '../controller.dart';

class ClockController extends StateNotifier<ClockState> {
  ClockController() : super(const ClockState());
  // change_value functions
  void updateIs24({required bool value}) {
    state = state.copyWith(is24: value);
    PrefManager().setBool(key: PrefKey.clockStyle, value: value);
    Logger.s('- from ClockState \n >> save bool is24 = $value');
  }

  void updateShowSec({required bool value}) {
    state = state.copyWith(showSec: value);
    PrefManager().setBool(key: PrefKey.showSec, value: value);
    Logger.s('- from ClockState \n >> save bool showSec = $value');
  }

  void updateAnimation({required int value}) {
    state = state.copyWith(animation: value);
    PrefManager().setInt(key: PrefKey.clockAnimation, value: value);
    Logger.s('- from ClockState \n >> save int animation = $value');
  }
}
