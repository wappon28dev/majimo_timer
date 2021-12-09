import 'package:flutter/material.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/theme.dart';
import 'package:majimo_timer/plugin/circular_reveal_animation/circular_reveal_animation.dart';
import 'package:majimo_timer/plugin/circular_reveal_animation/src/circular_reveal_animation.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:majimo_timer/view/home/alarm/timekeeping/body.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:workmanager/workmanager.dart';
import '../../../main.dart';
import 'body.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:easy_localization/easy_localization.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final clockmanager = ref.watch(clockManager);
  final alarmmanager = ref.watch(alarmManager);
  Widget smallclock() {
    return Column(children: [
      DigitalClock(
        digitAnimationStyle: Curves.easeOutExpo,
        is24HourTimeFormat: clockmanager.is24,
        areaDecoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        hourMinuteDigitTextStyle: const TextStyle(
          fontSize: 17,
          height: 1,
          color: Colors.white,
        ),
        secondDigitTextStyle: const TextStyle(
          fontSize: 10,
          color: Colors.white,
        ),
        hourMinuteDigitDecoration:
            const BoxDecoration(color: Colors.transparent),
        secondDigitDecoration: const BoxDecoration(color: Colors.transparent),
      )
    ]);
  }

  Widget fab() {
    double radius = alarmmanager.FABsize;
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
                      iconSize: alarmmanager.iconsize.value,
                      enableFeedback: true,
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () {
                        ref.read(generalManager).push(
                            context: context,
                            name: const AlarmTimeKeepingPage());
                      }),
                ],
              ));
        });
  }

  Widget content() {
    TimeOfDay current = alarmmanager.get(mode: 0);
    Logger.i("- from majimo_timer/lib/view/home/alarm/widget.dart \n" +
        " >> current value => " +
        current.toString());
    return Stack(children: [
      Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 50),
          GestureDetector(
            child: Text(alarmmanager.get(mode: 1),
                style: const TextStyle(
                    fontSize: 70, color: Colors.white, fontFamily: 'M-plus-B')),
            onTap: () async {
              final TimeOfDay? result = await showTimePicker(
                context: context,
                initialTime: current,
                initialEntryMode: TimePickerEntryMode.dial,
              );
              if (result != null && result != current) {
                alarmmanager.change(value: result);
                Logger.i(
                    "- from majimo_timer/lib/view/home/alarm/widget.dart \n" +
                        " >> receive result => " +
                        result.toString());
              }
            },
          ),
          ElevatedButton(
              child: const Text("set"),
              onPressed: () {
                Logger.i("set alarm !!");
                // One off task registration
                Workmanager().registerOneOffTask("1", "task",
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
                Text('alarm'.tr(), style: const TextStyle(color: Colors.white)),
              ]),
          Positioned(
            right: -15,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  smallclock(),
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
  String tag = "alarm";

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
