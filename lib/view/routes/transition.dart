import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/view/home/alarm/body.dart';
import 'package:majimo_timer/view/home/goal/body.dart';
import 'package:majimo_timer/view/home/timer/body.dart';
import 'package:majimo_timer/view/setting/body.dart';

class RouteManager {
  RouteManager(this.context, this.ref);
  BuildContext context;
  WidgetRef ref;

  void home2alarm() {
    context.pushTransparentRoute<void>(const AlarmPage());
    ref.read(alarmState.notifier).runInitialize();
    ref.read(generalState.notifier).runFAB();
  }

  void home2timer() {
    context.pushTransparentRoute<void>(const TimerPage());
    if (ref.read(timerState).canStart) {
      ref.read(generalState.notifier).runFAB();
    } else {
      ref.read(generalState.notifier).updateShowFAB(value: false);
    }
  }

  void home2goal() {
    context.pushTransparentRoute<void>(const GoalPage());
    ref.read(generalState.notifier).runFAB();
  }

  void home2setting() {
    runPush(context: context, page: const Setting(), isReplace: false);
  }

  static void runPush({
    required BuildContext context,
    required Widget page,
    required bool isReplace,
  }) =>
      !isReplace
          ? Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => page,
              ),
            )
          : Navigator.pushAndRemoveUntil<void>(
              context,
              MaterialPageRoute<void>(builder: (context) => page),
              (_) => false,
            );

  static Future<void> runURL({
    required String url,
  }) async {
    await launch(
      url,
      customTabsOption: CustomTabsOption(
        enableDefaultShare: true,
        enableInstantApps: true,
        enableUrlBarHiding: true,
        showPageTitle: true,
        animation: CustomTabsSystemAnimation.fade(),
      ),
      safariVCOption: const SafariViewControllerOption(
        barCollapsingEnabled: true,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
      ),
    );
  }

  static void runPop(BuildContext context) => Navigator.of(context).pop();
}
