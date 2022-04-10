part of '../controller.dart';

class GoalController extends StateNotifier<GoalState> {
  GoalController() : super(const GoalState());

  void updateGoal({required String value}) {
    state = state.copyWith(goal: value);
    // PrefManager().setInt(key: PrefKey., value: value);
    Logger.s('- from GoalState \n >> save String goal = ${state.goal}');
  }
}

class GoalTimeKeepingController extends StateNotifier<GoalTimeKeepingState> {
  GoalTimeKeepingController(this.read) : super(const GoalTimeKeepingState());
  Reader read;

  void _updateStartedTime() {
    final now = DateTime.now();
    state = state.copyWith(startedTime: now);
    // PrefManager().setInt(key: PrefKey., value: value);
    Logger.s(
        '- from GoalState \n >> save DateTime startedTime = ${state.startedTime}');
  }

  void runStart() {
    _updateStartedTime();
    state = state.copyWith(fabMode: 3);
  }
}
