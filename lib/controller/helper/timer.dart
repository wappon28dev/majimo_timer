part of '../controller.dart';

class TimerController extends StateNotifier<TimerState> {
  TimerController() : super(const TimerState());

  void updateTargetDuration({required int value}) {
    state = state.copyWith(targetDuration: Duration(minutes: value));
    PrefManager().setInt(key: PrefKey.timerTarget, value: value);
    Logger.s('- from TimerState \n >> save int timerTarget = $value');
  }

  void updateTargetIntervalDuration({required int value}) {
    state = state.copyWith(targetIntervalDuration: Duration(minutes: value));
    PrefManager().setInt(key: PrefKey.timerInterval, value: value);
    Logger.s('- from TimerState \n >> save int timerInterval = $value');
  }

  void updateIntervalLoopingNum({required int value}) {
    state = state.copyWith(targetIntervalLoopingNum: value);
    PrefManager().setInt(key: PrefKey.timerInterval, value: value);
    Logger.s('- from TimerState \n >> save int intervalLoopingNum = $value');
  }
}

class TimerTimeKeepingController extends StateNotifier<TimerTimeKeepingState> {
  TimerTimeKeepingController(this.read) : super(const TimerTimeKeepingState());
  final Reader read;

  CountDownController get controller =>
      read(currentDurationState.notifier).controller;

  void runStart() {
    final targetTime = DateTime.now().add(read(timerState).targetDuration);

    _updateFabMode(value: 0);
    state = state.copyWith(
      targetTime: TimeOfDay(hour: targetTime.hour, minute: targetTime.minute),
    );
    Logger.i(
      ' now     => ${DateTime.now()}\n'
      'duration => ${read(timerState).targetDuration}\n target  => $targetTime',
    );
    NotificationManager().timerFinish(target: targetTime);
    NotificationManager().timerTimeKeeping(target: targetTime);
    state = state.copyWith(isCountingInterval: false);
  }

  void runIntervalStart() {
    final targetIntervalDuration = read(timerState).targetIntervalDuration;
    final currentNum = read(currentDurationState).currentIntervalLoopingNum;
    final targetNum = read(timerState).targetIntervalLoopingNum;
    final targetTime =
        DateTime.now().add(read(timerState).targetIntervalDuration);

    _updateFabMode(value: 0);
    state = state.copyWith(
      targetTime: TimeOfDay(hour: targetTime.hour, minute: targetTime.minute),
    );
    Logger.i(
      ' -- interval begin =>  $currentNum / $targetNum -- \n'
      ' now     => ${DateTime.now()} \n'
      'duration => $targetIntervalDuration \n target  => $targetTime',
    );
    NotificationManager().timerFinish(target: targetTime);
    NotificationManager().timerTimeKeeping(target: targetTime);
    state = state.copyWith(isCountingInterval: true);
    controller.restart(duration: targetIntervalDuration.inSeconds);
  }

  void runPause() {
    controller.pause();
    NotificationManager().cancelAllNotifications();
    _updateFabMode(value: !state.isCountingInterval ? 1 : 2);
  }

  void runResume() {
    final target = DateTime.now().add(read(currentDurationState).current);
    Logger.i(
      ' now     => ${DateTime.now()} \n'
      'current => ${read(currentDurationState).current} \n target  => $target',
    );
    NotificationManager().timerFinish(target: target);
    NotificationManager().timerTimeKeeping(target: target);
    controller.resume();
    _updateFabMode(value: 0);
  }

  void whenFinished() {
    runIntervalStart();
  }

  void whenIntervalFinished() {
    final targetDuration = read(timerState).targetDuration;
    controller.restart(duration: targetDuration.inSeconds);
    runStart();
  }

  void _updateFabMode({required int value}) =>
      state = state.copyWith(fabMode: value);
}
