part of 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final width = MediaQuery.of(context).size.width;
  final timerstate = ref.read(timerState);
  final timerTKstate = ref.read(timerTKState);

  final targetDuration = timerstate.targetDuration;
  final targetIntervalDuration = timerstate.targetIntervalDuration;
  Widget content() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Container(
            height: 0,
            alignment: Alignment.center,
            child: Stack(
              fit: StackFit.expand,
              children: [count(context: context, ref: ref)],
            ),
          ),
          Text(ref.read(goalState).goal),
          Text(ref.read(goalTKState).startedTime.toString()),
          Text(ref.watch(currentValueState).currentDuration.toString())
        ],
      ),
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

Widget count({required BuildContext context, required WidgetRef ref}) {
  final timerstate = ref.read(timerState);
  final timerTKstate = ref.read(timerTKState);
  final size = MediaQuery.of(context).size;
  final controller = ref.watch(currentValueState.notifier).controller;
  final isLight = ref.read(themeState.notifier).isLight(context: context);
  final isLessAnHour = ref.read(currentValueState).currentDuration.inHours > 0;

  return Padding(
    padding: const EdgeInsets.all(20),
    child: CircularCountDownTimer(
      duration: const Duration(days: 360).inSeconds,
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
      textFormat: (ref.read(currentValueState).currentDuration.inHours > 0)
          ? CountdownTextFormat.HH_MM_SS
          : CountdownTextFormat.MM_SS,
      isReverse: true,
      isReverseAnimation: false,
      isTimerTextShown: true,
      autoStart: true, // trueじゃないとなぜか動かない
      onStart: null,
      onComplete: ref.read(timerTKState.notifier).whenFinished,
      isUpCount: true,
    ),
  );
}
