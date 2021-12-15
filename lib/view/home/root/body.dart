// ignore_for_file: implementation_imports

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/src/helper.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/plugin/flutter_analog_clock/flutter_analog_clock.dart';

import 'widget.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    useEffect(() {
      FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_DISMISS_KEYGUARD);
    });

    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ref.read(myTheme).lightTheme,
        darkTheme: ref.read(myTheme).darkTheme,
        themeMode: ref.watch(themeManager).theme_value,
        debugShowCheckedModeBanner: false,
        home: !isLandscape
            ? buildVertical(context, ref)
            : buildHorizontal(context));
  }

  Widget buildHorizontal(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      child: const Text('ヨコ', style: TextStyle(fontSize: 32)),
    );
  }
}

Widget analogclock({required bool isLight, required bool showSec}) {
  return FlutterAnalogClock(
    showNumber: true,
    dialPlateColor: Colors.transparent,
    hourHandColor: isLight ? Colors.white : Colors.white.darker(20),
    minuteHandColor: isLight ? Colors.white : Colors.white.darker(20),
    secondHandColor: isLight ? Colors.white : Colors.white.darker(20),
    numberColor: Colors.white.darker(50),
    centerPointColor: isLight ? Colors.white : Colors.white.darker(20),
    borderWidth: 0,
    showSecondHand: showSec,
    showTicks: false,
  );
}
