// ignore_for_file: implementation_imports

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/src/helper.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/controller/controller.dart';
import 'package:majimo_timer/helper/plugin/flutter_analog_clock/flutter_analog_clock.dart';
import 'package:majimo_timer/helper/theme.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/view/routes/tutorial.dart';

import 'widget.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    useEffect(() {
      GlobalController.switch_full_screen(value: false);
    });

    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: MyTheme().lightTheme,
        darkTheme: MyTheme().darkTheme,
        themeMode: ref.watch(themeState).theme_value,
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

Widget analogclock({required BuildContext context, required WidgetRef ref}) {
  final isLight = ref.read(themeState.notifier).isLight(context: context);
  final showSec = ref.read(clockState).showSec;
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

Widget fab({required BuildContext context, required WidgetRef ref}) {
  return SizedBox(
      height: 80,
      width: 80,
      child: GestureDetector(
          onLongPressUp: () => null,
          child: FloatingActionButton(
            heroTag: 'global',
            onPressed: () => ref
                .read(generalState.notifier)
                .push_replace(context: context, page: const Tutorial()),
            splashColor: Colors.green.shade300,
            backgroundColor: Colors.tealAccent,
            child: const Icon(
              Icons.accessibility_new_sharp,
              color: Colors.black,
            ),
          )));
}
