import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/view/home/alarm/timekeep/body.dart';
import 'package:majimo_timer/view/home/alarm/widget.dart' as a;
import 'package:simple_animations/simple_animations.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AlarmPage extends HookConsumerWidget {
  const AlarmPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;
    final generalmanager = ref.read(generalManager);
    final alarmmanager = ref.read(alarmManager.notifier);
    final show = ref.watch(alarmManager).showFAB;
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
                                alarmmanager.tooltip(context: context),
                            onLongPressUp: () => Navigator.pop(context),
                            child: FloatingActionButton(
                              onPressed: () =>
                                  alarmmanager.push(context: context, ref: ref),
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

// Widget fab({required BuildContext context, required WidgetRef ref}) {
//   final generalmanager = ref.read(generalManager);
//   final radius = ref.watch(alarmManager).FABsize;
//   return Stack(children: [
//     SizedBox(
//         height: 120,
//         child: Stack(
//           alignment: Alignment.center,
//           clipBehavior: Clip.antiAliasWithSaveLayer,
//           children: [
//             CircleAvatar(
//               radius: radius,
//               backgroundColor: Colors.green.shade200,
//             ),
//             PlayAnimation<double>(
//                 tween: Tween(begin: 0, end: 25),
//                 delay: Duration.zero,
//                 duration: const Duration(milliseconds: 250),
//                 builder: (context, child, value) {
//                   return IconButton(
//                       iconSize: value,
//                       padding: const EdgeInsets.all(20),
//                       color: Colors.black,
//                       enableFeedback: true,
//                       icon: const Icon(
//                         Icons.play_arrow,
//                       ),
//                       onPressed: () {
//                         Navigator.pushAndRemoveUntil<void>(
//                             context,
//                             MaterialPageRoute<void>(
//                                 builder: (context) =>
//                                     const AlarmTimeKeepingPage()),
//                             (_) => false);
//                         ref.read(alarmManager).show();
//                         ref.read(alarmTimeKeepingManager).start();
//                         ref
//                             .read(generalManager)
//                             .change_timekeeping(value: true);
//                       });
//                 })
//           ],
//         ))
//   ]);
// }
