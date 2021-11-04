import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/view/home/body.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import '../../../main.dart';
import 'body.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

Widget buildVertical(BuildContext context) {
  final clockmanager = useProvider(clockManager);

  String tag = "alarm";
  Widget smallclock() {
    return Column(children: [
      DigitalClock(
        digitAnimationStyle: Curves.easeOutExpo,
        is24HourTimeFormat: clockmanager.is24get(mode: 2),
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

  Widget content() {
    var _time = const TimeOfDay(hour: 10, minute: 47);
    return Stack(children: [
      Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const SizedBox(height: 50),
          GestureDetector(
            child: const Text("10:00",
                style: TextStyle(
                    fontSize: 70, color: Colors.white, fontFamily: 'M-plus-B')),
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay(hour: 10, minute: 47),
              );
            },
          ),
          createInlinePicker(
            elevation: 1,
            value: _time,
            onChange: onTimeChanged,
            iosStylePicker: clockmanager.is24get(mode: 2),
            minMinute: 7,
            maxMinute: 56,
          ),
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

void onTimeChanged(TimeOfDay p1) {}
