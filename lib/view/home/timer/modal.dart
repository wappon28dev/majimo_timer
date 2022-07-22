import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/view/components/modal.dart';
import 'package:majimo_timer/view/routes/transition.dart';

class TimerModals {
  const TimerModals(this.context, this.ref);
  final BuildContext context;
  final WidgetRef ref;

  Future<void> showSettingTimer(int index) {
    var targetDurCopy = ref.read(timerState).copyWith().targetDuration[index];
    void updateTargetIndexedDuration(Duration value) => ref
        .read(timerState.notifier)
        .updateTargetIndexedDuration(index: index, value: value);

    return showModal(
      context,
      ref,
      Icons.hourglass_bottom,
      'タイマーをセット',
      'タイマーをセットしましょう',
      [
        CupertinoTimerPicker(
          initialTimerDuration: targetDurCopy,
          onTimerDurationChanged: (Duration newDur) {
            targetDurCopy = newDur;
          },
        ),
        ElevatedButton(
          onPressed: () {
            updateTargetIndexedDuration(targetDurCopy);
            RouteManager.runPop(context);
          },
          child: const Text('決定'),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Future<void> showAskContinue() {
    return showModal(
      context,
      ref,
      Icons.contact_support,
      'お疲れ様でした！',
      '次のタイマーを開始しますか？',
      [
        const SizedBox(
          height: 70,
        ),
        ElevatedButton(
          onPressed: () => print('ok'),
          child: const Text('GO!'),
        ),
      ],
    );
  }
}
