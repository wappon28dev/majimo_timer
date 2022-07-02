part of 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final width = MediaQuery.of(context).size.width;
  final timerstate = ref.read(timerState);
  final timerTKstate = ref.read(timerTKState);

  final targetDuration = timerstate.targetDuration;
  final targetIntervalDuration = timerstate.targetIntervalDuration;

  final diff = ref.watch(timerTKState.notifier).diff(ref: ref);

  // if (diff.inSeconds < 0) {
  //   (!timerTKstate.isCountingInterval)
  //       ? ref.read(timerTKState.notifier).whenFinished()
  //       : ref
  //           .read(timerTKState.notifier)
  //           .whenIntervalFinished(context: context);
  // }
  Widget content() {
    if (timerTKstate.isCountingInterval && diff.inSeconds == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        (!timerTKstate.isCountingInterval)
            ? ref.read(timerTKState.notifier).whenFinished()
            : ref
                .read(timerTKState.notifier)
                .whenIntervalFinished(context: context);
      });
    }

    return Stack(
      children: [
        Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                height: width * 0.9,
                width: width * 0.9,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: count(context: context, ref: ref),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                diff.toString(),
                style: TextStyle(
                  fontFamily: Platform.isAndroid ? 'monospace' : 'Menlo',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: !timerTKstate.isCountingInterval
                    ? <Widget>[
                        const Icon(Icons.hourglass_top),
                        const SizedBox(width: 20),
                        Text(
                          '${targetDuration.inMinutes}分間',
                        ),
                        const SizedBox(width: 20),
                        const Text('・'),
                        const SizedBox(width: 20),
                        Text(
                          ref.read(timerTKState.notifier).targetTime.toString(),
                        ),
                      ]
                    : [
                        const Icon(Icons.hourglass_top),
                        const SizedBox(width: 20),
                        Text(
                          '${targetIntervalDuration.inMinutes}分間',
                        ),
                        const SizedBox(width: 20),
                        const Text('・'),
                        const SizedBox(width: 20),
                        Text(
                          ref
                              .read(timerTKState.notifier)
                              .targetIntervalTime
                              .toString(),
                        ),
                      ],
              ),
              Text(
                'phase : '
                '${ref.read(timerTKState).currentIntervalLoopingNum}'
                ' / '
                '${ref.read(timerState).targetIntervalLoopingNum}',
              ),
            ],
          ),
        ),
      ],
    );
  }

  return Scaffold(
    body: SafeArea(child: content()),
    appBar: appbar(context: context, ref: ref),
  );
}

AppBar appbar({required BuildContext context, required WidgetRef ref}) {
  return AppBar(
    centerTitle: true,
    leading: PlayAnimation(
      tween: Tween<double>(begin: 0, end: 1),
      delay: const Duration(milliseconds: 5900),
      duration: const Duration(milliseconds: 300),
      builder: (context, child, value) {
        return Opacity(
          opacity: value! as double,
          child: IconButton(
            icon: const Icon(Icons.alarm),
            onPressed: () {},
            enableFeedback: false,
          ),
        );
      },
    ),
    title: AnimatedOpacity(
      opacity: ref.watch(generalState).opacity,
      duration: const Duration(milliseconds: 300),
      child: AutoSizeText(
        ref.watch(generalState).status,
        style: const TextStyle(fontWeight: FontWeight.bold),
        maxLines: 1,
      ),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    ),
    backgroundColor: Colors.red,
  );
}

List<Widget> count({required BuildContext context, required WidgetRef ref}) {
  final width = MediaQuery.of(context).size.width;
  final isLight = ref.read(themeState.notifier).isLight(context: context);
  final isCountingInterval = ref.read(timerTKState).isCountingInterval;
  final indicator = ref.watch(timerTKState.notifier).indicator(ref: ref);

  Color _front() => !isCountingInterval
      ? Colors.redAccent.shade200
      : Colors.blueAccent.shade200;

  Color _back() =>
      !isCountingInterval ? Colors.red.shade100 : Colors.blue.shade100;

  return <Widget>[
    CircularPercentIndicator(
      radius: width * 0.45,
      lineWidth: 15,
      percent: ref.read(timerTKState.notifier).rate(ref: ref),
      center: const SizedBox(),
      progressColor: _front(),
      backgroundColor: _back(),
      circularStrokeCap: CircularStrokeCap.square,
    ),
    AutoSizeText(
      indicator,
      style: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        color: isLight ? _front() : _back(),
      ),
      maxLines: 1,
    )
  ];
}

/*
Widget count({required BuildContext context, required WidgetRef ref}) {
  final timerstate = ref.read(timerState);
  final timerTKstate = ref.read(timerTKState);
  final size = MediaQuery.of(context).size;
  final controller = ref.read(currentValueState.notifier).controller;
  final isLight = ref.read(themeState.notifier).isLight(context: context);
  final isLessAnHour = ref.read(currentValueState).currentDuration.inHours > 0;

  return Padding(
    padding: const EdgeInsets.all(20),
    child: !timerTKstate.isCountingInterval
        ? CircularCountDownTimer(
            duration: timerstate.targetDuration.inSeconds,
            initialDuration: 0,
            controller: controller,
            width: size.width / 2,
            height: size.height / 2,
            ringColor: Colors.red.shade100,
            ringGradient: null,
            fillColor: Colors.redAccent.shade200,
            fillGradient: null,
            backgroundColor: Colors.transparent,
            backgroundGradient: null,
            strokeWidth: 10,
            strokeCap: StrokeCap.butt,
            textStyle: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: isLight ? Colors.redAccent.shade200 : Colors.red.shade100,
            ),
            textFormat:
                (ref.read(currentValueState).currentDuration.inHours > 0)
                    ? CountdownTextFormat.HH_MM_SS
                    : CountdownTextFormat.MM_SS,
            isReverse: true,
            isReverseAnimation: false,
            isTimerTextShown: true,
            autoStart: true, // trueじゃないとなぜか動かない
            onStart: null,
            onComplete: ref.read(timerTKState.notifier).whenFinished,
          )
        : CircularCountDownTimer(
            duration: timerstate.targetIntervalDuration.inSeconds,
            initialDuration: 0,
            controller: controller,
            width: size.width / 2,
            height: size.height / 2,
            ringColor: Colors.blue.shade100,
            ringGradient: null,
            fillColor: Colors.blueAccent.shade200,
            fillGradient: null,
            backgroundColor: Colors.transparent,
            backgroundGradient: null,
            strokeWidth: 10,
            strokeCap: StrokeCap.butt,
            textStyle: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color:
                  isLight ? Colors.blueAccent.shade200 : Colors.blue.shade100,
            ),
            textFormat: isLessAnHour
                ? CountdownTextFormat.HH_MM_SS
                : CountdownTextFormat.MM_SS,
            isReverse: true,
            isReverseAnimation: false,
            isTimerTextShown: true,
            autoStart: false,
            onStart: null,
            onComplete: () => ref
                .read(timerTKState.notifier)
                .whenIntervalFinished(context: context),
          ),
  );
}
*/
