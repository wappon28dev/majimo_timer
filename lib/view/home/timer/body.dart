import 'dart:ffi';

import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/view/home/timer/timekeeping/body.dart';
import 'package:majimo_timer/view/home/timer/widget.dart' as a;

class TimerPage extends HookConsumerWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;
    final generalstate = ref.read(generalState);
    final alarmstate = ref.read(alarmState.notifier);
    final timerstate = ref.read(timerState.notifier);
    final show = ref.watch(generalState).showFAB;
    const tag = 'timer';

    return Hero(
        tag: tag,
        child: DismissiblePage(
            onDismiss: () => Navigator.of(context).pop(),
            isFullScreen: true,
            child: Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                floatingActionButton: show
                    ? SizedBox(
                        height: 80,
                        width: 80,
                        child: GestureDetector(
                            onLongPress: () =>
                                alarmstate.tooltip(context: context),
                            onLongPressUp: () => Navigator.pop(context),
                            child: FloatingActionButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil<void>(
                                    context,
                                    MaterialPageRoute<void>(
                                        builder: (context) =>
                                            const TimerTimeKeepingPage()),
                                    (_) => false);

                                ref.read(timerTKState.notifier).start();
                                ref.read(generalState.notifier).showFAB();
                              },
                              heroTag: null,
                              splashColor: Colors.green.shade300,
                              backgroundColor: Colors.green.shade100,
                              child: const Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                              ),
                            )))
                    : null,
                // floatingActionButtonLocation:
                //     FloatingActionButtonLocation.centerDocked,
                body: !isLandscape
                    ? a.buildVertical(context, ref)
                    : a.buildHorizontal(context))));
  }
}
