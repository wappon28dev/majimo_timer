part of 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final width = MediaQuery.of(context).size.width;
  final controller = ref.read(alarmTKState.notifier).controller;
  Widget content() {
    return Stack(
      children: [
        Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                height: width * 0.9,
                alignment: Alignment.center,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    analogclockTimekeeping(context: context, ref: ref),
                    largeclock(context, ref, true, true),
                    percent(ref: ref, width: width)
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'target  => ${ref.read(alarmTKState).targetDuration.toString()}',
                style: TextStyle(
                  fontFamily: Platform.isAndroid ? 'monospace' : 'Menlo',
                ),
              ),
              // Text(
              //   'current => ${ref.watch(currentValueState).currentDuration}',
              //   style: TextStyle(
              //     fontFamily: Platform.isAndroid ? 'monospace' : 'Menlo',
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.alarm),
                  const SizedBox(width: 20),
                  Text('${ref.read(alarmState.notifier).targetTimeStr}まで'),
                  const SizedBox(width: 20),
                  const Text('・'),
                  const SizedBox(width: 20),
                  // Text(
                  //   'あと${ref.watch(currentValueState).currentDuration.inMinutes}分',
                  // ),
                ],
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
    leading: Opacity(
      opacity: 1,
      child: IconButton(
        icon: const Icon(Icons.alarm),
        onPressed: () {},
        enableFeedback: false,
      ),
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
    backgroundColor: Colors.blue,
  );
}

Widget percent({required WidgetRef ref, required double width}) {
  final alarmTKstate = ref.read(alarmTKState);
  final duration = alarmTKstate.targetDuration;

  return CircularCountDownTimer(
    duration: duration.inSeconds,
    controller: ref.read(alarmTKState.notifier).controller,
    width: width,
    height: width,
    ringColor: Colors.blue.shade100,
    fillColor: Colors.blue,
    backgroundColor: Colors.transparent,
    strokeWidth: 10,
    textStyle: const TextStyle(
      fontSize: 33,
      fontWeight: FontWeight.bold,
    ),
    textFormat: CountdownTextFormat.MM_SS,
    isReverse: true,
    isTimerTextShown: false,
    onStart: () {},
    onComplete: () {},
  );

  // return PlayAnimation<double>(
  //   tween: Tween(begin: 0, end: 1),
  //   duration: duration,
  //   builder: (context, child, value) {
  //     return CircularPercentIndicator(
  //       radius: width * 0.9,
  //       lineWidth: 10,
  //       percent: value,
  //       progressColor: ColorKey.blue.value,
  //     );
  //   },
  // );
}
