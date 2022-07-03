import 'package:app_links/app_links.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/view/home/alarm/body.dart';
import 'package:majimo_timer/view/home/goal/body.dart';
import 'package:majimo_timer/view/home/root/body.dart';
import 'package:majimo_timer/view/home/timer/body.dart';
import 'package:majimo_timer/view/routes/transition.dart';
import 'package:majimo_timer/view/setting/body.dart';
import 'package:quick_actions/quick_actions.dart';

late AppLinks _appLinks;

class LinkManager {
  Future<void> initDeepLinks(WidgetRef ref, BuildContext context) async {
    //receive
    _appLinks = AppLinks();
    final appLink = await _appLinks.getInitialAppLink();
    if (appLink != null && appLink.hasFragment) {
      receiver(appLink.toString(), context, ref);
      Logger.i(' >> late => $appLink');
    }
  }

  void receiver(String uri, BuildContext context, WidgetRef ref) {
    var routableUri = '';
    if (uri.startsWith('m')) {
      routableUri = uri.replaceAll('majimo://app/', '');
    }
    if (uri.startsWith('h')) {
      routableUri = uri.replaceAll('https://majimo.jp/app/', '');
    }
    Logger.i('transferred -> $routableUri');
    launcher(context, ref, uri);
  }

  void launcher(BuildContext context, WidgetRef ref, String mode) {
    switch (mode) {
      case 'h':
        RouteManager(context, ref)
            .runPush(page: const HomePage(), isReplace: true);
        break;

      case 'a':
        RouteManager(context, ref)
            .runPush(page: const HomePage(), isReplace: true);
        context.pushTransparentRoute<void>(const AlarmPage());
        ref.read(alarmState.notifier).runInitialize();
        ref.read(generalState.notifier).runFAB();
        break;

      case 't':
        RouteManager(context, ref)
            .runPush(page: const HomePage(), isReplace: true);
        context.pushTransparentRoute<void>(const TimerPage());
        break;

      case 'g':
        RouteManager(context, ref)
            .runPush(page: const HomePage(), isReplace: true);
        context.pushTransparentRoute<void>(const GoalPage());
        break;

      case 's':
        RouteManager(context, ref)
            .runPush(page: const HomePage(), isReplace: true);
        RouteManager(context, ref)
            .runPush(page: const Setting(), isReplace: false);
        break;
    }
  }

  void initQuickAction({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    const QuickActions().initialize((shortcutType) async {
      launcher(context, ref, shortcutType);
    });
    const QuickActions().setShortcutItems(<ShortcutItem>[
      ShortcutItem(
        type: 'g',
        localizedTitle: t.goal.t,
        icon: 'ic_shortcut_access_alarm',
      ),
      ShortcutItem(
        type: 't',
        localizedTitle: t.timer.t,
        icon: 'ic_shortcut_hourglass_top',
      ),
      ShortcutItem(
        type: 'a',
        localizedTitle: t.alarm.t,
        icon: 'ic_shortcut_flag',
      ),
    ]);
  }
}
