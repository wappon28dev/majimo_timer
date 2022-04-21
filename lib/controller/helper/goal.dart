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

  CountDownController get _controller =>
      read(currentValueState.notifier).controller;

  void _updateStartedTime() {
    final now = DateTime.now();
    state = state.copyWith(startedTime: now);
    // PrefManager().setInt(key: PrefKey., value: value);
    Logger.s(
      '- from GoalState \n'
      ' >> save DateTime startedTime = ${state.startedTime}',
    );
  }

  void runStart() {
    _updateStartedTime();
    state = state.copyWith(fabMode: 0);
    _controller.restart(duration: const Duration(days: 360).inSeconds);
    NotificationManager()
        .goalTimeKeeping(from: state.startedTime ?? DateTime.now());
  }

  void runPause() {
    _controller.pause();
    state = state.copyWith(fabMode: 1);
  }

  void runResume() {
    _controller.resume();
    state = state.copyWith(fabMode: 0);
  }

  void runQuit() => NotificationManager().cancelAllNotifications();
}
