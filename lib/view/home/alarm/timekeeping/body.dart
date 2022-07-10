import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/notification.dart';
import 'package:majimo_timer/model/helper/plugin/circular_countdown_timer-0.2.0/circular_countdown_timer.dart';
import 'package:majimo_timer/model/helper/plugin/flutter_analog_clock/flutter_analog_clock.dart';
import 'package:majimo_timer/model/helper/plugin/slide_digital_clock/slide_digital_clock.dart';

import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/view/home/root/body.dart';
import 'package:majimo_timer/view/routes/transition.dart';
import 'package:simple_animations/simple_animations.dart';

part 'vertical.dart';

class AlarmTimeKeepingPage extends HookConsumerWidget {
  const AlarmTimeKeepingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;
    final generalstate = ref.read(generalState.notifier);
    final show = ref.watch(generalState).showFAB;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: show
          ? SizedBox(
              height: 80,
              width: 80,
              child: FloatingActionButton(
                splashColor: Colors.red.shade400,
                backgroundColor: Colors.red,
                onPressed: () {
                  RouteManager.runPush(
                    context: context,
                    page: const HomePage(),
                    isReplace: true,
                  );
                  NotificationManager().cancelAllNotifications();
                  generalstate.whenHome();
                },
                heroTag: null,
                child: const Icon(
                  Icons.stop,
                  color: Colors.white,
                ),
              ),
            )
          : null,
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.centerDocked,
      body:
          !isLandscape ? buildVertical(context, ref) : buildHorizontal(context),
    );
  }
}

Widget buildHorizontal(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    color: Colors.blue,
    child: const Text('ヨコ', style: TextStyle(fontSize: 32)),
  );
}

Widget analogclockTimekeeping({
  required BuildContext context,
  required WidgetRef ref,
}) {
  final isLight = ref.read(themeState.notifier).isLight(context: context);
  final showSec = ref.read(clockState).showSec;
  return FlutterAnalogClock(
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
