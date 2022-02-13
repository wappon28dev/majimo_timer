import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/plugin/circular_countdown_timer-0.2.0/circular_countdown_timer.dart';
import 'package:majimo_timer/model/helper/plugin/slide_digital_clock/slide_digital_clock.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/view/home/timer/timekeeping/widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

import '../../../../main.dart';
import 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final width = MediaQuery.of(context).size.width;
  final controller = ref.read(alarmTKState.notifier).controller;
  Widget content() {
    return Stack(children: [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
                height: width * 0.9,
                alignment: Alignment.center,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    analogclock_timekeeping(context: context, ref: ref),
                    largeclock(context, ref, true, true),
                    percent(ref: ref, width: width)
                  ],
                )),
            const SizedBox(height: 10),
            Text(
              'target  => ${ref.read(alarmTKState).duration.toString()}',
              style: const TextStyle(
                fontFamily: 'monospace',
              ),
            ),
            Text(
              'current => ${ref.watch(currentDurationState).current}',
              style: const TextStyle(
                fontFamily: 'monospace',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.alarm),
                const SizedBox(width: 20),
                Text('${ref.read(alarmState).alarm_value_str}まで'),
                const SizedBox(width: 20),
                const Text('・'),
                const SizedBox(width: 20),
                Text('あと${ref.watch(currentDurationState).current.inMinutes}分')
              ],
            )
          ],
        ),
      ),
    ]);
  }

  return Scaffold(
    body: SafeArea(child: content()),
    appBar: appbar(context: context, ref: ref),
  );
}

AppBar appbar({required BuildContext context, required WidgetRef ref}) {
  return AppBar(
    centerTitle: true,
    leading: PlayAnimation(
      tween: Tween<double>(begin: 0, end: 1),
      delay: const Duration(milliseconds: 5900),
      duration: const Duration(milliseconds: 300),
      builder: (context, child, value) {
        return Opacity(
          opacity: value as double,
          child: IconButton(
            icon: const Icon(Icons.alarm),
            onPressed: () {},
            enableFeedback: false,
          ),
        );
      },
    ),
    title: AnimatedOpacity(
        opacity: ref.watch(generalState).opacity,
        duration: const Duration(milliseconds: 300),
        child: AutoSizeText(
          ref.watch(generalState).status,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 1,
        )),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    ),
    backgroundColor: Colors.blue,
    // actions: [
    //   IconButton(
    //       onPressed: () {
    //         PrefState.allremove();
    //         Logger.e("- from majimo_timer/lib/view/setting/body.dart \n" +
    //             " >> ! SharedPreferences All Removed ! <<");
    //         PrefState.restore(ref, context);
    //       },
    //       icon: const Icon(Icons.settings_backup_restore))
    // ],
  );
}

Widget percent({required WidgetRef ref, required double width}) {
  final alarmTKstate = ref.read(alarmTKState);
  final duration = alarmTKstate.duration;

  return CircularCountDownTimer(
    duration: duration.inSeconds,
    initialDuration: 0,
    controller: ref.read(alarmTKState.notifier).controller,
    width: width,
    height: width,
    ringColor: Colors.blue.shade100,
    ringGradient: null,
    fillColor: Colors.blue,
    fillGradient: null,
    backgroundColor: Colors.transparent,
    backgroundGradient: null,
    strokeWidth: 10,
    strokeCap: StrokeCap.butt,
    textStyle: const TextStyle(fontSize: 33.0, fontWeight: FontWeight.bold),
    textFormat: CountdownTextFormat.MM_SS,
    isReverse: true,
    isReverseAnimation: false,
    isTimerTextShown: false,
    autoStart: true,
    onStart: () {
      print('Countdown Started');
    },
    onComplete: () {
      print('Countdown Ended');
    },
  );

  // return PlayAnimation<double>(
  //   tween: Tween(begin: 0, end: 1),
  //   duration: duration,
  //   builder: (context, child, value) {
  //     return CircularPercentIndicator(
  //       radius: width * 0.9,
  //       lineWidth: 10,
  //       percent: value,
  //       progressColor: ColorKey.blue.value,
  //     );
  //   },
  // );
}
