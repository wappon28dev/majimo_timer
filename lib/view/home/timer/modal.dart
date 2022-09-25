import 'package:auto_size_text/auto_size_text.dart';
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

  Future<void> showAskContinue({
    required String doneDurationStr,
    required String doneDurationLocalStr,
    required String next,
  }) {
    final isLight = ref.read(themeState.notifier).isLight(context: context);
    final colorScheme = Theme.of(context).colorScheme;
    final textColor = isLight ? Colors.green : Colors.greenAccent.shade200;

    return showModal(
      context,
      ref,
      Icons.contact_support,
      'お疲れ様でした！',
      '次のタイマーを開始しますか？',
      [
        const SizedBox(
          height: 20,
        ),
        AutoSizeText(
          doneDurationStr,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: textColor,
            decoration: TextDecoration.lineThrough,
          ),
          textAlign: TextAlign.justify,
          maxLines: 1,
        ),
        Text(
          '$doneDurationLocalStr間を終えました!',
          style: TextStyle(
            color: textColor,
          ),
        ),
        const SizedBox(height: 10),
        const Icon(Icons.arrow_downward, size: 40),
        const SizedBox(height: 10),
        AutoSizeText(
          next,
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
          maxLines: 1,
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            foregroundColor: colorScheme.onPrimary,
            backgroundColor: colorScheme.primary,
            minimumSize: const Size(64, 60),
          ),
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.rocket_launch),
          label: const Text('次のタイマーへ進もう！ →'),
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          icon: const Icon(Icons.stop),
          onPressed: null,
          label: const Text('ここでやめる'),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
