import 'package:dismissible_page/src/dismissible_extensions.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/view/home/model.dart';
import '/model/theme.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import '../../main.dart';
import '/plugin/draggable_home.dart';
import 'alarm/body.dart';
import 'timer/body.dart';
import 'goal/body.dart';
import 'package:lottie/lottie.dart';

// ignore: avoid_unnecessary_containers
Container headerWidget(BuildContext context) => Container(
      color: MyTheme.getcolor("orange"),
      child: Container(
        child: DigitalClock(
          digitAnimationStyle: Curves.easeOutExpo,
          is24HourTimeFormat: useProvider(clockManager).is24,
          areaDecoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          hourMinuteDigitTextStyle:
              const TextStyle(fontSize: 50, color: Colors.white),
          hourMinuteDigitDecoration:
              const BoxDecoration(color: Colors.transparent),
          amPmDigitTextStyle:
              const TextStyle(fontSize: 10, height: 2, color: Colors.white),
          secondDigitTextStyle:
              const TextStyle(fontSize: 20, height: 1.5, color: Colors.white),
          secondDigitDecoration: const BoxDecoration(color: Colors.transparent),
          areaAligment: AlignmentDirectional.center,
        ),
      ),
    );

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
      Text("hoge", style: Theme.of(context).textTheme.headline4),
      const SizedBox(height: 20),
    ],
  );
}

Widget button(
    {required String tag,
    required String color,
    required BuildContext context}) {
  return GestureDetector(
      onTap: () {
        switch (tag) {
          case ("alarm"):
            context.pushTransparentRoute(const AlarmPage());
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
            dimension: 100,
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
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ]),
            ),
          ),
        ),
      ));
}

ListView listView() {
  return ListView.builder(
    padding: EdgeInsets.only(top: 0),
    physics: NeverScrollableScrollPhysics(),
    itemCount: 20,
    shrinkWrap: true,
    itemBuilder: (context, index) => Card(
      color: Colors.white70,
      child: ListTile(
        leading: CircleAvatar(
          child: Text("$index"),
        ),
        title: Text("Title"),
        subtitle: Text("Subtitile"),
      ),
    ),
  );
}

Widget smallclock() {
  return DigitalClock(
    digitAnimationStyle: Curves.easeOutExpo,
    is24HourTimeFormat: true,
    areaDecoration: const BoxDecoration(
      color: Colors.transparent,
    ),
    hourMinuteDigitTextStyle: const TextStyle(
      fontSize: 15,
    ),
    secondDigitTextStyle: const TextStyle(
      fontSize: 8,
    ),
    hourMinuteDigitDecoration: const BoxDecoration(color: Colors.transparent),
    secondDigitDecoration: const BoxDecoration(color: Colors.transparent),
  );
}

Widget largeclock(BuildContext context, Color color) {
  return DigitalClock(
    digitAnimationStyle: Curves.easeOutExpo,
    is24HourTimeFormat: context.read(clockManager).is24,
    areaDecoration: const BoxDecoration(
      color: Colors.transparent,
    ),
    hourMinuteDigitTextStyle: TextStyle(fontSize: 50, color: color),
    hourMinuteDigitDecoration: const BoxDecoration(color: Colors.transparent),
    amPmDigitTextStyle: TextStyle(fontSize: 10, height: 2, color: color),
    secondDigitTextStyle: TextStyle(fontSize: 20, height: 1.5, color: color),
    secondDigitDecoration: const BoxDecoration(color: Colors.transparent),
    areaAligment: AlignmentDirectional.center,
  );
}

Widget expand(BuildContext context) {
  var color = context.read(colorManager).color;
  var opacity = context.read(colorManager).opacity;
  var clockcolor = ColorManager.get(0);
  var value = ColorManager.get(2);

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
