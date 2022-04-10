part of 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final current = ref.watch(alarmState).targetTime;
  Logger.i(
    '- from majimo_timer/lib/view/home/alarm/widget.dart \n >> current value => $current',
  );
  Widget content() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Center(
        child: Column(
          children: [
            roundedCard(
              context: context,
              ref: ref,
              body: <Widget>[
                GestureDetector(
                  child: Text(
                    ref.read(alarmState.notifier).targetTimeStr,
                    style: TextStyle(
                      fontSize: 70,
                      color: ColorKey.blue.value,
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
                  onPressed: () => numberPad(context: context, ref: ref),
                ),
              ],
            ),
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
