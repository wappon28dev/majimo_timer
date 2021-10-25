import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/view/home/model.dart';
import '/model/theme.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import '../../main.dart';
import '/plugin/draggable_home.dart';
import './header.dart';

@override
Widget buildVertical(BuildContext context) {
  var animation = context.read(colorChanger).animation;
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
      lap(context),
    ],
    fullyStretchable: true,
    expandedBody: AnimatedBuilder(
        animation: animation,
        builder: (context, snapshot) {
          return Container(
              alignment: Alignment.center,
              color: animation.value,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: largeclock(context),
                  ),
                ],
              ));
        }),
  );
}

Widget buildHorizontal(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    color: Colors.pink,
    child: const Text("ヨコ", style: TextStyle(fontSize: 32)),
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

Widget largeclock(BuildContext context) {
  return DigitalClock(
    digitAnimationStyle: Curves.easeOutExpo,
    is24HourTimeFormat: context.read(clockChanger).is24,
    areaDecoration: const BoxDecoration(
      color: Colors.transparent,
    ),
    hourMinuteDigitTextStyle:
        const TextStyle(fontSize: 50, color: Colors.white),
    hourMinuteDigitDecoration: const BoxDecoration(color: Colors.transparent),
    amPmDigitTextStyle:
        const TextStyle(fontSize: 10, height: 2, color: Colors.white),
    secondDigitTextStyle:
        const TextStyle(fontSize: 20, height: 1.5, color: Colors.white),
    secondDigitDecoration: const BoxDecoration(color: Colors.transparent),
    areaAligment: AlignmentDirectional.center,
  );
}

// ignore: avoid_unnecessary_containers
Container headerWidget(BuildContext context) => Container(
      color: MyTheme.getcolor("orange"),
      child: Container(
        child: DigitalClock(
          digitAnimationStyle: Curves.easeOutExpo,
          is24HourTimeFormat: useProvider(clockChanger).is24,
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
