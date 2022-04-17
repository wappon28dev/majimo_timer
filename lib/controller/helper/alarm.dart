part of '../controller.dart';

class AlarmController extends StateNotifier<AlarmState> {
  AlarmController(this.read) : super(const AlarmState());
  final Reader read;

  static void runPush({required BuildContext context, required WidgetRef ref}) {
    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const AlarmTimeKeepingPage(),
      ),
      (_) => false,
    );

    ref.read(generalState.notifier).runFAB();
    ref.read(alarmTKState.notifier).runStart();
  }

  static void runTooltip({required BuildContext context}) {
    RippleBackdropAnimatePage.show(
      context: context,
      childFade: true,
      duration: 300,
      blurRadius: 20,
      bottomHeight: 110,
      child: GestureDetector(
        behavior: HitTestBehavior.deferToChild,
        // onTap: () => Navigator.of(context).pop(),
        child: const Text(
          'test widget',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  /// set internal time
  ///
  ///   ex.) 5:42 => 5:50
  void runInitialize() {
    final now = DateTime.now();
    final amount = ((now.minute / 10).ceil() * 10) - now.minute;
    final target = now.addMinutes(amount);

    updateTargetTime(value: TimeOfDay.fromDateTime(target));

    Logger.s(
      '''
    - from AlarmState
    >   DateTime.now()      =  ${now.toString()}
    >> save int alarmHour   =  ${state.targetTime}
    ''',
    );
  }

  void updateTargetTime({required TimeOfDay value}) =>
      state = state.copyWith(targetTime: value);

  String get targetTimeStr {
    if (read(clockState).is24) {
      final now = DateTime.now();
      final dt = DateTime(
        now.year,
        now.month,
        now.day,
        state.targetTime.hour,
        state.targetTime.minute,
      );
      final format = DateFormat.jm();
      return format.format(dt);
    } else {
      final now = DateTime.now();
      final dt = DateTime(
        now.year,
        now.month,
        now.day,
        state.targetTime.hour,
        state.targetTime.minute,
      );
      final format = DateFormat.jm();
      return format.format(dt);
    }
  }
}

class AlarmTimeKeepingController extends StateNotifier<AlarmTimeKeepingState> {
  AlarmTimeKeepingController(this.read) : super(const AlarmTimeKeepingState());
  final Reader read;

  final controller = CountDownController();

  void runStart() {
    final tar = _calculateDuration(target: read(alarmState).targetTime);
    final duration = DateTimeRange(start: DateTime.now(), end: tar).duration;
    state = state.copyWith(targetDuration: duration);
    Logger.i('tar => $tar');
    Logger.i('duration => $duration');
    _state();
    NotificationManager().alarmFinish(target: tar);
    NotificationManager().alarmTimeKeeping(target: tar);
    GlobalController.switchFullScreen(value: false);
  }

  Future<void> _state() async {
    late String duration;
    duration = '約 ${state.targetDuration.inMinutes} 分間';
    if (state.targetDuration.inSeconds < 60) {
      duration = '１分未満';
    }
    if (state.targetDuration.inMinutes > 60) {
      duration = '約 ${state.targetDuration.inHours} 時間';
    }
    await read(generalState.notifier).updateStatus(text: '終了まで $duration です');
    await Future<void>.delayed(const Duration(seconds: 5));
    await read(generalState.notifier).updateStatus(text: 'アラームモード');
  }

  DateTime _calculateDuration({required TimeOfDay target}) {
    final now = DateTime.now();
    final tar = target;
    final intNow = (now.hour * 3600) + (now.minute * 60) + (now.second);
    final intVal = (tar.hour * 3600) + (tar.minute * 60);
    final day = (intNow < intVal) ? now.day : now.day + 1;
    return DateTime(now.year, now.month, day, tar.hour, tar.minute);
  }
}
