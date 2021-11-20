import 'package:app_links/app_links.dart';
import 'package:dismissible_page/src/dismissible_extensions.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:majimo_timer/view/home/alarm/body.dart';
import 'package:majimo_timer/view/home/goal/body.dart';
import 'package:majimo_timer/view/home/timer/body.dart';
import 'package:majimo_timer/view/setting/body.dart';

late AppLinks _appLinks;

class LinkManager {
  static void initDeepLinks(WidgetRef ref, BuildContext context) async {
    //receive
    _appLinks = AppLinks(onAppLink: (Uri uri, String stringUri) async {
      receiver(stringUri, context, ref);
      Logger.i(" >> not late => " + uri.toString());
    });

    final appLink = await _appLinks.getInitialAppLinkString();
    if (appLink != null) {
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

    switch (uri) {
      case ("h"):
        Navigator.of(context).pushReplacementNamed("/home");
        break;

      case ("a"):
        Navigator.of(context).pushReplacementNamed("/home");
        context.pushTransparentRoute(const AlarmPage());
        ref.read(alarmManager).show();
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
}
