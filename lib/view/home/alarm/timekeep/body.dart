// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_color/src/helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/theme.dart';
import 'package:majimo_timer/plugin/flutter_analog_clock/flutter_analog_clock.dart';
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

Widget fab({required WidgetRef ref}) {
  final clockmanager = ref.read(clockManager);
  final alarmmanager = ref.read(alarmManager);
  final generalmanager = ref.read(generalManager);

  var radius = ref.watch(alarmManager).FABsize;
  return AnimatedBuilder(
      animation: alarmmanager.iconsize,
      builder: (context, snapshot) {
        return SizedBox(
            height: 120,
            child: PhysicalShape(
              color: Colors.blue,
              shadowColor: Colors.red,
              elevation: 3,
              clipper: const ShapeBorderClipper(shape: CircleBorder()),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: radius,
                    backgroundColor: Colors.red,
                  ),
                  IconButton(
                      padding: const EdgeInsets.all(20),
                      color: Colors.black,
                      iconSize: alarmmanager.iconsize.value as double,
                      enableFeedback: true,
                      icon: const Icon(
                        Icons.stop,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        generalmanager.push_home(context: context);
                      }),
                ],
              ),
            ));
      });
}
