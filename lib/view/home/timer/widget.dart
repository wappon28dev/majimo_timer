import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:majimo_timer/plugin/slide_digital_clock/slide_digital_clock.dart';
import '../../../main.dart';
import 'package:duration_picker/duration_picker.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final clockmanager = ref.read(clockManager);
  final alarmmanager = ref.read(alarmManager);
  final generalmanager = ref.read(generalManager);
  final timermanager = ref.read(timerManager);
  Widget content() {
    final current = timermanager.target;
    Logger.i('- from majimo_timer/lib/view/home/alarm/widget.dart \n' +
        ' >> current value => ' +
        current.toString());

    return Stack(children: [
      Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 50),
          GestureDetector(
            child: Text(ref.watch(timerManager).target_str,
                style: const TextStyle(
                    fontSize: 70, color: Colors.white, fontFamily: 'M-plus-B')),
            onTap: () async {
              final result = await showDurationPicker(
                  context: context,
                  initialTime: current,
                  baseUnit: BaseUnit.minute);
              if (result != null && result != current) {
                ref
                    .read(timerManager.notifier)
                    .change_target(value: result.inMinutes);
                Logger.i(
                    '- from majimo_timer/lib/view/home/timer/widget.dart \n' +
                        ' >> receive result => ' +
                        result.toString());
              }
            },
          ),
          ElevatedButton(
              child: const Text('set'),
              onPressed: () {
                Logger.i('set alarm !!');
                // One off task registration
              }),
        ]),
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
              ]),
          Positioned(
            right: -15,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  smallclock(context, ref, false),
                ]),
          ),
        ],
      ),
    ]);
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

Widget buildHorizontal(BuildContext context) {
  const tag = 'timer';

  return Container(
    padding: const EdgeInsets.all(20),
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(color: ColorKey.red.value.withOpacity(0.5)),
    child: Material(
      color: Colors.transparent,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.alarm, color: Colors.white),
            Text(tag.tr(), style: const TextStyle(color: Colors.white)),
          ]),
    ),
  );
}
