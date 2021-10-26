import 'package:flutter/material.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/theme.dart';
import 'model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../main.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);
  static getcolor(String colorname) => MyTheme.getcolor(colorname);

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;
    final theme = useProvider(themeChanger).theme;

    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: theme,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:
            !(isLandscape) ? buildVertical(context) : buildHorizontal(context));
  }
  // return OrientationBuilder(
  //   builder: (context, orientation) {
  //     return orientation == Orientation.portrait
  //         ? HomeWidget.buildVertical(useContext())
  //         : HomeWidget.buildHorizontal(useContext());
  //   },
  // );
  // return LayoutBuilder(
  //   builder: (_, constraints) {
  //     return constraints.maxWidth < constraints.maxHeight
  //         ? HomeWidget.buildVertical(useContext())
  //         : HomeWidget.buildHorizontal(useContext());
  //   },
  // );
}
