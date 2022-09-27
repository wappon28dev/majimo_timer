part of 'body.dart';

final isExpandedState = StateProvider<List<bool>>((ref) => [false, false]);

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final timerstate = ref.watch(timerState);
  final timerstateFunc = ref.read(timerState.notifier);
  final targetDuration = timerstate.targetDuration;
  final targetLN = ref.watch(timerState).targetLoopingNum;
  final targetRN = ref.watch(timerState).targetRepeatNum;
  final colorScheme = Theme.of(context).colorScheme;
  final shouldAskContinue = ref.watch(timerState).shouldAskContinue;

  void removeTimer(int index) {
    ref.read(timerState.notifier).removeTargetDurationList(index);

    ref.read(isExpandedState).removeAt(index);
  }

  final header = Column(
    children: const [
      SizedBox(height: 20),
      Icon(Icons.u_turn_left, color: Colors.white),
    ],
  );

  final footer = Column(
    children: [
      const SizedBox(height: 10),
      SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                // Foreground color
                foregroundColor: colorScheme.onPrimary,
                backgroundColor: colorScheme.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
              onPressed: () {
                timerstateFunc.addTargetDuration();
                ref.read(isExpandedState).add(false);
              },
              icon: const Icon(Icons.add),
              label: const Text('新しいタイマーを追加'),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                // Foreground color
                foregroundColor: colorScheme.onPrimary,
                backgroundColor: colorScheme.primary,
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
              onPressed: () {
                timerstateFunc.resetTargetDuration();
                ref.read(isExpandedState.notifier).state = [false, false];
              },
              icon: const Icon(Icons.delete_forever),
              label: const Text('タイマーのリセット'),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      const RotatedBox(
        quarterTurns: 2,
        child: Icon(Icons.u_turn_left, color: Colors.white),
      ),
    ],
  );

  Widget setTimer(int index) {
    final strDuration =
        timerstateFunc.targetDurationListStr(isUsingColon: true);

    final timerPicker = GestureDetector(
      child: AutoSizeText(
        strDuration[index],
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
        minFontSize: 50,
      ),
      onTap: () => TimerModals(context, ref).showSettingTimer(index),
    );

    final timerSetting = CheckboxListTile(
      title: const Text('タイマー終了時にモーダルを出して止める'),
      value: shouldAskContinue[index],
      onChanged: (_) => timerstateFunc.toggleShouldAskContinue(index),
      secondary: const Icon(Icons.add_task),
      controlAffinity: ListTileControlAffinity.trailing,
    );

    return Column(
      children: [
        timerPicker,
        const SizedBox(height: 20),
        const Divider(thickness: 2),
        timerSetting,
        targetDuration.length != 2
            ? OutlinedButton.icon(
                onPressed: () => removeTimer(index),
                icon: Icon(
                  Icons.delete_forever,
                  color: Theme.of(context).colorScheme.error,
                ),
                label: Text(
                  'このタイマーを削除',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget flow() {
    final rows = List<Widget>.generate(
      targetDuration.length,
      (int i) {
        if (i != 0) {
          return TapToExpand(
            content: Center(child: setTimer(i)),
            title: Text(
              timerstateFunc.targetDurationListStr(isUsingColon: false)[i],
            ),
            color: Theme.of(context).cardColor,
            iconColor: Colors.black,
            leading: Text((i).toString()),
            key: ValueKey(i),
            openedHeight: targetDuration.length != 2 ? 320 : 300,
            index: i,
          );
        } else {
          return SizedBox(key: ValueKey(i));
        }
      },
    );

    void onReorder(int oldIndex, int newIndex) {
      final row = rows.removeAt(oldIndex);
      rows.insert(newIndex, row);
      timerstateFunc.sortTargetDuration(oldIndex, newIndex);
    }

    return ReorderableColumn(
      onReorder: onReorder,
      children: rows,
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              header,
              flow(),
              footer,
              const SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: TimerModals(context, ref).askTargetRepeatNum,
                icon: const Icon(Icons.repeat_one, color: Colors.white),
                label: Text(
                  '繰り返し回数を指定: $targetRN',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              Text('\n\n タイマーの数: ${targetLN - 1}'),
              Text(timerstate.canStart.toString()),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  return GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
    child: content(),
  );
}
