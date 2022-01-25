// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter_color/src/helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/helper/theme.dart';
import 'package:majimo_timer/helper/translations.dart';
import 'package:majimo_timer/helper/plugin/slide_digital_clock/slide_digital_clock.dart';
import 'package:majimo_timer/controller/controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../main.dart';

Future modal(BuildContext context, WidgetRef ref, IconData icon, String title,
    String subtitle, List<Widget> widget) {
  const padding = EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 8);
  final value = ref.read(themeState.notifier).isLight(context: context);
  final header = <Widget>[
    Theme(
      data: MyTheme.get_theme(context: context, ref: ref),
      child: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 3),
          width: 35,
          height: 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[400]),
        ),
        const SizedBox(height: 10),
        Icon(icon),
        const SizedBox(height: 8),
        AutoSizeText(title,
            style: TextStyle(
                color: value ? Colors.black : Colors.white,
                fontWeight: FontWeight.w600),
            minFontSize: 20,
            maxLines: 1),
        const SizedBox(height: 5),
        AutoSizeText(
          subtitle,
          style: TextStyle(color: value ? Colors.black : Colors.white),
          maxLines: 1,
          minFontSize: 10,
        ),
        const SizedBox(height: 5),
        const Divider(
          thickness: 2,
        ),
      ]),
    )
  ];
  final bottom = <Widget>[];
  return showCupertinoModalBottomSheet<dynamic>(
      context: context,
      barrierColor: Colors.black54,
      duration: const Duration(milliseconds: 300),
      topRadius: const Radius.circular(20),
      builder: (context) => SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Material(
              child: Theme(
                  data: MyTheme.get_theme(context: context, ref: ref),
                  child: Ink(
                    padding: padding,
                    color: value
                        ? Colors.deepOrange.shade100.lighter(12)
                        : Colors.deepOrange.shade50.darker(70),
                    child: Column(children: header + widget + bottom),
                  )))));
}

List style(dynamic pref, dynamic value) {
  // int mode : 0 => return TextStyle,
  //            1 => return Color,
  //            2 => return Icon
  final color = ColorKey.orange.value;
  var array = <dynamic>[]..length = 3;
  (value == pref)
      ? array = <dynamic>[
          TextStyle(color: color, fontWeight: FontWeight.bold),
          color,
          Icon(Icons.check, color: color)
        ]
      : null;
  return array;
}

dynamic change_lang(BuildContext context, WidgetRef ref) {
  void func({required int lang}) {
    ref.read(langState.notifier).change(context: context, value: lang);
    Navigator.pop(context);
  }

  final pref = ref.read(langState).lang;
  return modal(
    context,
    ref,
    Icons.language,
    t.change_lang.t,
    t.change_lang_sub.t,
    [
      ListTile(
        title: AutoSizeText(t.system.t,
            maxLines: 1, style: style(pref, 0)[0] as TextStyle?),
        leading: Icon(Icons.system_security_update_good,
            color: style(pref, 0)[1] as Color?),
        trailing: style(pref, 0)[2] as Widget?,
        onTap: () {
          func(lang: 0);
        },
      ),
      ListTile(
        title: AutoSizeText('日本語/Japanese',
            maxLines: 1, style: style(pref, 1)[0] as TextStyle?),
        leading: const Flag.fromString('JP', height: 25, width: 25),
        trailing: style(pref, 1)[2] as Widget?,
        onTap: () {
          func(lang: 1);
        },
      ),
      ListTile(
        title: AutoSizeText('英語/English',
            maxLines: 1, style: style(pref, 2)[0] as TextStyle?),
        leading: const Flag.fromString('US', height: 25, width: 25),
        trailing: style(pref, 2)[2] as Widget?,
        onTap: () {
          func(lang: 2);
        },
      ),
    ],
  );
}

dynamic app_theme(BuildContext context, WidgetRef ref) {
  void func({required int theme}) {
    ref.read(themeState.notifier).change(value: theme);

    Navigator.pop(context);
  }

  final pref = ref.read(themeState).theme;

  return modal(
    context,
    ref,
    Icons.brightness_4,
    t.app_theme.t,
    t.app_theme_sub.t,
    [
      ListTile(
        title: AutoSizeText(t.system.t,
            maxLines: 1, style: style(pref, 0)[0] as TextStyle?),
        leading:
            Icon(Icons.settings_brightness, color: style(pref, 0)[1] as Color?),
        trailing: style(pref, 0)[2] as Widget?,
        onTap: () {
          func(theme: 0);
        },
      ),
      ListTile(
        title: AutoSizeText(t.light.t,
            maxLines: 1, style: style(pref, 1)[0] as TextStyle?),
        leading: Icon(Icons.brightness_7, color: style(pref, 1)[1] as Color?),
        trailing: style(pref, 1)[2] as Widget?,
        onTap: () {
          func(theme: 1);
        },
      ),
      ListTile(
        title: AutoSizeText(t.dark.t,
            maxLines: 1, style: style(pref, 2)[0] as TextStyle?),
        leading: Icon(Icons.nights_stay, color: style(pref, 2)[1] as Color?),
        trailing: style(pref, 2)[2] as Widget?,
        onTap: () {
          func(theme: 2);
        },
      ),
    ],
  );
}

dynamic clock_style(BuildContext context, WidgetRef ref) {
  void func({required bool value}) {
    ref.read(clockState.notifier).change_is24(value: value);

    Navigator.pop(context);
  }

  final pref = ref.read(clockState).is24;

  Widget clock({required bool mode}) {
    final value = ref.read(themeState.notifier).isLight(context: context);

    final color = (mode == pref)
        ? ColorKey.orange.value
        : value
            ? Colors.black
            : Colors.white;

    return GestureDetector(
        onTap: () => func(value: mode),
        child: DigitalClock(
          digitAnimationStyle: ref.read(clockState).animation_curve,
          is24HourTimeFormat: mode,
          showSecondsDigit: ref.read(clockState).showSec,
          areaDecoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          hourMinuteDigitTextStyle: TextStyle(
              fontSize: 50, color: color, fontWeight: FontWeight.bold),
          hourMinuteDigitDecoration:
              const BoxDecoration(color: Colors.transparent),
          amPmDigitTextStyle: TextStyle(
              fontSize: 15,
              height: 2,
              color: color,
              fontWeight: FontWeight.bold),
          secondDigitTextStyle: TextStyle(
              fontSize: 20,
              height: 1.5,
              color: color,
              fontWeight: FontWeight.bold),
          secondDigitDecoration: const BoxDecoration(color: Colors.transparent),
          areaAligment: AlignmentDirectional.center,
        ));
  }

  return modal(
    context,
    ref,
    Icons.access_time,
    t.clock_style.t,
    t.clock_style_sub.t,
    [
      ListTile(
        title: AutoSizeText(t.style12.t,
            maxLines: 1, style: style(pref, false)[0] as TextStyle?),
        leading: Icon(Icons.share_arrival_time,
            color: style(pref, false)[1] as Color?),
        trailing: style(pref, false)[2] as Widget?,
        onTap: () {
          func(value: false);
        },
      ),
      clock(mode: false),
      ListTile(
        title: AutoSizeText(t.style24.t,
            maxLines: 1, style: style(pref, true)[0] as TextStyle?),
        leading: Icon(Icons.share_arrival_time_outlined,
            color: style(pref, true)[1] as Color?),
        trailing: style(pref, true)[2] as Widget?,
        onTap: () {
          func(value: true);
        },
      ),
      clock(mode: true),
      const SizedBox(height: 10),
      Text(t.restart.t,
          maxLines: 1, style: const TextStyle(color: Color(0xFF777777))),
      const SizedBox(height: 10)
    ],
  );
}

dynamic clock_showSec(BuildContext context, WidgetRef ref) {
  void func({required bool value}) {
    ref.read(clockState.notifier).change_showSec(value: value);
    Navigator.pop(context);
  }

  final pref = ref.read(clockState).showSec;

  Widget clock({required bool mode}) {
    final value = ref.read(themeState.notifier).isLight(context: context);

    final color = (mode == pref)
        ? ColorKey.orange.value
        : value
            ? Colors.black
            : Colors.white;

    return GestureDetector(
        onTap: () => func(value: mode),
        child: DigitalClock(
          digitAnimationStyle: ref.read(clockState).animation_curve,
          is24HourTimeFormat: ref.read(clockState).is24,
          showSecondsDigit: mode,
          areaDecoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          hourMinuteDigitTextStyle: TextStyle(
              fontSize: 50, color: color, fontWeight: FontWeight.bold),
          hourMinuteDigitDecoration:
              const BoxDecoration(color: Colors.transparent),
          amPmDigitTextStyle: TextStyle(
              fontSize: 15,
              height: 2,
              color: color,
              fontWeight: FontWeight.bold),
          secondDigitTextStyle: TextStyle(
              fontSize: 20,
              height: 1.5,
              color: color,
              fontWeight: FontWeight.bold),
          secondDigitDecoration: const BoxDecoration(color: Colors.transparent),
          areaAligment: AlignmentDirectional.center,
        ));
  }

  return modal(
    context,
    ref,
    Icons.av_timer,
    t.clock_seconds.t,
    t.clock_seconds_sub.t,
    [
      ListTile(
        title: AutoSizeText(t.show_sec.t,
            maxLines: 1, style: style(pref, true)[0] as TextStyle?),
        leading: Icon(Icons.timer, color: style(pref, true)[1] as Color?),
        trailing: style(pref, true)[2] as Widget?,
        onTap: () {
          func(value: true);
        },
      ),
      clock(mode: true),
      ListTile(
        title: AutoSizeText(t.not_show_sec.t,
            maxLines: 1, style: style(pref, false)[0] as TextStyle?),
        leading: Icon(Icons.timer_off, color: style(pref, false)[1] as Color?),
        trailing: style(pref, false)[2] as Widget?,
        onTap: () {
          func(value: false);
        },
      ),
      clock(mode: false),
      const SizedBox(height: 10),
      Text(t.restart.t,
          maxLines: 1, style: const TextStyle(color: Color(0xFF777777))),
      const SizedBox(height: 10)
    ],
  );
}

dynamic clock_animation(BuildContext context, WidgetRef ref) {
  void func({required int value}) {
    ref.read(clockState.notifier).change_animation(value: value);
    Navigator.pop(context);
  }

  final pref = ref.read(clockState).animation;

  Widget clock({required int mode}) {
    final value = ref.read(themeState.notifier).isLight(context: context);

    final color = (mode == pref)
        ? ColorKey.orange.value
        : (value)
            ? Colors.black
            : Colors.white;

    Curve animation() => (mode == 0) ? Curves.easeOutExpo : Curves.elasticOut;
    return GestureDetector(
        onTap: () => func(value: mode),
        child: DigitalClock(
          showSecondsDigit: true,
          digitAnimationStyle: animation(),
          is24HourTimeFormat: ref.read(clockState).is24,
          areaDecoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          hourMinuteDigitTextStyle: TextStyle(
              fontSize: 50, color: color, fontWeight: FontWeight.bold),
          hourMinuteDigitDecoration:
              const BoxDecoration(color: Colors.transparent),
          amPmDigitTextStyle: TextStyle(
              fontSize: 15,
              height: 2,
              color: color,
              fontWeight: FontWeight.bold),
          secondDigitTextStyle: TextStyle(
              fontSize: 20,
              height: 1.5,
              color: color,
              fontWeight: FontWeight.bold),
          secondDigitDecoration: const BoxDecoration(color: Colors.transparent),
          areaAligment: AlignmentDirectional.center,
        ));
  }

  return modal(
    context,
    ref,
    Icons.auto_graph,
    t.clock_animation.t,
    t.clock_animation_sub.t,
    [
      Visibility(
          visible: !(ref.read(clockState).showSec),
          child: Column(children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.warning, color: Colors.red),
                const SizedBox(width: 10),
                AutoSizeText(t.show_temp.t,
                    style: const TextStyle(color: Colors.red))
              ],
            ),
            const SizedBox(height: 10),
          ])),
      ListTile(
        title: AutoSizeText(t.easeOutExpo.t,
            maxLines: 1, style: style(pref, 0)[0] as TextStyle?),
        leading: Icon(Icons.moving, color: style(pref, 0)[1] as Color?),
        trailing: style(pref, 0)[2] as Widget?,
        onTap: () {
          func(value: 0);
        },
      ),
      clock(mode: 0),
      ListTile(
        title: AutoSizeText(t.elasticOut.t,
            maxLines: 1, style: style(pref, 1)[0] as TextStyle?),
        leading: Icon(Icons.bubble_chart, color: style(pref, 1)[1] as Color?),
        trailing: style(pref, 1)[2] as Widget?,
        onTap: () {
          func(value: 1);
        },
      ),
      clock(mode: 1),
      const SizedBox(height: 10),
      Text(t.restart.t,
          maxLines: 1, style: const TextStyle(color: Color(0xFF777777))),
      const SizedBox(height: 10)
    ],
  );
}

dynamic toast_position(BuildContext context, WidgetRef ref) {
  void func({required bool value}) {
    ref.read(generalState.notifier).change_topToast(value: value);

    Navigator.pop(context);
  }

  final pref = ref.read(generalState).topToast;

  return modal(
    context,
    ref,
    Icons.unfold_more_sharp,
    t.toast_position.t,
    t.toast_position_sub.t,
    [
      ListTile(
        title: AutoSizeText(t.top.t,
            maxLines: 1, style: style(pref, true)[0] as TextStyle?),
        leading: Icon(Icons.keyboard_arrow_up,
            color: style(pref, true)[1] as Color?),
        trailing: style(pref, true)[2] as Widget?,
        onTap: () {
          func(value: true);
        },
      ),
      ListTile(
        title: AutoSizeText(t.bottom.t,
            maxLines: 1, style: style(pref, false)[0] as TextStyle?),
        leading: Icon(Icons.keyboard_arrow_down,
            color: style(pref, false)[1] as Color?),
        trailing: style(pref, false)[2] as Widget?,
        onTap: () {
          func(value: false);
        },
      ),
    ],
  );
}

dynamic toast_duration(BuildContext context, WidgetRef ref) {
  void func({required int sec}) {
    ref.read(generalState.notifier).change_toastDuration(value: sec);

    Navigator.pop(context);
  }

  final pref = ref.read(generalState).toastDuration;

  return modal(
    context,
    ref,
    Icons.timelapse,
    t.toast_duration.t,
    t.toast_duration_sub.t,
    [
      ListTile(
        title: AutoSizeText(t.sec.p(3),
            maxLines: 1, style: style(pref, 3)[0] as TextStyle?),
        leading: Icon(Icons.looks_3, color: style(pref, 3)[1] as Color?),
        trailing: style(pref, 3)[2] as Widget?,
        onTap: () {
          func(sec: 3);
        },
      ),
      ListTile(
        title: AutoSizeText(t.sec.p(4),
            maxLines: 1, style: style(pref, 4)[0] as TextStyle?),
        leading: Icon(Icons.looks_4, color: style(pref, 4)[1] as Color?),
        trailing: style(pref, 4)[2] as Widget?,
        onTap: () {
          func(sec: 4);
        },
      ),
      ListTile(
        title: AutoSizeText(t.sec.p(5),
            maxLines: 1, style: style(pref, 5)[0] as TextStyle?),
        leading: Icon(Icons.looks_5, color: style(pref, 5)[1] as Color?),
        trailing: style(pref, 5)[2] as Widget?,
        onTap: () {
          func(sec: 5);
        },
      ),
    ],
  );
}
