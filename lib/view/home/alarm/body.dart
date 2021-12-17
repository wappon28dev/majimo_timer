import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/theme.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'timekeep/body.dart';
import 'widget.dart' as a;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AlarmPage extends HookConsumerWidget {
  const AlarmPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;
    String tag = "alarm";

    return Material(
        color: Colors.transparent,
        child: Hero(
            tag: tag,
            child: DismissiblePage(
                onDismiss: () => Navigator.of(context).pop(),
                isFullScreen: true,
                child: !(isLandscape)
                    ? a.buildVertical(context, ref)
                    : a.buildHorizontal(context))));
  }
}

Widget fab({required BuildContext context, required WidgetRef ref}) {
  final generalmanager = ref.read(generalManager);
  final radius = ref.watch(alarmManager).FABsize;
  final size = ref.watch(alarmManager).iconsize;
  return Stack(children: [
    SizedBox(
        height: 120,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            CircleAvatar(
              radius: radius,
              backgroundColor: Colors.green.shade200,
            ),
            PlayAnimation<double>(
                tween: Tween(begin: 0, end: 25),
                duration: const Duration(milliseconds: 250),
                builder: (context, child, value) {
                  return IconButton(
                      iconSize: value,
                      padding: const EdgeInsets.all(20),
                      color: Colors.black,
                      enableFeedback: true,
                      icon: const Icon(
                        Icons.play_arrow,
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil<void>(
                            context,
                            MaterialPageRoute<void>(
                                builder: (context) =>
                                    const AlarmTimeKeepingPage()),
                            (_) => false);
                        ref.read(alarmManager).show();
                        ref.read(alarmTimeKeepingManager).start();
                        ref
                            .read(generalManager)
                            .change_timekeeping(value: true);
                      });
                })
          ],
        ))
  ]);
}
