import 'package:flare_flutter/base/math/aabb.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:majimo_timer/view/home/body.dart';
import 'package:majimo_timer/view/setting/widget.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../main.dart';
import '../../model/theme.dart';
import '../setting/model.dart';
import '../setting/widget.dart';

class Setting extends HookWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final thememanager = useProvider(themeManager);
    final theme = useProvider(themeManager).theme;
    final clockmanager = useProvider(clockManager);
    final langmanager = useProvider(langManager);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: appbar(context),
          body: SingleChildScrollView(
              child: Column(children: [
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("　" + 'sec1'.tr(),
                    style: TextStyle(color: MyTheme.getcolor("orange"))),
              ],
            ),
            ListTile(
              title: Text('pref1'.tr()),
              subtitle: Text(langmanager.get(mode: 0)),
              leading: const Icon(Icons.language),
              onTap: () {
                dia1(context);
              },
            ),
            ListTile(
              title: Text('pref2'.tr()),
              subtitle: Text(clockmanager.is24get(mode: 0)),
              leading: clockmanager.is24get(mode: 1),
              onTap: () {
                dia2(context);
              },
            ),
            ListTile(
              title: Text('pref3'.tr()),
              subtitle: Text(thememanager.get(mode: 0)),
              leading: thememanager.get(mode: 1),
              onTap: () {
                dia3(context);
              },
            ),
          ]))),
    );
  }
}

AppBar appbar(BuildContext context) {
  return AppBar(
    leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        }),
    title: Text('prefer'.tr(),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )),
    centerTitle: true,
    backgroundColor: Colors.deepOrange,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    brightness: Brightness.dark,
  );
}
