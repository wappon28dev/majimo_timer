import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/app_link.dart';
import 'package:majimo_timer/model/notification.dart';
import 'package:majimo_timer/model/theme.dart';
import 'package:majimo_timer/plugin/draggable_home/draggable_home.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
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
    final theme = ref.watch(themeManager).theme;

    useEffect(() {
      FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_DISMISS_KEYGUARD);
    });

    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ref.read(myTheme).lightTheme,
        darkTheme: ref.watch(myTheme).darkTheme,
        themeMode: ref.watch(themeManager).theme,
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