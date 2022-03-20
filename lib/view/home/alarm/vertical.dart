part of 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  Widget content() {
    final current = ref.watch(alarmState).targetTime;
    Logger.i(
      '- from majimo_timer/lib/view/home/alarm/widget.dart \n >> current value => $current',
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
                  ref.read(alarmState.notifier).targetTimeStr,
                  style: const TextStyle(
                    fontSize: 70,
                    color: Colors.white,
                    fontFamily: 'M-plus-B',
                  ),
                ),
                onTap: () async {
                  final result = await showTimePicker(
                    context: context,
                    initialTime: current,
                  );
                  if (result != null && result != current) {
                    ref
                        .read(alarmState.notifier)
                        .updateTargetTime(value: result);
                    Logger.i(
                      '- from majimo_timer/lib/view/home/alarm/widget.dart \n >> receive result => $result',
                    );
                  }
                },
              ),
              ElevatedButton(
                child: const Text('set'),
                onPressed: () => number_pad(context: context, ref: ref),
              ),
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
                Text(t.alarm.t, style: const TextStyle(color: Colors.white)),
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
    decoration: const BoxDecoration(color: Color.fromRGBO(0, 163, 255, 1)),
    child: Material(
      color: Colors.transparent,
      child: SafeArea(child: content()),
    ),
  );
}
