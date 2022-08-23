part of '../controller.dart';

class TimerController extends StateNotifier<TimerState> {
  TimerController(this._read) : super(const TimerState());
  final Reader _read;

  List<String> targetDurationListStr({required bool isUsingColon}) {
    final value = <String>[];

    for (final element in state.targetDurationList) {
      String formattedStr({required int index}) {
        final unit = [
          [t.hour.t, t.hours.t],
          [t.minute.t, t.minutes.t],
          [t.second.t, t.seconds.t]
        ];
        const space = ' ';
        var str = '';

        if (!isUsingColon) {
          if (element[index] != 0) {
            if (element[index] == 1) {
              str = element[index].toString() + space + unit[index][0] + space;
            } else {
              str = element[index].toString() + space + unit[index][1] + space;
            }
          }
        } else {
          if (index != 2) {
            str = '${element[index].toString().padLeft(2, '0')}:';
          } else {
            str = element[index].toString().padLeft(2, '0');
          }
          if (index == 0 && element[index] == 0) {
            str = '';
          }
        }
        return str;
      }

      final hours = formattedStr(index: 0);
      final minutes = formattedStr(index: 1);
      final seconds = formattedStr(index: 2);

      value.add(hours + minutes + seconds);
    }

    return value;
  }

  void toggleShouldAskContinue(int index) {
    final list = state.shouldAskContinue.toList();
    list[index] = !list[index];
    state = state.copyWith(shouldAskContinue: list);

    Logger.s(
      '- from TimerState \n'
      'save List<bool> shouldAskContinue = ${state.shouldAskContinue}',
    );
  }

  void updateShouldAskContinue({required List<bool> listBool}) {
    assert(listBool != <bool>[]);
    state = state.copyWith(shouldAskContinue: listBool);
    Logger.s(
      '- from TimerState \n'
      'save List<Duration> shouldAskContinue = $listBool',
    );
  }

  void updateTargetRepeatNum({required int value}) {
    assert(value >= 0);
    state = state.copyWith(targetRepeatNum: value);
    Logger.s(
      '- from TimerState \n'
      'save int targetRepeatNum = $value',
    );
  }

  void updateTargetDuration({required List<Duration> listDur}) {
    assert(listDur != <Duration>[]);
    state = state.copyWith(targetDuration: listDur);
    // PrefManager().setInt(key: PrefKey.timerTarget, value: listDuration);
    Logger.s(
      '- from TimerState \n >> save List<Duration> timerTarget = $listDur',
    );
    _detectCanRun();
  }

  void updateTargetIndexedDuration({
    required int index,
    required Duration value,
  }) {
    final list = state.targetDuration.toList();
    list[index] = value;
    state = state.copyWith(targetDuration: list);
    Logger.i(state.targetDuration);
    _detectCanRun();
  }

  void addTargetDuration() {
    final newTargetDurationList =
        state.targetDuration + [const Duration(minutes: 30)];
    final newShouldAskContinueList = state.shouldAskContinue + [false];
    updateTargetDuration(listDur: newTargetDurationList);
    updateShouldAskContinue(listBool: newShouldAskContinueList);
  }

  void resetTargetDuration() {
    updateTargetDuration(
      listDur: [const Duration(minutes: 1), const Duration(minutes: 2)],
    );
    updateShouldAskContinue(
      listBool: [false, false],
    );
    _detectCanRun();
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
    final minute = (value.inMinutes).remainder(60).toString().padLeft(2, '0');
    final second = (value.inSeconds).remainder(60).toString().padLeft(2, '0');

    if (value.inSeconds < 0) {
      return 'pausing...';
    }

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

  Future<void> runNext(BuildContext context, WidgetRef ref) async {
    final currentShouldAskContinue =
        _read(timerState).shouldAskContinue[_currentLN];

    final durationStrList =
        _read(timerState.notifier).targetDurationListStr(isUsingColon: true);
    final durationLocalStrList =
        _read(timerState.notifier).targetDurationListStr(isUsingColon: false);

    void _stepNext() {
      state = state.copyWith(currentLoopingNum: _currentLN + 1);
      _read(globalState.notifier).updateIsTimeKeeping(value: true);
      _runStart();
    }

    if (_currentLN + 1 != _targetLN) {
      if (currentShouldAskContinue) {
        final doneDurationStr = durationStrList[_currentLN];
        final doneDurationLocalStr = durationLocalStrList[_currentLN];
        final nextDurationStr = durationStrList[_currentLN + 1];

        _read(globalState.notifier).updateIsTimeKeeping(value: false);
        await TimerModals(context, ref)
            .showAskContinue(
                doneDurationStr: doneDurationStr,
                doneDurationLocalStr: doneDurationLocalStr,
                next: nextDurationStr)
            .then((_) => _stepNext());
      } else {
        _stepNext();
      }
    } else {
      print('exit processing : $_currentLN, $_targetLN');
      _runExit(context, ref);
    }
  }

  void _runExit(BuildContext context, WidgetRef ref) {
    RouteManager.runPush(
      context: context,
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
