import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/translations.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:majimo_timer/plugin/slide_digital_clock/slide_digital_clock.dart';
import 'package:majimo_timer/view/home/alarm/timekeeping/body.dart';
import 'package:majimo_timer/vm/viewmodel.dart';
import 'package:workmanager/workmanager.dart';

import '../../../main.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final clockmanager = ref.watch(clockManager);
  final alarmmanager = ref.watch(alarmManager);
  final generalmanager = ref.read(generalManager);

  Widget fab() {
    var radius = alarmmanager.FABsize;
    return AnimatedBuilder(
        animation: alarmmanager.iconsize,
        builder: (context, snapshot) {
          return SizedBox(
              height: 120,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: radius,
                    backgroundColor: Colors.green.shade200,
                  ),
                  IconButton(
                      padding: const EdgeInsets.all(20),
                      color: Colors.black,
                      iconSize: alarmmanager.iconsize.value as double,
                      enableFeedback: true,
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () {
                        generalmanager.push(
                            context: context,
                            name: const AlarmTimeKeepingPage());
                      }),
                ],
              ));
        });
  }

  Widget content() {
    final current = alarmmanager.alarm_value;
    Logger.i('- from majimo_timer/lib/view/home/alarm/widget.dart \n' +
        ' >> current value => ' +
        current.toString());
    return Stack(children: [
      Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 50),
          GestureDetector(
            child: Text(alarmmanager.alarm_value_str,
                style: const TextStyle(
                    fontSize: 70, color: Colors.white, fontFamily: 'M-plus-B')),
            onTap: () async {
              final result = await showTimePicker(
                context: context,
                initialTime: current,
                initialEntryMode: TimePickerEntryMode.dial,
              );
              if (result != null && result != current) {
                alarmmanager.change(value: result);
                Logger.i(
                    '- from majimo_timer/lib/view/home/alarm/widget.dart \n' +
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
                Workmanager().registerOneOffTask('1', 'task',
                    initialDelay: const Duration(seconds: 3));
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
                Text(t.alarm.t, style: const TextStyle(color: Colors.white)),
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
      Align(alignment: Alignment.bottomCenter, child: fab()),
    ]);
  }

  return Container(
    padding: const EdgeInsets.all(7),
    child: Material(
      color: Colors.transparent,
      child: SafeArea(child: content()),
    ),
    clipBehavior: Clip.antiAlias,
    decoration: const BoxDecoration(color: Color.fromRGBO(0, 163, 255, 1)),
  );
}

Widget buildHorizontal(BuildContext context) {
  var tag = 'alarm';

  return Container(
    padding: const EdgeInsets.all(20),
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
    clipBehavior: Clip.antiAlias,
    decoration: const BoxDecoration(color: Color.fromRGBO(0, 163, 255, 1)),
  );
}
