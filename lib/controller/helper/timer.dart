part of '../controller.dart';

class TimerController extends StateNotifier<TimerState> {
  TimerController(this._read) : super(const TimerState());
  final Reader _read;

  void updateTargetDuration({required int value}) {
    state = state.copyWith(targetDuration: Duration(minutes: value));
    PrefManager().setInt(key: PrefKey.timerTarget, value: value);
    Logger.s('- from TimerState \n >> save int timerTarget = $value');
    _detectCanRun();
  }

  void updateTargetIntervalDuration({required int value}) {
    state = state.copyWith(targetIntervalDuration: Duration(minutes: value));
    PrefManager().setInt(key: PrefKey.timerInterval, value: value);
    Logger.s('- from TimerState \n >> save int timerInterval = $value');
    _detectCanRun();
  }

  void updateIntervalLoopingNum({required int value}) {
    state = state.copyWith(targetIntervalLoopingNum: value);
    PrefManager().setInt(key: PrefKey.timerIntervalNum, value: value);
    // Logger.s('- from TimerState \n >> save int intervalLoopingNum = $value');
    _detectCanRun();
  }

  void _detectCanRun() =>
      _read(generalState.notifier).updateShowFAB(value: state.canStart);
}

class TimerTimeKeepingController extends StateNotifier<TimerTimeKeepingState> {
  TimerTimeKeepingController(this._read) : super(const TimerTimeKeepingState());
  final Reader _read;

  CountDownController get _controller =>
      _read(currentValueState.notifier).controller;

  void runInitialStart() {
    _read(currentValueState.notifier).initializeCurrentIntervalDuration();
    _runStart();
  }

  void _runStart() {
    final targetTime = DateTime.now().add(_read(timerState).targetDuration);
    _updateFabMode(value: 0);
    state = state.copyWith(
      targetTime: TimeOfDay(hour: targetTime.hour, minute: targetTime.minute),
    );
    Logger.i(
      ' now     => ${DateTime.now()}\n'
      'duration => ${_read(timerState).targetDuration}\n target  => $targetTime',
    );
    NotificationManager().timerFinish(target: targetTime);
    NotificationManager().timerTimeKeeping(target: targetTime);
    state = state.copyWith(isCountingInterval: false);
  }

  void _runIntervalStart() {
    final targetIntervalDuration = _read(timerState).targetIntervalDuration;
    final targetTime =
        DateTime.now().add(_read(timerState).targetIntervalDuration);

    _updateFabMode(value: 0);
    state = state.copyWith(
      targetIntervalTime:
          TimeOfDay(hour: targetTime.hour, minute: targetTime.minute),
    );
    Logger.i(
      ' now     => ${DateTime.now()} \n'
      'duration => $targetIntervalDuration \n target  => $targetTime',
    );
    NotificationManager().timerFinish(target: targetTime);
    NotificationManager().timerTimeKeeping(target: targetTime);
    state = state.copyWith(isCountingInterval: true);
    _controller.restart(duration: targetIntervalDuration.inSeconds);
  }

  void runPause() {
    _controller.pause();
    NotificationManager().cancelAllNotifications();
    _updateFabMode(value: !state.isCountingInterval ? 1 : 2);
  }

  void runResume() {
    final target = DateTime.now().add(_read(currentValueState).currentDuration);
    Logger.i(
      ' now     => ${DateTime.now()} \n'
      'current => ${_read(currentValueState).currentDuration} \n'
      'target  => $target',
    );
    NotificationManager().timerFinish(target: target);
    NotificationManager().timerTimeKeeping(target: target);
    _controller.resume();
    _updateFabMode(value: 0);
  }

  void whenFinished() {
    _runIntervalStart();
  }

  void whenIntervalFinished({required BuildContext context}) {
    final targetDuration = _read(timerState).targetDuration;
    final targetNum = _read(timerState).targetIntervalLoopingNum;
    final currentNum = _read(currentValueState).currentIntervalLoopingNum;
    final isContinue = targetNum > currentNum + 1; // なぜか +1 しないといけない

    // core code of interval timer
    _read(currentValueState.notifier).incrementCurrentIntervalDuration();
    if (isContinue) {
      _controller.restart(duration: targetDuration.inSeconds);
      _runStart();
    } else {
      _runExit(context: context);
    }
  }

  void _updateFabMode({required int value}) =>
      state = state.copyWith(fabMode: value);

  void _runExit({required BuildContext context}) {
    RouteManager().runPush(
      context: context,
      page: const HomePage(),
      isReplace: true,
    );
    NotificationManager().cancelAllNotifications();
    _read(generalState.notifier).whenHome();
  }
}
