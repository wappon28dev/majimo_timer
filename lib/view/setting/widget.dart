import 'package:flutter/material.dart';
import 'package:majimo_timer/view/setting/model.dart';
import 'package:quds_ui_kit/screens/quds_screens.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../main.dart';
import 'package:flag/flag.dart';

SettingsTile dia1(BuildContext context) {
  String thememode = context.read(themeChanger).thememode();
  void changelang({required int lang}) =>
      context.read(langChanger).changelang(context: context, lang: lang);

  return SettingsTile(
    title: 'pref1'.tr(),
    subtitle: thememode,
    leading: const Icon(Icons.language),
    onPressed: (context) {
      showQudsModalBottomSheet(
          context,
          (c) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 10),
                  ListTile(
                    title: Text('system'.tr()),
                    leading: const Icon(Icons.system_security_update_good),
                    onTap: () {
                      changelang(lang: 0);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text("日本語/Japanese"),
                    leading: const Flag.fromString('JP', height: 25, width: 25),
                    onTap: () {
                      changelang(lang: 1);

                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text("英語/English"),
                    leading: const Flag.fromString('US', height: 25, width: 25),
                    onTap: () {
                      changelang(lang: 2);

                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
          title: Text('pref1'.tr(), style: const TextStyle(fontSize: 20)));
    },
  );
}

SettingsTile dia2(BuildContext context) {
  void is24changer(bool mode) => context.read(clockChanger).is24changer(mode);
  final is24 = useProvider(clockChanger).is24;

  return SettingsTile(
    title: 'pref2'.tr(),
    subtitle: (is24) ? '24style'.tr() : '12style'.tr(),
    leading: const Icon(Icons.access_time),
    onPressed: (context) {
      showQudsModalBottomSheet(
          context,
          (c) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 10),
                  ListTile(
                    title: Text('12style'.tr()),
                    leading: const Icon(Icons.share_arrival_time),
                    onTap: () {
                      is24changer(false);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('24style'.tr()),
                    leading: const Icon(Icons.share_arrival_time_outlined),
                    onTap: () {
                      is24changer(true);
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10),
                  Text('restart'.tr()),
                  const SizedBox(height: 10)
                ],
              ),
          title: Text('pref2'.tr(), style: const TextStyle(fontSize: 20)));
    },
  );
}

SettingsTile dia3(BuildContext context) {
  void changetheme({required int theme}) =>
      context.read(themeChanger).changetheme(theme: theme);
  String thememode = context.read(themeChanger).thememode();
  IconData icon = context.read(themeChanger).thememodeicon();

  return SettingsTile(
    title: 'pref3'.tr(),
    subtitle: thememode,
    leading: Icon(icon),
    onPressed: (context) {
      showQudsModalBottomSheet(
          context,
          (c) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(height: 10),
                  ListTile(
                    title: Text('system'.tr()),
                    leading: const Icon(Icons.settings_brightness),
                    onTap: () {
                      changetheme(theme: 0);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('light'.tr()),
                    leading: const Icon(Icons.brightness_7),
                    onTap: () {
                      changetheme(theme: 1);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('dark'.tr()),
                    leading: const Icon(Icons.nights_stay),
                    onTap: () {
                      changetheme(theme: 2);
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
          title: Text('pref3'.tr(), style: const TextStyle(fontSize: 20)));
    },
  );
}
