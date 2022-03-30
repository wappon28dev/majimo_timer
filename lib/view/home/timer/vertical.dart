part of 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final timerstate = ref.read(timerState);
  Widget content() {
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
                  }
                },
              ),
              const Text('\n\n set targetIntervalLoopingNum !'),
              Text(ref.read(timerState).targetIntervalLoopingNum.toString()),
              Slider(
                label: timerstate.targetIntervalLoopingNum.toString(),
                min: 0,
                max: 10,
                value: timerstate.targetIntervalLoopingNum.toDouble(),
                activeColor: Colors.orange,
                inactiveColor: Colors.blueAccent,
                divisions: 10,
                onChanged: (value) => ref
                    .read(timerState.notifier)
                    .updateIntervalLoopingNum(value: value.toInt()),
              ),
              Text(timerstate.canStart.toString()),
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
