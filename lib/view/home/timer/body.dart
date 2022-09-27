import 'package:auto_size_text/auto_size_text.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/controller/controller.dart';
import 'package:majimo_timer/model/helper/plugin/slide_digital_clock/slide_digital_clock.dart';
import 'package:majimo_timer/model/helper/plugin/tap_to_expand-0.5.7/tap_to_expand.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/view/home/timer/modal.dart';
import 'package:majimo_timer/view/home/timer/timekeeping/body.dart';
import 'package:majimo_timer/view/routes/transition.dart';
import 'package:nil/nil.dart';
import 'package:reorderables/reorderables.dart';

part 'horizontal.dart';
part 'vertical.dart';

class TimerPage extends HookConsumerWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;
    final show = ref.watch(generalState).showFAB;
    const tag = 'timer';

    Widget fab() => SizedBox(
          height: 80,
          width: 80,
          child: GestureDetector(
            onLongPress: () => AlarmController.runTooltip(context: context),
            onLongPressUp: () => Navigator.pop(context),
            child: FloatingActionButton(
              onPressed: () {
                RouteManager.runPush(
                  context: context,
                  page: const TimerTimeKeepingPage(),
                  isReplace: true,
                );

                ref.read(timerTKState.notifier).runInitialStart();
                ref.read(generalState.notifier).runFAB();
              },
              heroTag: null,
              splashColor: Colors.green.shade300,
              backgroundColor: Colors.green.shade100,
              child: const Icon(
                Icons.play_arrow,
                color: Colors.black,
              ),
            ),
          ),
        );

    AppBar appbar() {
      return AppBar(
        backgroundColor: ColorKey.red.value,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            if (!ref.read(timerState).canStart) {
              ref.read(generalState.notifier).runFAB();
            }
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.hourglass_top),
              AutoSizeText(
                t.timer.t,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              smallclock(context, ref, false),
            ],
          )
        ],
      );
    }

    return Hero(
      tag: tag,
      child: DismissiblePage(
        onDismissed: () {
          if (!ref.read(timerState).canStart) {
            ref.read(generalState.notifier).runFAB();
          }
          Navigator.of(context).pop();
        },
        child: Scaffold(
          appBar: appbar(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: show ? fab() : null,
          backgroundColor: ColorKey.red.value,
          body: !isLandscape
              ? buildVertical(context, ref)
              : buildHorizontal(context),
        ),
      ),
    );
  }
}
