part of '../controller.dart';

class CurrentDurationController extends StateNotifier<CurrentDurationState> {
  CurrentDurationController() : super(const CurrentDurationState());

  final controller = CountDownController();

  void change({required Duration value}) {
    // final _value = ((value.inMilliseconds) / 100).round();
    // state = state.copyWith(current: Duration(milliseconds: _value * 100));
    state = state.copyWith(current: value);
  }
}
