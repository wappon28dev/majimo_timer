import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/pref.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:majimo_timer/plugin/slide_digital_clock/slide_digital_clock.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';
import '../../../../main.dart';
import 'body.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final clockmanager = ref.read(clockManager);
  final alarmmanager = ref.read(alarmManager);
  final alarmTKmanager = ref.read(alarmTimeKeepingManager);

  final generalmanager = ref.read(generalManager);
  final width = MediaQuery.of(context).size.width;

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
                  children: [count(context: context, ref: ref)],
                )),
            const SizedBox(height: 10),
            Text(ref.read(alarmTimeKeepingManager).duration.toString()),
            ElevatedButton(onPressed: () => null, child: Text("button"))
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
        opacity: ref.watch(generalManager).opacity,
        duration: const Duration(milliseconds: 300),
        child: AutoSizeText(
          ref.watch(generalManager).status,
          style: const TextStyle(fontWeight: FontWeight.bold),
          maxLines: 1,
        )),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    ),
    backgroundColor: Colors.red,
    // actions: [
    //   IconButton(
    //       onPressed: () {
    //         PrefManager.allremove();
    //         Logger.e("- from majimo_timer/lib/view/setting/body.dart \n" +
    //             " >> ! SharedPreferences All Removed ! <<");
    //         PrefManager.restore(ref, context);
    //       },
    //       icon: const Icon(Icons.settings_backup_restore))
    // ],
  );
}

Widget count({required BuildContext context, required WidgetRef ref}) {
  return Padding(
      padding: EdgeInsets.all(20),
      child: CircularCountDownTimer(
        duration: ref.read(timerManager).target.inSeconds,
        initialDuration: 0,
        // controller: controller,
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 2,
        ringColor: Colors.red.shade100,
        ringGradient: null,
        fillColor: Colors.redAccent.shade200,
        fillGradient: null,
        backgroundColor: Colors.transparent,
        backgroundGradient: null,
        strokeWidth: 20.0,
        strokeCap: StrokeCap.butt,
        textStyle: TextStyle(fontSize: 33.0, fontWeight: FontWeight.bold),
        textFormat: CountdownTextFormat.MM_SS,
        isReverse: true,
        isReverseAnimation: false,
        isTimerTextShown: true,

        autoStart: true,
        onStart: () {
          print('Countdown Started');
        },
        onComplete: () {
          print('Countdown Ended');
        },
      ));
}
