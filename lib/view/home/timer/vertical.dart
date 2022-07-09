part of 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final timerstate = ref.watch(timerState);
  final timerstateFunc = ref.read(timerState.notifier);
  final targetDuration = timerstate.targetDuration;
  final targetLN = ref.read(timerState).targetLoopingNum;
  final colorScheme = Theme.of(context).colorScheme;

  final header = Column(
    children: const [
      SizedBox(height: 20),
      Icon(Icons.u_turn_left, color: Colors.white),
    ],
  );

  final footer = Column(
    children: [
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              // Foreground color
              onPrimary: colorScheme.onPrimary,
              // Background color
              primary: colorScheme.primary,
            ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
            onPressed: timerstateFunc.addTargetDuration,
            icon: const Icon(Icons.add),
            label: const Text('新しいタイマーを追加'),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              // Foreground color
              onPrimary: colorScheme.onPrimary,
              // Background color
              primary: colorScheme.primary,
            ).copyWith(elevation: ButtonStyleButton.allOrNull(0)),
            onPressed: timerstateFunc.resetTargetDuration,
            icon: const Icon(Icons.delete_forever),
            label: const Text('タイマーのリセット'),
          ),
        ],
      ),
      const SizedBox(height: 10),
      const RotatedBox(
        quarterTurns: 2,
        child: Icon(Icons.u_turn_left, color: Colors.white),
      ),
    ],
  );

  Widget setTimer(int i) {
    final targetDuration = timerstate.targetDurationListStr[i];

    return GestureDetector(
      child: Text(targetDuration),
    );
  }

  Widget flow() {
    final rows = List<Widget>.generate(targetDuration.length, (int i) {
      if (i != 0) {
        return TapToExpand(
          content: Center(child: setTimer(i)),
          title: Text(timerstate.targetDurationListStr[i]),
          color: Theme.of(context).cardColor,
          iconColor: Colors.black,
          isExpand: false,
          leading: Text((i).toString()),
          key: ValueKey(i),
          openedHeight: 500,
        );
      } else {
        return SizedBox(key: ValueKey(i));
      }
    });

    void _onReorder(int oldIndex, int newIndex) {
      final row = rows.removeAt(oldIndex);
      rows.insert(newIndex, row);
      timerstateFunc.sortTargetDuration(oldIndex, newIndex);
    }

    return ReorderableColumn(
      onReorder: _onReorder,
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
                onPressed: () {},
                icon: const Icon(Icons.repeat_one, color: Colors.white),
                label: const Text(
                  '繰り返し回数を指定',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Text('\n\n タイマーの数: ${targetLN - 1}'),
              // Slider(
              //   label: targetLN.toString(),
              //   max: 10,
              //   value: targetLN.toDouble(),
              //   activeColor: Colors.orange,
              //   inactiveColor: Colors.blueAccent,
              //   divisions: 10,
              //   onChanged: (value) => ref
              //       .read(timerState.notifier)
              //       .updateTargetLoopingNum(value: value.toInt()),
              // ),
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
