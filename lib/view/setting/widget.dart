// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/src/helper.dart';
import 'package:majimo_timer/model/notification.dart';
import 'package:majimo_timer/model/theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/plugin/quds_ui_kit/quds_bottom_sheet_container.dart';
import '../../main.dart';
import 'package:flag/flag.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

modal(BuildContext context, WidgetRef ref, String title, String subtitle,
    List<Widget> widget) {
  var radius = const BorderRadius.only(
      topRight: Radius.circular(20), topLeft: Radius.circular(20));
  bool value = ref.read(themeManager).isLight(context: context);
  List<Widget> header = [
    Theme(
      data: ref.read(myTheme).get_theme(context: context),
      child: Column(children: <Widget>[
        const SizedBox(height: 10),
        Icon(Icons.ac_unit),
        const SizedBox(height: 8),
        AutoSizeText(title,
            style: TextStyle(color: value ? Colors.black : Colors.white),
            minFontSize: 20,
            maxLines: 1),
        const SizedBox(height: 5),
        AutoSizeText(subtitle,
            style: TextStyle(color: value ? Colors.black : Colors.white),
            maxLines: 1),
        const SizedBox(height: 5),
        const Divider(
          thickness: 2.0,
        ),
      ]),
    )
  ];
  List<Widget> bottom = [
    const SizedBox(height: 10),
  ];
  return showBarModalBottomSheet(
      context: context,
      duration: const Duration(milliseconds: 300),
      // shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //         topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      builder: (context) => SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Theme(
              data: ref.read(myTheme).get_theme(context: context),
              child: Ink(
                padding: const EdgeInsets.all(15),
                color: value
                    ? Colors.deepOrange.shade100.lighter(12)
                    : Colors.deepOrange.shade50.darker(70),
                child: Column(children: header + widget + bottom),
              ))));
  // return showQudsModalBottomSheet(
  //     context,
  //     (c) => Column(
  //           children: titleWidget + widget + bottomspace,
  //         ));
}

style(pref, value) {
  // int mode : 0 => return TextStyle,
  //            1 => return Color,
  //            2 => return Icon
  final Color color = ColorKey.orange.value;
  List array = []..length = 3;
  (value == pref)
      ? array = [
          TextStyle(color: color, fontWeight: FontWeight.bold),
          color,
          Icon(Icons.check, color: color)
        ]
      : null;
  return array;
}

dia1(BuildContext context, WidgetRef ref) {
  void func({required int lang}) =>
      ref.watch(langManager).change(context: context, lang: lang);
  final int pref = ref.watch(langManager).value;
  return modal(
    context,
    ref,
    'pref1'.tr(),
    'pref1_sub'.tr(),
    [
      ListTile(
        title: Text('system'.tr(), style: style(pref, 0)[0]),
        leading:
            Icon(Icons.system_security_update_good, color: style(pref, 0)[1]),
        trailing: style(pref, 0)[2],
        onTap: () {
          func(lang: 0);
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text("日本語/Japanese", style: style(pref, 1)[0]),
        leading: const Flag.fromString('JP', height: 25, width: 25),
        trailing: style(pref, 1)[2],
        onTap: () {
          func(lang: 1);
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text("英語/English", style: style(pref, 2)[0]),
        leading: const Flag.fromString('US', height: 25, width: 25),
        trailing: style(pref, 2)[2],
        onTap: () {
          func(lang: 2);
          Navigator.pop(context);
        },
      ),
    ],
  );
}

dia2(BuildContext context, WidgetRef ref) {
  void func({required bool value}) =>
      ref.watch(clockManager).change_is24(value: value);
  final pref = ref.watch(clockManager).is24;

  return modal(
    context,
    ref,
    'pref2'.tr(),
    'pref2_sub'.tr(),
    [
      ListTile(
        title: Text('12style'.tr(), style: style(pref, false)[0]),
        leading: Icon(Icons.share_arrival_time, color: style(pref, false)[1]),
        trailing: style(pref, false)[2],
        onTap: () {
          func(value: false);
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('24style'.tr(), style: style(pref, true)[0]),
        leading: Icon(Icons.share_arrival_time_outlined,
            color: style(pref, true)[1]),
        trailing: style(pref, true)[2],
        onTap: () {
          func(value: true);
          Navigator.pop(context);
        },
      ),
      const SizedBox(height: 10),
      Text('restart'.tr(), style: const TextStyle(color: Color(0xFF777777))),
      const SizedBox(height: 10)
    ],
  );
}

dia3(BuildContext context, WidgetRef ref) {
  void func({required int theme}) =>
      ref.watch(themeManager).change(theme: theme);
  final pref = ref.watch(themeManager).get()[2];

  return modal(
    context,
    ref,
    'pref3'.tr(),
    'pref3_sub'.tr(),
    [
      ListTile(
        title: Text('system'.tr(), style: style(pref, 0)[0]),
        leading: Icon(Icons.settings_brightness, color: style(pref, 0)[1]),
        trailing: style(pref, 0)[2],
        onTap: () {
          func(theme: 0);
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('light'.tr(), style: style(pref, 1)[0]),
        leading: Icon(Icons.brightness_7, color: style(pref, 1)[1]),
        trailing: style(pref, 1)[2],
        onTap: () {
          func(theme: 1);
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('dark'.tr(), style: style(pref, 2)[0]),
        leading: Icon(Icons.nights_stay, color: style(pref, 2)[1]),
        trailing: style(pref, 2)[2],
        onTap: () {
          func(theme: 2);
          Navigator.pop(context);
        },
      ),
    ],
  );
}

dia4(BuildContext context, WidgetRef ref) {
  void func({required bool value}) =>
      ref.read(generalManager).change_topToast(value: value);
  final pref = ref.watch(generalManager).topToast;

  return modal(
    context,
    ref,
    'pref4'.tr(),
    'pref4_sub'.tr(),
    [
      ListTile(
        title: Text('top'.tr(), style: style(pref, true)[0]),
        leading: Icon(Icons.keyboard_arrow_up, color: style(pref, true)[1]),
        trailing: style(pref, true)[2],
        onTap: () {
          func(value: true);
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('bottom'.tr(), style: style(pref, false)[0]),
        leading: Icon(Icons.keyboard_arrow_down, color: style(pref, false)[1]),
        trailing: style(pref, false)[2],
        onTap: () {
          func(value: false);
          Navigator.pop(context);
        },
      ),
      ElevatedButton(
          onPressed: () {
            ToastManager.toast(context: context, ref: ref, id: 1);
          },
          child: const Text("toast test ! ")),
    ],
  );
}

dia5(BuildContext context, WidgetRef ref) {
  void func({required int sec}) =>
      ref.read(generalManager).change_toastDuration(value: sec);
  final pref = ref.watch(generalManager).toastDuration;

  return modal(
    context,
    ref,
    'pref5'.tr(),
    'pref5_sub'.tr(),
    [
      ListTile(
        title: Text('sec'.plural(3), style: style(pref, 3)[0]),
        leading: Icon(Icons.looks_3, color: style(pref, 3)[1]),
        trailing: style(pref, 3)[2],
        onTap: () {
          func(sec: 3);
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('sec'.plural(4), style: style(pref, 4)[0]),
        leading: Icon(Icons.looks_4, color: style(pref, 4)[1]),
        trailing: style(pref, 4)[2],
        onTap: () {
          func(sec: 4);
          Navigator.pop(context);
        },
      ),
      ListTile(
        title: Text('sec'.plural(5), style: style(pref, 5)[0]),
        leading: Icon(Icons.looks_5, color: style(pref, 5)[1]),
        trailing: style(pref, 5)[2],
        onTap: () {
          func(sec: 5);
          Navigator.pop(context);
        },
      ),
    ],
  );
}
