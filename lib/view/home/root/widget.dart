import 'package:dismissible_page/src/dismissible_extensions.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/pref.dart';
import 'package:majimo_timer/plugin/let_log.dart';
import 'package:majimo_timer/view/home/alarm/body.dart';
import 'package:majimo_timer/view/home/goal/body.dart';
import 'package:majimo_timer/view/home/timer/body.dart';
import '/model/theme.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import '/plugin/draggable_home.dart';
import 'body.dart';
import 'package:lottie/lottie.dart';

Widget buildVertical(BuildContext context) {
  final clockmanager = useProvider(clockManager);
  final colormanager = useProvider(colorManager);
  final alarmmanager = useProvider(alarmManager);
  final width = MediaQuery.of(context).size.width;

  Container headerWidget(BuildContext context) => Container(
        color: MyTheme.getcolor("orange"),
        child: Container(
          child: DigitalClock(
            digitAnimationStyle: Curves.easeOutExpo,
            is24HourTimeFormat: useProvider(clockManager).is24,
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

  Widget button(
      {required String tag,
      required String color,
      required BuildContext context}) {
    return GestureDetector(
        onTap: () {
          switch (tag) {
            case ("alarm"):
              context.pushTransparentRoute(const AlarmPage());
              context.read(alarmManager).internal();
              context.read(alarmManager).show();

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
                    borderRadius: BorderRadius.circular(20.0),
                    color: MyTheme.getcolor(color)),
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
            button(tag: "alarm", color: "blue", context: context),
            button(tag: "timer", color: "red", context: context),
            button(tag: "goal", color: "green", context: context),
          ],
        ),
        TextButton(
            onPressed: () {
              const value = TimeOfDay(hour: 12, minute: 12);
              alarmmanager.change(value: value);
            },
            child: const Text("a")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/debug");
              Logger.e("- from majimo_timer/lib/view/home/root/widget.dart \n" +
                  " > debug page opened");
            },
            child: const Text("show console")),
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
    var clockcolor = colormanager.get(0, context);
    var value = colormanager.get(2, context);

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
