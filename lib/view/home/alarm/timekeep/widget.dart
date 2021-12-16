import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/translations.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:majimo_timer/plugin/slide_digital_clock/slide_digital_clock.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../../../main.dart';
import 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final clockmanager = ref.read(clockManager);
  final alarmmanager = ref.read(alarmManager);
  final alarmTKmanager = ref.watch(alarmTimeKeepingManager);
  final generalmanager = ref.read(generalManager);
  final width = MediaQuery.of(context).size.width;

  @override
  Widget content() {
    return Stack(children: [
      Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Container(
                  height: width * 0.9,
                  alignment: Alignment.center,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      analogclock_timekeeping(context: context, ref: ref),
                      largeclock(context, ref, true, true),
                      CircularPercentIndicator(
                        radius: width * 0.9,
                        lineWidth: 10,
                        percent: alarmTKmanager.rate,
                        progressColor: Colors.blue,
                      ),
                    ],
                  )),
              Text(alarmTKmanager.rate.toString()),
              ElevatedButton(
                  onPressed: () => alarmTKmanager.update(),
                  child: Text("update!"))
            ]),
      ),
      Stack(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 5),
                const Icon(Icons.alarm),
                const SizedBox(width: 5),
                Text(t.alarm.t),
              ]),
          // Positioned(
          //   right: -15,
          //   child: Row(
          //       mainAxisAlignment: MainAxisAlignment.end,
          //       crossAxisAlignment: CrossAxisAlignment.end,
          //       children: [
          //         smallclock(context, ref, false),
          //       ]),
          // ),
        ],
      ),
      Align(alignment: Alignment.bottomCenter, child: fab(ref: ref)),
    ]);
  }

  return Scaffold(
    body: SafeArea(child: content()),
  );
}
