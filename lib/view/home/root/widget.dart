// ignore_for_file: implementation_imports
import 'package:dismissible_page/src/dismissible_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/helper/app_link.dart';
import 'package:majimo_timer/model/helper/plugin/draggable_home/draggable_home.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/helper/plugin/slide_digital_clock/slide_digital_clock.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/view/components/modal.dart';
import 'package:majimo_timer/view/debug/body.dart';
import 'package:majimo_timer/view/debug/widget.dart';
import 'package:majimo_timer/view/home/alarm/body.dart';
import 'package:majimo_timer/view/home/goal/body.dart';
import 'package:majimo_timer/view/home/timer/body.dart';
import 'package:majimo_timer/view/setting/body.dart';
import 'package:simple_animations/simple_animations.dart';

import 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final width = MediaQuery.of(context).size.width;
  final show = ref.watch(generalState).showFAB;
  useEffect(() {
    LinkManager().initQuickAction(context: context, ref: ref);
    LinkManager().initDeepLinks(ref, context);
    return null;

    // AwesomeNotifications().actionStream.listen((receivedNotification) {
    //   if (receivedNotification.channelKey == "basic_channel") {
    //     Logger.e("received!");
    //     Navigator.of(context).pushNamed(
    //       '/setting',
    //     );
    //   }
    // });
  });

  // ignore: avoid_unnecessary_containers
  Container headerWidget(BuildContext context) => Container(
        child: Container(child: largeclock(context, ref, false)),
      );

  Widget button({required String tag}) {
    late Color value;
    switch (tag) {
      case 'alarm':
        value = ColorKey.blue.value;
        break;
      case 'timer':
        value = ColorKey.red.value;
        break;
      case 'goal':
        value = ColorKey.green.value;
        break;
    }

    /// ```
    ///  int mode 0 => define onTap()
    ///           1 => return Color
    ///           2 => return Icon
    /// ```
    dynamic func({required int mode}) {
      switch (mode) {
        case 0:
          switch (tag) {
            case 'alarm':
              context.pushTransparentRoute(const AlarmPage());
              ref.read(alarmState.notifier).internal();
              ref.read(generalState.notifier).showFAB();

              break;
            case 'timer':
              context.pushTransparentRoute(const TimerPage());
              ref.read(generalState.notifier).showFAB();

              break;
            case 'goal':
              context.pushTransparentRoute(const GoalPage());
              break;
          }
          break;
        case 1:
          switch (tag) {
            case 'alarm':
              return Icons.alarm;
            case 'timer':
              return Icons.hourglass_top;
            case 'goal':
              return Icons.flag;
          }
          break;
        default:
          throw Exception('error!');
      }
    }

    return GestureDetector(
        onTap: () => func(mode: 0),
        child: Hero(
          tag: tag,
          child: Material(
            color: Colors.transparent,
            child: SizedBox.square(
              dimension: width / 3.6,
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: value),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(func(mode: 1) as IconData, color: Colors.white),
                      Text(
                        tag.tr(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }

  Widget content(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
            opacity: ref.read(generalState).opacity,
            duration: const Duration(milliseconds: 300),
            child: Text(ref.read(generalState).status,
                style: const TextStyle(fontWeight: FontWeight.bold))),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            button(tag: 'alarm'),
            button(tag: 'timer'),
            button(tag: 'goal'),
          ],
        ),
      ],
    );
  }

  Widget expand(BuildContext context) {
    final color = ref.read(colorState).color_tween(context: context, ref: ref);
    final opacity = ref.watch(colorState).opacity;
    final path =
        ref.read(colorState).color_picture_path(context: context, ref: ref);
    return PlayAnimation<Color?>(
        tween: color,
        builder: (context, child, value) {
          return Container(
              alignment: Alignment.center,
              color: value,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    AnimatedOpacity(
                        opacity: opacity,
                        duration: const Duration(seconds: 1),
                        child: Lottie.asset(path)),
                  ]),
                  AnimatedOpacity(
                    opacity: opacity,
                    duration: const Duration(seconds: 1),
                    child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                            padding: const EdgeInsets.all(30),
                            child: analogclock(context: context, ref: ref))),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      largeclock(context, ref, true, true),
                    ],
                  )
                ],
              ));
        });
  }

  return DraggableHome(
      title: Text(
        t.app_name.t,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          onPressed: () {
            ref
                .read(generalState.notifier)
                .push(context: context, page: const Debug());
            Logger.e('- from majimo_timer/lib/view/home/root/widget.dart \n'
                ' > debug page opened');
          },
          icon: const Icon(Icons.developer_mode),
          color: Colors.white,
        ),
        IconButton(
          onPressed: () => ref
              .read(generalState.notifier)
              .push(context: context, page: const Setting()),
          icon: const Icon(Icons.settings),
          color: Colors.white,
        ),
      ],
      headerWidget: headerWidget(context),
      headerBottomBar: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              ref
                  .read(generalState.notifier)
                  .push(context: context, page: const Debug());
              Logger.e('- from majimo_timer/lib/view/home/root/widget.dart \n'
                  ' > debug page opened');
            },
            icon: const Icon(Icons.developer_mode),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              ref
                  .read(generalState.notifier)
                  .push(context: context, page: const Setting());
            },
            icon: const Icon(Icons.settings),
            color: Colors.white,
          ),
        ],
      ),
      body: [content(context), debug(context: context, ref: ref)],
      fullyStretchable: true,
      expandedBody: expand(context),
      backgroundColor: MyTheme().get_background(context: context, ref: ref),
      floatingActionButton: show ? fab(context: context, ref: ref) : null);
}
