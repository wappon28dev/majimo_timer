import 'package:flutter/material.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/theme.dart';
import 'package:majimo_timer/plugin/draggable_home/draggable_home.dart';
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

    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: theme,
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
