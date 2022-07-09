part of '../controller.dart';

class TimerController extends StateNotifier<TimerState> {
  TimerController(this._read) : super(const TimerState());
  final Reader _read;

  void updateTargetDuration({required List<Duration> value}) {
    state = state.copyWith(targetDuration: value);
    // PrefManager().setInt(key: PrefKey.timerTarget, value: listDuration);
    Logger.s(
      '- from TimerState \n >> save List<Duration> timerTarget = $value',
    );
    _detectCanRun();
  }

  void updateTargetIndexedDuration({
    required int index,
    required Duration value,
  }) {
    final removedList = state.targetDuration.removeAt(index);
    state.targetDuration.insert(index, value);
    Logger.i(state.targetDuration);
  }

  void addTargetDuration() {
    final value = state.targetDuration + [const Duration(minutes: 30)];
    updateTargetDuration(value: value);
  }

  void resetTargetDuration() {
    updateTargetDuration(
      value: [const Duration(minutes: 1), const Duration(minutes: 2)],
    );
  }

  void sortTargetDuration(int oldIndex, int newIndex) {
    final removedList = state.targetDuration.removeAt(oldIndex);
    state.targetDuration.insert(newIndex, removedList);
    Logger.s(
      '- from TimerState\n'
      '>> save List<Duration> timerTarget = ${state.targetDuration}',
    );
  }

  void updateIntervalTargetLoopingNum({required int value}) {
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

  int get _currentLN => state.currentLoopingNum;
  int get _targetLN => _read(timerState).targetDuration.length;
  Duration get currentTargetDuration =>
      _read(timerState).targetDuration[_currentLN];

  DateTime get targetTime {
    final startedTime = state.startedTime ?? DateTime.now();
    final diff = currentTargetDuration + state.pausedDuration;
    return startedTime.add(diff);
  }

  /// get entirety Duration with `pausedDuration`
  Duration get entirety {
    return currentTargetDuration + state.pausedDuration;
  }

  // todo: もっと簡単に！
  Duration diff(WidgetRef ref) {
    final now = ref.watch(nowStream).value ?? DateTime.now();
    final startedTime = state.startedTime ?? DateTime.now();
    final pausedTime = state.pausedTime ?? DateTime.now();
    final targetDuration = _read(timerState).targetDuration;

    var value = Duration.zero;

    if (!state.isPaused) {
      value = targetTime.difference(now);
    } else {
      value = targetDuration[_currentLN] -
          pausedTime.difference(startedTime) +
          state.pausedDuration;
    }

    return value;
  }

  Future<void> _createNotification({required bool isInterval}) async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    await NotificationManager().timerFinish(target: targetTime);
    await NotificationManager().timerTimeKeeping(
      target: targetTime,
    );
  }

  String indicator({required WidgetRef ref}) {
    final value = diff(ref);

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
    final target = currentTargetDuration;

    final value = 1 - diff(ref).inMicroseconds / target.inMicroseconds;

    return (value >= 0 && value <= 1) ? value : 0;
  }

  void _initialize() {
    state = state.copyWith(currentLoopingNum: 1);
    _read(globalState.notifier).updateIsTimeKeeping(value: true);
  }

  void _runStart() {
    state = state.copyWith(startedTime: DateTime.now());
    state = state.copyWith(pausedDuration: Duration.zero);
    state = state.copyWith(isPaused: false);

    Logger.i(
      'targetTime   => $targetTime',
    );
    _createNotification(isInterval: false);
    GlobalController.updateWakelock(value: true);
  }

  void runInitialStart() {
    _initialize();
    _runStart();
  }

  void runPause() {
    final now = DateTime.now();
    NotificationManager().cancelAllNotifications();
    state = state.copyWith(pausedTime: now);
    state = state.copyWith(isPaused: true);
    Logger.i(
      'pausedTime => $now',
    );

    GlobalController.updateWakelock(value: false);
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
    GlobalController.updateWakelock(value: true);
  }

  void runNext(BuildContext context, WidgetRef ref) {
    if (_currentLN + 1 != _targetLN) {
      state = state.copyWith(currentLoopingNum: _currentLN + 1);
      _runStart();
    } else {
      _runExit(context, ref);
    }
  }

  void _runExit(BuildContext context, WidgetRef ref) {
    RouteManager(context, ref).runPush(
      page: const HomePage(),
      isReplace: true,
    );
    _delayedCancelNotification();
    _read(generalState.notifier).whenHome();
    GlobalController.updateWakelock(value: false);
    _read(globalState.notifier).updateIsTimeKeeping(value: false);
  }

  Future<void> _delayedCancelNotification() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    await NotificationManager().cancelAllNotifications();
  }
}
