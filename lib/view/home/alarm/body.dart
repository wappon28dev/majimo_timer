import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/view/home/alarm/widget.dart' as a;
import 'package:majimo_timer/view/components/modal.dart';

class AlarmPage extends HookConsumerWidget {
  const AlarmPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;
    final alarmstate = ref.read(alarmState.notifier);
    final show = ref.watch(generalState).showFAB;
    const tag = 'alarm';

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
                                alarmstate.runTooltip(context: context),
                            onLongPressUp: () => Navigator.pop(context),
                            child: FloatingActionButton(
                              onPressed: () {
                                alarmstate.runPush(context: context, ref: ref);
                              },
                              splashColor: Colors.green.shade300,
                              backgroundColor: Colors.green.shade200,
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
