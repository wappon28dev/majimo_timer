import 'package:auto_size_text/auto_size_text.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/helper/plugin/slide_digital_clock/slide_digital_clock.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/view/home/timer/timekeeping/body.dart';

part 'horizontal.dart';
part 'vertical.dart';

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

    Widget _fab() => SizedBox(
          height: 80,
          width: 80,
          child: GestureDetector(
            onLongPress: () => alarmstate.runTooltip(context: context),
            onLongPressUp: () => Navigator.pop(context),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const TimerTimeKeepingPage(),
                  ),
                  (_) => false,
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

    AppBar _appbar() {
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
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
        onDismiss: () {
          if (!ref.read(timerState).canStart) {
            ref.read(generalState.notifier).runFAB();
          }
          Navigator.of(context).pop();
        },
        isFullScreen: true,
        child: Scaffold(
          appBar: _appbar(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: show ? _fab() : null,
          backgroundColor: ColorKey.red.value,
          body: !isLandscape
              ? buildVertical(context, ref)
              : buildHorizontal(context),
        ),
      ),
    );
  }
}
