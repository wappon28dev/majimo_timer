import 'package:flutter/material.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/theme.dart';
import 'package:majimo_timer/plugin/draggable_home.dart';
import 'model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../main.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;
    final theme = useProvider(themeManager).theme;

    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: theme,
        debugShowCheckedModeBanner: false,
        home:
            !(isLandscape) ? buildVertical(context) : buildHorizontal(context));
  }

  Widget buildVertical(BuildContext context) {
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

  Widget buildHorizontal(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      child: const Text("ヨコ", style: TextStyle(fontSize: 32)),
    );
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
