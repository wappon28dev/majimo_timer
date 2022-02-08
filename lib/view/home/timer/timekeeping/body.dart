// ignore_for_file: non_constant_identifier_names, cascade_invocations

import 'package:flutter/material.dart';
import 'package:flutter_color/src/helper.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/notification.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/model/helper/plugin/flutter_analog_clock/flutter_analog_clock.dart';
import 'package:majimo_timer/view/home/root/body.dart';
import 'package:simple_animations/simple_animations.dart';
import '../../../../main.dart';
import 'widget.dart';

class TimerTimeKeepingPage extends HookConsumerWidget {
  const TimerTimeKeepingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;
    final alarmTKstate = ref.read(alarmTKState.notifier);
    final generalstate = ref.read(generalState.notifier);
    final show = ref.watch(generalState).showFAB;

    Widget fab() {
      final mode = ref.watch(timerTKState).fabMode;
      switch (mode) {
        case 0:
          return SizedBox(
              height: 80,
              width: 80,
              child: FloatingActionButton(
                backgroundColor: Colors.amber,
                onPressed: () => ref.read(timerTKState.notifier).pause(),
                heroTag: 'global',
                child: const Icon(
                  Icons.pause,
                  color: Colors.black,
                ),
              ));
        case 1:
          return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 50,
              width: 50,
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  generalstate.push_replace(
                      context: context, page: const HomePage());
                  NotificationManager().cancel_notification();
                  generalstate.home();
                },
                child: const Icon(
                  Icons.stop,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              height: 80,
              width: 80,
              child: FloatingActionButton(
                onPressed: ref.read(timerTKState.notifier).resume,
                splashColor: Colors.green.shade300,
                backgroundColor: Colors.green.shade100,
                heroTag: 'global',
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              height: 50,
              width: 50,
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                onPressed: () {
                  generalstate.push_replace(
                      context: context, page: const HomePage());
                  NotificationManager().cancel_notification();
                  generalstate.home();
                },
                child: const Icon(
                  Icons.stop,
                  color: Colors.white,
                ),
              ),
            ),
          ]);
        case 2:
          return FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              generalstate.push_replace(
                  context: context, page: const HomePage());
              NotificationManager().cancel_notification();
              generalstate.home();
            },
            // heroTag: null,
            child: const Icon(
              Icons.stop,
              color: Colors.white,
            ),
          );
        default:
          return const SizedBox();
      }
    }

    return MaterialApp(
        theme: MyTheme().lightTheme,
        darkTheme: MyTheme().darkTheme,
        themeMode: ref.read(themeState).theme_value,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: show ? fab() : null,
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.centerDocked,
            body: !isLandscape
                ? buildVertical(context, ref)
                : buildHorizontal(context)));
  }
}

Widget buildHorizontal(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    color: Colors.blue,
    child: const Text('ヨコ', style: TextStyle(fontSize: 32)),
  );
}

Widget analogclock_timekeeping(
    {required BuildContext context, required WidgetRef ref}) {
  final isLight = ref.read(themeState.notifier).isLight(context: context);
  final showSec = ref.read(clockState).showSec;
  return FlutterAnalogClock(
    showNumber: true,
    dialPlateColor: Colors.transparent,
    hourHandColor: isLight ? Colors.black.lighter(60) : Colors.white.darker(20),
    minuteHandColor:
        isLight ? Colors.black.lighter(60) : Colors.white.darker(20),
    secondHandColor:
        isLight ? Colors.black.lighter(60) : Colors.white.darker(20),
    numberColor: Colors.white.darker(50),
    centerPointColor:
        isLight ? Colors.black.lighter(60) : Colors.white.darker(20),
    borderWidth: 0,
    showSecondHand: showSec,
    showTicks: false,
  );
}
