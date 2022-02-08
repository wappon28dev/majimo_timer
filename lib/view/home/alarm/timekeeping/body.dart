// ignore_for_file: non_constant_identifier_names, cascade_invocations, implementation_imports, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_color/src/helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/notification.dart';
import 'package:majimo_timer/model/helper/plugin/flutter_analog_clock/flutter_analog_clock.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/view/home/root/body.dart';

import '../../../../main.dart';
import 'widget.dart';

class AlarmTimeKeepingPage extends HookConsumerWidget {
  const AlarmTimeKeepingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;
    final generalstate = ref.read(generalState.notifier);
    final show = ref.watch(generalState).showFAB;

    return MaterialApp(
        theme: MyTheme().lightTheme,
        darkTheme: MyTheme().darkTheme,
        themeMode: ref.watch(themeState).theme_value,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: show
                ? SizedBox(
                    height: 80,
                    width: 80,
                    child: FloatingActionButton(
                      splashColor: Colors.red.shade400,
                      backgroundColor: Colors.red,
                      onPressed: () {
                        generalstate.push_replace(
                            context: context, page: const HomePage());
                        NotificationManager().cancel_notification();
                        generalstate.home();
                      },
                      heroTag: null,
                      child: const Icon(
                        Icons.stop,
                        color: Colors.white,
                      ),
                    ))
                : null,
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
