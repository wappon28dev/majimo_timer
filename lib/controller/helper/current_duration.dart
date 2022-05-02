part of '../controller.dart';

/*
class CurrentValueController extends StateNotifier<CurrentValueState> {
  CurrentValueController() : super(const CurrentValueState());

  final controller = CountDownController();

  void updateCurrentDuration({
    required Duration value,
    bool isUpCount = false,
  }) {
    // final _value = ((value.inMilliseconds) / 100).round();
    // state = state.copyWith(current: Duration(milliseconds: _value * 100));
    state = state.copyWith(
      // todo: separate method by goal condition.

      currentDuration: !isUpCount ? value : const Duration(days: 360) - value,
    );
  }

  void initializeCurrentIntervalDuration() {
    state = state.copyWith(currentIntervalLoopingNum: 1);
  }

  void incrementCurrentIntervalDuration() => state = state.copyWith(
        currentIntervalLoopingNum: state.currentIntervalLoopingNum + 1,
      );
}
*/
