import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/notification.dart';
import 'package:majimo_timer/model/helper/plugin/flutter_analog_clock/flutter_analog_clock.dart';
import 'package:majimo_timer/model/helper/plugin/slide_digital_clock/slide_digital_clock.dart';
import 'package:majimo_timer/model/helper/route.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/view/home/root/body.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

part 'vertical.dart';

class GoalTimeKeepingPage extends HookConsumerWidget {
  const GoalTimeKeepingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;
    final timerTKstate = ref.read(timerTKState.notifier);
    final generalstate = ref.read(generalState.notifier);
    final show = ref.watch(generalState).showFAB;

    Widget fab() {
      final mode = ref.watch(goalTKState).fabMode;
      switch (mode) {
        case 0:
          return SizedBox(
            height: 80,
            width: 80,
            child: FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () => ref.read(goalTKState.notifier).runPause(),
              heroTag: 'global',
              child: const Icon(
                Icons.pause,
                color: Colors.black,
              ),
            ),
          );
        case 1:
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: FloatingActionButton(
                  backgroundColor: Colors.red,
                  heroTag: null,
                  onPressed: () {
                    RouteManager().runPush(
                      context: context,
                      page: const HomePage(),
                      isReplace: true,
                    );
                    NotificationManager().cancelAllNotifications();
                    generalstate.whenHome();
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
                  onPressed: ref.read(goalTKState.notifier).runResume,
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
                  backgroundColor: Colors.amber.shade900,
                  heroTag: null,
                  onPressed: timerTKstate.whenFinished,
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        case 2:
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: FloatingActionButton(
                  backgroundColor: Colors.red,
                  heroTag: null,
                  onPressed: () {
                    RouteManager().runPush(
                      context: context,
                      page: const HomePage(),
                      isReplace: true,
                    );
                    NotificationManager().cancelAllNotifications();
                    generalstate.whenHome();
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
                  onPressed: ref.read(timerTKState.notifier).runResume,
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
                  backgroundColor: Colors.amber.shade900,
                  heroTag: null,
                  onPressed: null,
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        default:
          throw Exception('switch-case error!');
      }
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: show ? fab() : null,
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
