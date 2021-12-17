// ignore_for_file: non_constant_identifier_names, cascade_invocations

import 'package:flutter/material.dart';
import 'package:flutter_color/src/helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/theme.dart';
import 'package:majimo_timer/plugin/flutter_analog_clock/flutter_analog_clock.dart';
import 'package:simple_animations/simple_animations.dart';
import '../../../../main.dart';
import 'widget.dart';

class AlarmTimeKeepingPage extends HookConsumerWidget {
  const AlarmTimeKeepingPage({Key? key}) : super(key: key);
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    return MaterialApp(
        theme: ref.read(myTheme).lightTheme,
        darkTheme: ref.read(myTheme).darkTheme,
        themeMode: ref.watch(themeManager).theme_value,
        debugShowCheckedModeBanner: false,
        home: !isLandscape
            ? buildVertical(context, ref)
            : buildHorizontal(context));
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
  final isLight = ref.read(themeManager).isLight(context: context);
  final showSec = ref.read(clockManager).showSec;
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

Widget fab({required BuildContext context, required WidgetRef ref}) {
  final generalmanager = ref.read(generalManager);
  final alarmTKmanager = ref.read(alarmTimeKeepingManager);
  final radius = ref.watch(alarmManager).FABsize;
  final size = ref.watch(alarmManager).iconsize;

  return Stack(children: [
    Container(
        child: SizedBox(
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: radius,
                  backgroundColor: Colors.red,
                ),
                PlayAnimation<double>(
                    tween: Tween(begin: 0, end: 25),
                    duration: const Duration(milliseconds: 400),
                    builder: (context, child, value) {
                      return IconButton(
                          iconSize: value,
                          padding: const EdgeInsets.all(20),
                          color: Colors.black,
                          enableFeedback: true,
                          icon: const Icon(
                            Icons.stop,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            generalmanager.push_home(context: context);
                            generalmanager.change_timekeeping(value: false);
                          });
                    })
              ],
            )))
  ]);
}
