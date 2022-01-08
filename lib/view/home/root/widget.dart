// ignore_for_file: implementation_imports

import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dismissible_page/src/dismissible_extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/helper/app_link.dart';
import 'package:majimo_timer/model/helper/config.dart';
import 'package:majimo_timer/model/helper/notification.dart';
import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:majimo_timer/plugin/slide_digital_clock/slide_digital_clock.dart';
import 'package:majimo_timer/view/debug/body.dart';
import 'package:majimo_timer/view/home/alarm/body.dart';
import 'package:majimo_timer/view/home/goal/body.dart';
import 'package:majimo_timer/view/home/timer/body.dart';
import 'package:majimo_timer/view/setting/body.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:expandable_widgets/expandable_widgets.dart';
import '../../../model/helper/theme.dart';
import '../../../plugin/draggable_home/draggable_home.dart';
import 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final width = MediaQuery.of(context).size.width;
  useEffect(() {
    LinkManager.initQuickAction(context: context, ref: ref);
    LinkManager.initDeepLinks(ref, context);

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
    var value = Colors.black;
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
              ref.read(alarmManager.notifier).internal();
              ref.read(generalManager.notifier).showFAB();

              break;
            case 'timer':
              context.pushTransparentRoute(const TimerPage());
              ref.read(generalManager.notifier).showFAB();

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
            opacity: ref.watch(generalManager).opacity,
            duration: const Duration(milliseconds: 300),
            child: Text(ref.watch(generalManager).status,
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
    final color =
        ref.watch(colorManager).color_tween(context: context, ref: ref);
    final opacity = ref.watch(colorManager).opacity;
    final path =
        ref.watch(colorManager).color_picture_path(context: context, ref: ref);
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

  Widget debug() {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.purple,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                ListTile(
                    title: const Text(
                      'このアプリはベータ版です',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      '>> $version << \n $buildDate \n $changeLog',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    leading: const Icon(
                      Icons.bug_report,
                      color: Colors.white,
                    ),
                    onTap: () {}),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        NotificationManager.test();
                        Logger.e(
                            '- from majimo_timer/lib/view/home/root/widget.dart \n'
                            ' > notification test');
                      },
                      icon: const Icon(Icons.notifications_active),
                      color: Colors.white,
                    ),
                    const SizedBox(width: 2),
                    IconButton(
                      onPressed: () {
                        ToastManager.toast(context: context, ref: ref, id: 0);
                        Logger.e(
                            '- from majimo_timer/lib/view/home/root/widget.dart \n'
                            ' > toast test');
                      },
                      icon: const Icon(Icons.circle_notifications),
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    IconButton(
                      onPressed: () {
                        ref
                            .read(generalManager.notifier)
                            .push(context: context, page: const Debug());
                        Logger.e(
                            '- from majimo_timer/lib/view/home/root/widget.dart \n'
                            ' > debug page opened');
                      },
                      icon: const Icon(Icons.developer_mode),
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text('ローカル通知を送信',
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                    SizedBox(width: 10),
                    Text('トースト通知を送信',
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                    SizedBox(width: 10),
                    Text('アプリのログを見る',
                        style: TextStyle(color: Colors.white, fontSize: 10))
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: Colors.cyan.shade600,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                ListTile(
                    title: const AutoSizeText(
                      '皆さんにやってほしいこと',
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                    onTap: () {}),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                ListTile(
                    title: const AutoSizeText(
                      '１. アプリが強制終了しないか',
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                    ),
                    leading: const Icon(
                      Icons.running_with_errors_sharp,
                      color: Colors.white,
                    ),
                    onTap: () {}),
                ListTile(
                    title: const AutoSizeText(
                      '２. レイアウトが崩れてないか',
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                    ),
                    leading: const Icon(
                      Icons.layers,
                      color: Colors.white,
                    ),
                    onTap: () {}),
                ListTile(
                    title: const AutoSizeText(
                      '３. 変な挙動はないか',
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                    ),
                    leading: const Icon(
                      Icons.account_tree,
                      color: Colors.white,
                    ),
                    onTap: () {}),
                ListTile(
                    title: const AutoSizeText(
                      '４. 通知は機能しているか',
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                    ),
                    leading: const Icon(
                      Icons.notification_important,
                      color: Colors.white,
                    ),
                    onTap: () {}),
                ListTile(
                    title: const AutoSizeText(
                      '５. アラームは作動するか',
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                    ),
                    leading: const Icon(
                      Icons.alarm_on,
                      color: Colors.white,
                    ),
                    onTap: () {}),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                const Text(
                    '上記に当てはまる挙動があったら, \nその手順をdiscordまで！\n(ログをスクショしてくれると嬉しい！)',
                    style: TextStyle(color: Colors.white))
              ],
            ),
          ),
        ),
      ],
    );
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
              .read(generalManager.notifier)
              .push(context: context, page: const Debug());
          Logger.e('- from majimo_timer/lib/view/home/root/widget.dart \n'
              ' > debug page opened');
        },
        icon: const Icon(Icons.developer_mode),
        color: Colors.white,
      ),
      IconButton(
        onPressed: () => ref
            .read(generalManager.notifier)
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
                .read(generalManager.notifier)
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
                .read(generalManager.notifier)
                .push(context: context, page: const Setting());
          },
          icon: const Icon(Icons.settings),
          color: Colors.white,
        ),
      ],
    ),
    body: [content(context), debug()],
    fullyStretchable: true,
    expandedBody: expand(context),
  );
}
