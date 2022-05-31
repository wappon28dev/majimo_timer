import 'package:dismissible_page/dismissible_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/view/home/alarm/body.dart';
import 'package:majimo_timer/view/home/goal/body.dart';
import 'package:majimo_timer/view/home/timer/body.dart';

List<Widget> button({required BuildContext context, required WidgetRef ref}) {
  final width = MediaQuery.of(context).size.width;

  void _alarm() {
    context.pushTransparentRoute(const AlarmPage());
    ref.read(alarmState.notifier).runInitialize();
    ref.read(generalState.notifier).runFAB();
  }

  void _timer() {
    context.pushTransparentRoute(const TimerPage());
    if (ref.read(timerState).canStart) {
      ref.read(generalState.notifier).runFAB();
    } else {
      ref.read(generalState.notifier).updateShowFAB(value: false);
    }
  }

  void _goal() {
    context.pushTransparentRoute(const GoalPage());
    ref.read(generalState.notifier).runFAB();
  }

  final array = [
    <String>['alarm', 'timer', 'goal'],
    <Color>[ColorKey.blue.value, ColorKey.red.value, ColorKey.green.value],
    <IconData>[Icons.alarm, Icons.hourglass_top, Icons.flag],
    <void Function()>[_alarm, _timer, _goal],
  ];
  final widgets = <Widget>[];

  for (var i = 0; i < 3; i++) {
    final widget = GestureDetector(
      onTap: array[3][i] as void Function(),
      child: Hero(
        tag: array[0][i],
        child: Material(
          color: Colors.transparent,
          child: SizedBox.square(
            dimension: width / 3.6,
            child: Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: array[1][i] as Color,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(array[2][i] as IconData, color: Colors.white),
                  Text(
                    (array[0][i] as String).tr(),
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    widgets.add(widget);
  }

  return widgets;
}
