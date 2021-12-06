import 'package:app_links/app_links.dart';
import 'package:dismissible_page/src/dismissible_extensions.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:majimo_timer/view/home/alarm/body.dart';
import 'package:majimo_timer/view/home/goal/body.dart';
import 'package:majimo_timer/view/home/timer/body.dart';
import 'package:majimo_timer/view/setting/body.dart';
import 'package:quick_actions/quick_actions.dart';

late AppLinks _appLinks;

class LinkManager {
  static void initDeepLinks(WidgetRef ref, BuildContext context) async {
    //receive
    _appLinks = AppLinks(onAppLink: (Uri uri, String stringUri) async {
      receiver(stringUri, context, ref);
      Logger.i(" >> not late => " + uri.toString());
    });

    final appLink = await _appLinks.getInitialAppLink();
    if (appLink != null && appLink.hasFragment) {
      receiver(appLink.toString(), context, ref);
      Logger.i(" >> late => " + appLink.toString());
    }
  }

  static void receiver(String uri, BuildContext context, WidgetRef ref) {
    if (uri.startsWith("m")) {
      uri = uri.replaceAll("majimo://app/", "");
    }
    if (uri.startsWith("h")) {
      uri = uri.replaceAll("https://majimo.jp/app/", "");
    }
    Logger.i("tranfered -> " + uri);
    launcher(context, ref, uri);
  }

  static void launcher(BuildContext context, WidgetRef ref, String mode) {
    switch (mode) {
      case ("h"):
        Navigator.of(context).pushReplacementNamed("/home");
        break;

      case ("a"):
        Navigator.of(context).pushReplacementNamed("/home");
        context.pushTransparentRoute(const AlarmPage());
        ref.watch(alarmManager).internal();
        ref.watch(alarmManager).show();
        break;

      case ("t"):
        Navigator.of(context).pushReplacementNamed("/home");
        context.pushTransparentRoute(const TimerPage());
        break;

      case ("g"):
        Navigator.of(context).pushReplacementNamed("/home");
        context.pushTransparentRoute(const GoalPage());
        break;

      case ("s"):
        Navigator.of(context).pushReplacementNamed("/home");
        Navigator.of(context).pushNamed("/setting");

        break;
    }
  }

  static void initQuickAction(
      {required BuildContext context, required WidgetRef ref}) {
    const QuickActions quickActions = QuickActions();
    quickActions.initialize((shortcutType) async {
      launcher(context, ref, shortcutType);
    });
    quickActions.setShortcutItems(<ShortcutItem>[
      ShortcutItem(
          type: 'a', localizedTitle: 'alarm'.tr(), icon: 'ic_launcher'),
      ShortcutItem(
          type: 't', localizedTitle: 'timer'.tr(), icon: 'ic_launcher'),
      ShortcutItem(type: 'g', localizedTitle: 'goal'.tr(), icon: 'ic_launcher'),
    ]);
  }
}
