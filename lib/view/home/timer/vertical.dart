part of 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final timerstate = ref.read(timerState);
  Widget content() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Center(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white,
              elevation: 4,
              child: Container(
                margin: const EdgeInsets.all(10),
                //height: 400,
                child: Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Text(
                          ref.watch(timerState).targetDurationStr,
                          style: TextStyle(
                            fontSize: 70,
                            color: ColorKey.red.value,
                            fontFamily: 'M-plus-B',
                          ),
                        ),
                        onTap: () async {
                          final result = await showDurationPicker(
                            context: context,
                            initialTime: timerstate.targetDuration,
                            baseUnit: BaseUnit.minute,
                          );
                          if (result != null &&
                              result != timerstate.targetDuration) {
                            ref
                                .read(timerState.notifier)
                                .updateTargetDuration(value: result.inMinutes);
                            Logger.i(
                              '- from majimo_timer/lib/view/home/timer/widget.dart \n >> receive result => $result',
                            );
                          }
                        },
                      ),
                      const Icon(
                        Icons.import_export,
                        size: 50,
                      ),
                      GestureDetector(
                        child: Text(
                          ref.watch(timerState).targetIntervalDurationStr,
                          style: TextStyle(
                            fontSize: 70,
                            color: ColorKey.red.value,
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
                                .updateTargetIntervalDuration(
                                  value: result.inMinutes,
                                );
                            Logger.i(
                              '- from majimo_timer/lib/view/home/timer/widget.dart \n >> receive result => $result',
                            );
                          }
                        },
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Text(
                      //       'something',
                      //       style: TextStyle(
                      //         fontSize: 30,
                      //         fontWeight: FontWeight.bold,
                      //         color: ColorKey.red.value,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
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
    );
  }

  return GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
    child: content(),
  );
}
