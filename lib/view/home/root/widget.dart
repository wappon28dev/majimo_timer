import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dismissible_page/src/dismissible_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/app_link.dart';
import 'package:majimo_timer/model/notification.dart';
import 'package:majimo_timer/model/pref.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:majimo_timer/view/home/alarm/body.dart';
import 'package:majimo_timer/view/home/goal/body.dart';
import 'package:majimo_timer/view/home/timer/body.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:url_launcher/url_launcher.dart';
import '/model/theme.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import '../../../plugin/draggable_home/draggable_home.dart';
import 'body.dart';
import 'package:lottie/lottie.dart';
import 'package:easy_localization/easy_localization.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final clockmanager = ref.watch(clockManager);
  final colormanager = ref.watch(colorManager);
  final alarmmanager = ref.watch(alarmManager);
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

  Container headerWidget(BuildContext context) => Container(
        child: Container(
          child: DigitalClock(
            digitAnimationStyle: Curves.easeOutExpo,
            is24HourTimeFormat: clockmanager.is24,
            areaDecoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            hourMinuteDigitTextStyle: const TextStyle(
                fontSize: 50, color: Colors.white, fontFamily: 'M-plus-B'),
            hourMinuteDigitDecoration:
                const BoxDecoration(color: Colors.transparent),
            amPmDigitTextStyle: const TextStyle(
                fontSize: 10,
                height: 2,
                color: Colors.white,
                fontFamily: 'M-plus-B'),
            secondDigitTextStyle: const TextStyle(
                fontSize: 20,
                height: 1.5,
                color: Colors.white,
                fontFamily: 'M-plus-B'),
            secondDigitDecoration:
                const BoxDecoration(color: Colors.transparent),
            areaAligment: AlignmentDirectional.center,
          ),
        ),
      );

  Widget button({required String tag, required Color color}) {
    return GestureDetector(
        onTap: () {
          switch (tag) {
            case ("alarm"):
              context.pushTransparentRoute(const AlarmPage());
              alarmmanager.internal();
              alarmmanager.show();

              break;
            case ("timer"):
              context.pushTransparentRoute(const TimerPage());
              break;
            case ("goal"):
              context.pushTransparentRoute(const GoalPage());
              break;
          }
        },
        child: Hero(
          tag: tag,
          child: Material(
            color: Colors.transparent,
            child: SizedBox.square(
              dimension: width / 3.6,
              child: Container(
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0), color: color),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.alarm, color: Colors.white),
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
        Row(
          // 中央寄せ
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            button(tag: "alarm", color: ColorKey.blue.value),
            button(tag: "timer", color: ColorKey.red.value),
            button(tag: "goal", color: ColorKey.green.value),
          ],
        ),
        TextButton(
            onPressed: () async {
              NotificationManager.test();
            },
            child: const Text("NotificationManager.test()")),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget largeclock(BuildContext context, Color color) {
    return DigitalClock(
      digitAnimationStyle: Curves.easeOutExpo,
      is24HourTimeFormat: clockmanager.is24get(mode: 2),
      areaDecoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      hourMinuteDigitTextStyle:
          TextStyle(fontSize: 50, color: color, fontFamily: 'M-plus-B'),
      hourMinuteDigitDecoration: const BoxDecoration(color: Colors.transparent),
      amPmDigitTextStyle: TextStyle(
          fontSize: 10, height: 2, color: color, fontFamily: 'M-plus-B'),
      secondDigitTextStyle: TextStyle(
          fontSize: 20, height: 1.5, color: color, fontFamily: 'M-plus-B'),
      secondDigitDecoration: const BoxDecoration(color: Colors.transparent),
      areaAligment: AlignmentDirectional.center,
    );
  }

  Widget expand(BuildContext context) {
    var color = colormanager.color;
    var opacity = colormanager.opacity;
    var clockcolor = colormanager.get(ref, 0, context);
    var value = colormanager.get(ref, 2, context);

    return AnimatedBuilder(
        animation: color,
        builder: (context, snapshot) {
          return Container(
              alignment: Alignment.center,
              color: color.value,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    AnimatedOpacity(
                        opacity: opacity.value,
                        duration: const Duration(seconds: 1),
                        child: Lottie.asset(value)),
                  ]),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      largeclock(context, clockcolor),
                    ],
                  )
                ],
              ));
        });
  }

  return DraggableHome(
    title: Text(
      'app_name'.tr(),
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/debug");
          Logger.e("- from majimo_timer/lib/view/home/root/widget.dart \n" +
              " > debug page opened");
        },
        icon: const Icon(Icons.developer_mode),
        color: Colors.white,
      ),
      IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed("/setting");
        },
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
            Navigator.of(context).pushNamed("/debug");
            Logger.e("- from majimo_timer/lib/view/home/root/widget.dart \n" +
                " > debug page opened");
          },
          icon: const Icon(Icons.developer_mode),
          color: Colors.white,
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/setting");
          },
          icon: const Icon(Icons.settings),
          color: Colors.white,
        ),
      ],
    ),
    body: [
      content(context),
    ],
    fullyStretchable: true,
    expandedBody: expand(context),
  );
}
