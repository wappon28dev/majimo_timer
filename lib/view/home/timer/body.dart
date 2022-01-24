import 'dart:math';

import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:majimo_timer/view/home/timer/widget.dart' as a;

import '../../../main.dart';
import '../../../model/helper/theme.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:dismissible_page/dismissible_page.dart';

import 'timekeep/body.dart';

class TimerPage extends HookConsumerWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;
    final generalmanager = ref.read(generalManager);
    final alarmmanager = ref.read(alarmManager.notifier);
    final timermanager = ref.read(timerManager.notifier);
    final show = ref.watch(generalManager).showFAB;
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
                                alarmmanager.tooltip(context: context),
                            onLongPressUp: () => Navigator.pop(context),
                            child: FloatingActionButton(
                              onPressed: () =>
                                  Navigator.pushAndRemoveUntil<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                          builder: (context) =>
                                              const TimerTimeKeepingPage()),
                                      (_) => false),
                              splashColor: Colors.green.shade300,
                              backgroundColor: Colors.green.shade100,
                              heroTag: null,
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
