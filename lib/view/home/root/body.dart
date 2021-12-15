import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/src/helper.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/app_link.dart';
import 'package:majimo_timer/model/notification.dart';
import 'package:majimo_timer/model/theme.dart';
import 'package:majimo_timer/plugin/draggable_home/draggable_home.dart';
import 'package:majimo_timer/plugin/flutter_analog_clock/flutter_analog_clock.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:majimo_timer/vm/viewmodel.dart';
import 'package:quick_actions/quick_actions.dart';
import 'widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:easy_localization/easy_localization.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;

    useEffect(() {
      FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_DISMISS_KEYGUARD);
    });

    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ref.read(myTheme).lightTheme,
        darkTheme: ref.watch(myTheme).darkTheme,
        themeMode: ThemeManagerVM(ref.read).themeMode_value,
        debugShowCheckedModeBanner: false,
        home: !(isLandscape)
            ? buildVertical(context, ref)
            : buildHorizontal(context));
  }

  Widget buildHorizontal(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      child: const Text("ヨコ", style: TextStyle(fontSize: 32)),
    );
  }
}

Widget analogclock() {
  List<String> numbers() {
    final list = <String>[];
    for (var i = 1; i <= 12; i++) {
      list.add(i.toString());
    }
    return list;
  }

  return FlutterAnalogClock(
    showNumber: true,
    dialPlateColor: Colors.transparent,
    hourHandColor: Colors.white,
    minuteHandColor: Colors.white,
    secondHandColor: Colors.white,
    numberColor: Colors.white.darker(50),
    centerPointColor: Colors.white,
    borderWidth: 0,
    showSecondHand: true,
    showTicks: false,
  );
}
