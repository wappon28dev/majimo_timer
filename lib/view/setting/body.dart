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
    final theme = useProvider(themeChanger).theme;
    final is24 = useProvider(clockChanger).is24;

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
        body: SettingsList(sections: [
          CustomSection(
              child: const SizedBox(
            height: 20,
          )),
          SettingsSection(
            title: 'sec1'.tr(),
            titleTextStyle:
                const TextStyle(color: Colors.deepOrange, fontSize: 15),
            subtitle: const Text('tes'),
            tiles: [dia1(context), dia2(context), dia3(context)],
          ),
          CustomSection(
              child: SizedBox(
            height: 10,
          )),
          SettingsSection(
            title: 'Account',
            tiles: [
              SettingsTile(title: 'Phone number', leading: Icon(Icons.phone)),
              SettingsTile(title: 'Email', leading: Icon(Icons.email)),
              SettingsTile(title: 'Sign out', leading: Icon(Icons.exit_to_app)),
            ],
          ),
          SettingsSection(
            title: 'Misc',
            tiles: [
              SettingsTile(
                  title: 'Terms of Service', leading: Icon(Icons.description)),
              SettingsTile(
                  title: 'Open source licenses',
                  leading: Icon(Icons.collections_bookmark)),
            ],
          ),
          CustomSection(
            child: Column(
              children: [
                Text(
                  'Version: 2.4.0 (287)',
                  style: TextStyle(color: Color(0xFF777777)),
                ),
              ],
            ),
          )
        ]),
      ),
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
