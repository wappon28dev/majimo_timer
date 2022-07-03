part of 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final width = MediaQuery.of(context).size.width;
  final timerstate = ref.read(timerState);
  final timerTKstate = ref.read(timerTKState);
  final isTimeKeeping = ref.read(globalState).isTimeKeeping;
  final currentTargetDuration =
      ref.read(timerTKState.notifier).currentTargetDuration;
  final diff = ref.watch(timerTKState.notifier).diff(ref);

  Widget content() {
    // Excuse `runNext` Func when isTimeKeeping && diff <= 0
    if (isTimeKeeping && diff.inSeconds <= 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(timerTKState.notifier).runNext(context, ref);
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
                children: <Widget>[
                  const Icon(Icons.hourglass_top),
                  const SizedBox(width: 20),
                  Text(
                    '${currentTargetDuration.inMinutes}分間',
                  ),
                  const SizedBox(width: 20),
                  const Text('・'),
                  const SizedBox(width: 20),
                  Text(
                    ref.read(timerTKState.notifier).targetTime.toString(),
                  ),
                ],
              ),
              Text(
                'phase : '
                '${timerTKstate.currentLoopingNum}'
                ' / '
                '${timerstate.targetLoopingNum - 1}',
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
  final indicator = ref.watch(timerTKState.notifier).indicator(ref: ref);

  Color _front() => Colors.redAccent.shade200;

  Color _back() => Colors.red.shade100;

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
