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

  DateTime get targetTime {
    final startedTime = state.startedTime ?? DateTime.now();
    final diff = _read(timerState).targetDuration + state.pausedDuration;
    return startedTime.add(diff);
  }

  DateTime get targetIntervalTime {
    final startedIntervalTime = state.startedIntervalTime ?? DateTime.now();
    final diff =
        _read(timerState).targetIntervalDuration + state.pausedIntervalDuration;
    return startedIntervalTime.add(diff);
  }

  /// get entirety Duration with `pausedDuration`
  Duration get entirety {
    if (!state.isCountingInterval) {
      return _read(timerState).targetDuration + state.pausedDuration;
    } else {
      return _read(timerState).targetIntervalDuration +
          state.pausedIntervalDuration;
    }
  }

  // todo: もっと簡単に！
  Duration diff({required WidgetRef ref}) {
    final now = ref.watch(nowStream).value ?? DateTime.now();
    final startedTime = state.startedTime ?? DateTime.now();
    final startedIntervalTime = state.startedIntervalTime ?? DateTime.now();
    final pausedTime = state.pausedTime ?? DateTime.now();
    final pausedIntervalTime = state.pausedIntervalTime ?? DateTime.now();
    final targetDuration = _read(timerState).targetDuration;
    final targetIntervalDuration = _read(timerState).targetIntervalDuration;

    var value = Duration.zero;

    if (!state.isCountingInterval) {
      if (!state.isPaused) {
        value = targetTime.difference(now);
      } else {
        value = targetDuration -
            pausedTime.difference(startedTime) +
            state.pausedDuration;
      }

      if (value.inSeconds == 0) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          ref.read(timerTKState.notifier).whenFinished();
        });
      }
    } else {
      if (!state.isPaused) {
        value = targetIntervalTime.difference(now);
      } else {
        value = targetIntervalDuration -
            pausedIntervalTime.difference(startedIntervalTime) +
            state.pausedIntervalDuration;
      }
    }

    return value;
  }

  Future<void> _createNotification({required bool isInterval}) async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    await NotificationManager()
        .timerFinish(target: !isInterval ? targetTime : targetIntervalTime);
    await NotificationManager().timerTimeKeeping(
      target: !isInterval ? targetTime : targetIntervalTime,
    );
  }

  String indicator({required WidgetRef ref}) {
    final value = diff(ref: ref);

    final hour = value.inHours.toString();
    final minute = value.inMinutes.remainder(60).toString().padLeft(2, '0');
    final second = value.inSeconds.remainder(60).toString().padLeft(2, '0');

    if (value.inHours > 0) {
      return '$hour:$minute:$second';
    } else {
      return '$minute:$second';
    }
  }

  double rate({required WidgetRef ref}) {
    final target = (!state.isCountingInterval)
        ? _read(timerState).targetDuration
        : _read(timerState).targetIntervalDuration;

    final value = 1 - diff(ref: ref).inMicroseconds / target.inMicroseconds;

    return (value >= 0 && value <= 1) ? value : 0;
  }

  void _initialize() {
    state = state.copyWith(currentIntervalLoopingNum: 1);
  }

  void _incrementCurrentIntervalDuration() => state = state.copyWith(
        currentIntervalLoopingNum: state.currentIntervalLoopingNum + 1,
      );

  void _runStart() {
    state = state.copyWith(startedTime: DateTime.now());
    state = state.copyWith(pausedDuration: Duration.zero);
    state = state.copyWith(isCountingInterval: false);
    state = state.copyWith(isPaused: false);

    Logger.i(
      'targetTime   => $targetTime',
    );
    _createNotification(isInterval: false);
    GeneralController.updateWakelock(value: true);
  }

  void runInitialStart() {
    _initialize();
    _runStart();
  }

  void _runIntervalStart() {
    state = state.copyWith(startedIntervalTime: DateTime.now());
    state = state.copyWith(pausedIntervalDuration: Duration.zero);
    state = state.copyWith(isPaused: false);
    Logger.i(
      'startedIntervalTime => ${state.startedIntervalTime}',
    );
    state = state.copyWith(isCountingInterval: true);
    _createNotification(isInterval: true);
    GeneralController.updateWakelock(value: true);
  }

  void runPause() {
    final now = DateTime.now();
    NotificationManager().cancelAllNotifications();
    state = state.copyWith(pausedTime: now);
    state = state.copyWith(isPaused: true);
    Logger.i(
      'pausedTime => $now',
    );

    GeneralController.updateWakelock(value: false);
  }

  void runIntervalPause() {
    final now = DateTime.now();
    NotificationManager().cancelAllNotifications();
    state = state.copyWith(pausedIntervalTime: now);
    state = state.copyWith(isPaused: true);

    Logger.i(
      'pausedTime => $now',
    );

    GeneralController.updateWakelock(value: false);
  }

  void runResume() {
    final now = DateTime.now();
    final diffPaused = now.diff(state.pausedTime ?? DateTime.now());
    state = state.copyWith(pausedDuration: state.pausedDuration + diffPaused);
    state = state.copyWith(isPaused: false);

    Logger.s(
      '- from TimerTKState \n'
      ' >       Duration diffPaused     = $diffPaused \n'
      ' >> save Duration pausedDuration = ${state.pausedDuration}',
    );
    _createNotification(isInterval: false);
    GeneralController.updateWakelock(value: true);
  }

  void runIntervalResume() {
    final now = DateTime.now();
    final diffPaused = now.diff(state.pausedIntervalTime ?? DateTime.now());
    state = state.copyWith(
      pausedIntervalDuration: state.pausedIntervalDuration + diffPaused,
    );
    state = state.copyWith(isPaused: false);

    Logger.s(
      '- from TimerTKState \n'
      ' >       Duration diffPaused     = $diffPaused \n'
      ' >> save Duration pausedDuration = ${state.pausedIntervalDuration}',
    );
    _createNotification(isInterval: true);
    GeneralController.updateWakelock(value: true);
  }

  void whenFinished() {
    _runIntervalStart();
  }

  void whenIntervalFinished({required BuildContext context}) {
    final targetNum = _read(timerState).targetIntervalLoopingNum;
    final currentNum = state.currentIntervalLoopingNum;
    final isContinue = targetNum > currentNum;
    state = state.copyWith(isCountingInterval: false);

    // core code of interval timer
    _incrementCurrentIntervalDuration();
    if (isContinue) {
      _runStart();
    } else {
      _runExit(context: context);
    }
  }

  void _runExit({required BuildContext context}) {
    RouteManager().runPush(
      context: context,
      page: const HomePage(),
      isReplace: true,
    );
    _delayedCancelNotification();
    _read(generalState.notifier).whenHome();
    GeneralController.updateWakelock(value: false);
  }

  Future<void> _delayedCancelNotification() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    await NotificationManager().cancelAllNotifications();
  }
}
