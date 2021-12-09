import 'package:flutter/material.dart';
import 'package:majimo_timer/model/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/plugin/quds_ui_kit/quds_bottom_sheet_container.dart';
import '../../main.dart';
import 'package:flag/flag.dart';
import 'package:easy_localization/easy_localization.dart';

style(pref, value) {
  // int mode : 0 => return TextStyle,
  //            1 => return Color,
  //            2 => return Icon
  final Color color = ColorKey.blue.value;
  List array = []..length = 3;
  (value == pref)
      ? array = [
          TextStyle(color: color),
          color,
          Icon(Icons.check, color: color)
        ]
      : null;
  return array;
}

dia1(BuildContext context, WidgetRef ref) {
  void changelang({required int lang}) =>
      ref.watch(langManager).change(context: context, lang: lang);
  final int pref = ref.watch(langManager).value;
  return modal(
    context,
    'pref1'.tr(),
    [
      const SizedBox(height: 10),
      ListTile(
        title: Text('system'.tr(), style: style(pref, 0)[0]),
        leading:
            Icon(Icons.system_security_update_good, color: style(pref, 0)[1]),
        trailing: style(pref, 0)[2],
        onTap: () {
          changelang(lang: 0);
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text("日本語/Japanese", style: style(pref, 1)[0]),
        leading: const Flag.fromString('JP', height: 25, width: 25),
        trailing: style(pref, 1)[2],
        onTap: () {
          changelang(lang: 1);
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text("英語/English", style: style(pref, 2)[0]),
        leading: const Flag.fromString('US', height: 25, width: 25),
        trailing: style(pref, 2)[2],
        onTap: () {
          changelang(lang: 2);
          Navigator.pop(context);
        },
      ),
      const SizedBox(height: 10),
    ],
  );
}

dia2(BuildContext context, WidgetRef ref) {
  void is24change({required bool value}) =>
      ref.watch(clockManager).is24change(value: value);
  final pref = ref.watch(clockManager).is24;

  return modal(
    context,
    'pref2'.tr(),
    [
      const SizedBox(height: 10),
      ListTile(
        title: Text('12style'.tr(), style: style(pref, false)[0]),
        leading: Icon(Icons.share_arrival_time, color: style(pref, false)[1]),
        trailing: style(pref, false)[2],
        onTap: () {
          is24change(value: false);
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('24style'.tr(), style: style(pref, true)[0]),
        leading: Icon(Icons.share_arrival_time_outlined,
            color: style(pref, true)[1]),
        trailing: style(pref, true)[2],
        onTap: () {
          is24change(value: true);
          Navigator.pop(context);
        },
      ),
      const SizedBox(height: 10),
      Text('restart'.tr(), style: const TextStyle(color: Color(0xFF777777))),
      const SizedBox(height: 20)
    ],
  );
}

dia3(BuildContext context, WidgetRef ref) {
  void changetheme({required int theme}) =>
      ref.watch(themeManager).change(theme: theme);
  final pref = ref.watch(themeManager).get()[2];

  return modal(
    context,
    'pref3'.tr(),
    [
      const SizedBox(height: 10),
      ListTile(
        title: Text('system'.tr(), style: style(pref, 0)[0]),
        leading: Icon(Icons.settings_brightness, color: style(pref, 0)[1]),
        trailing: style(pref, 0)[2],
        onTap: () {
          changetheme(theme: 0);
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('light'.tr(), style: style(pref, 1)[0]),
        leading: Icon(Icons.brightness_7, color: style(pref, 1)[1]),
        trailing: style(pref, 1)[2],
        onTap: () {
          changetheme(theme: 1);
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('dark'.tr(), style: style(pref, 2)[0]),
        leading: Icon(Icons.nights_stay, color: style(pref, 2)[1]),
        trailing: style(pref, 2)[2],
        onTap: () {
          changetheme(theme: 2);
          Navigator.pop(context);
        },
      ),
      const SizedBox(height: 10),
    ],
  );
}

dia4(BuildContext context, WidgetRef ref) {
  void changetoptoast({required bool value}) =>
      ref.read(generalManager).changetopToast(value: value);
  final pref = ref.watch(generalManager).topToast;

  return modal(
    context,
    'pref4'.tr(),
    [
      const SizedBox(height: 10),
      ListTile(
        title: Text('top'.tr(), style: style(pref, true)[0]),
        leading: Icon(Icons.keyboard_arrow_up, color: style(pref, true)[1]),
        trailing: style(pref, true)[2],
        onTap: () {
          changetoptoast(value: true);
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('bottom'.tr(), style: style(pref, false)[0]),
        leading: Icon(Icons.keyboard_arrow_down, color: style(pref, false)[1]),
        trailing: style(pref, false)[2],
        onTap: () {
          changetoptoast(value: false);
          Navigator.pop(context);
        },
      ),
      const SizedBox(height: 10),
    ],
  );
}

modal(BuildContext context, String title, List<Widget> widget) {
  List<Widget> titleWidget = [
    Text(title, style: const TextStyle(fontSize: 20))
  ];
  return showQudsModalBottomSheet(
    context,
    (c) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: titleWidget + widget),
  );
}
