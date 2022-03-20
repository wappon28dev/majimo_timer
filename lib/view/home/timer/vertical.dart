part of 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final timerstate = ref.read(timerState);

  Widget content() {
    Logger.i(
      '- from majimo_timer/lib/view/home/alarm/widget.dart \n'
      ' >> timerstate.targetDuration value => ${timerstate.targetDuration.toString()}',
    );

    return Stack(
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              GestureDetector(
                child: Text(
                  ref.watch(timerState).targetDurationStr,
                  style: const TextStyle(
                    fontSize: 70,
                    color: Colors.white,
                    fontFamily: 'M-plus-B',
                  ),
                ),
                onTap: () async {
                  final result = await showDurationPicker(
                    context: context,
                    initialTime: timerstate.targetDuration,
                    baseUnit: BaseUnit.minute,
                  );
                  if (result != null && result != timerstate.targetDuration) {
                    ref
                        .read(timerState.notifier)
                        .updateTargetDuration(value: result.inMinutes);
                    Logger.i(
                      '- from majimo_timer/lib/view/home/timer/widget.dart \n >> receive result => $result',
                    );
                    result == Duration.zero
                        ? ref
                            .read(generalState.notifier)
                            .updateShowFAB(value: false)
                        : ref
                            .read(generalState.notifier)
                            .updateShowFAB(value: true);
                  }
                },
              ),
              const Text('\n\n set interval:'),
              GestureDetector(
                child: Text(
                  ref.watch(timerState).targetIntervalDurationStr,
                  style: const TextStyle(
                    fontSize: 70,
                    color: Colors.white,
                    fontFamily: 'M-plus-B',
                  ),
                ),
                onTap: () async {
                  final result = await showDurationPicker(
                    context: context,
                    initialTime: timerstate.targetIntervalDuration,
                    baseUnit: BaseUnit.minute,
                  );
                  if (result != null &&
                      result != timerstate.targetIntervalDuration) {
                    ref
                        .read(timerState.notifier)
                        .updateTargetIntervalDuration(value: result.inMinutes);
                    Logger.i(
                      '- from majimo_timer/lib/view/home/timer/widget.dart \n >> receive result => $result',
                    );
                    result == Duration.zero
                        ? ref
                            .read(generalState.notifier)
                            .updateShowFAB(value: false)
                        : ref
                            .read(generalState.notifier)
                            .updateShowFAB(value: true);
                  }
                },
              ),
              const Text('\n\n set targetIntervalLoopingNum !'),
              Text(ref.read(timerState).targetIntervalLoopingNum.toString())
            ],
          ),
        ),
        Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 5),
                const Icon(Icons.alarm, color: Colors.white),
                const SizedBox(width: 5),
                Text(t.timer.t, style: const TextStyle(color: Colors.white)),
              ],
            ),
            Positioned(
              right: -15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  smallclock(context, ref, false),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  return Container(
    padding: const EdgeInsets.all(7),
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(color: ColorKey.red.value),
    child: Material(
      color: Colors.transparent,
      child: SafeArea(child: content()),
    ),
  );
}
