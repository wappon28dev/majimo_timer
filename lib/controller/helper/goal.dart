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

  void runStart() {
    _updateStartedTime();
    state = state.copyWith(fabMode: 0);
    state = state.copyWith(isPaused: false);

    NotificationManager().goalTimeKeeping(from: state.startedTime!);
  }

  void runPause() {
    final now = DateTime.now();
    state = state.copyWith(fabMode: 1);
    state = state.copyWith(pausedTime: now);
    state = state.copyWith(isPaused: true);
    Logger.s(
      '- from GoalTKState \n'
      ' >> save DateTime? pausedTime = ${state.pausedTime}',
    );
  }

  void runResume() {
    state = state.copyWith(fabMode: 0);
    final diffPaused = DateTime.now().diff(state.pausedTime ?? DateTime.now());
    state = state.copyWith(pausedDuration: state.pausedDuration + diffPaused);
    state = state.copyWith(isPaused: false);
    Logger.s(
      '- from GoalTKState \n'
      ' >       Duration diffPaused     = $diffPaused \n'
      ' >> save Duration pausedDuration = ${state.pausedDuration}',
    );
  }

  void runQuit() => NotificationManager().cancelAllNotifications();

  void _updateStartedTime() {
    final now = DateTime.now();
    state = state.copyWith(startedTime: now);
    state = state.copyWith(pausedDuration: Duration.zero);
    Logger.s(
      '- from GoalTLState \n'
      ' >> save DateTime? startedTime = ${state.startedTime}',
    );
  }
}
