import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/state.dart';

class RouteManager {
  void runPush({
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

  Future<void> runURL({
    required WidgetRef ref,
    required String url,
  }) async {
    final color = ref.read(themeState).seedColor;
    await launch(
      url,
      customTabsOption: CustomTabsOption(
        toolbarColor: color,
        enableDefaultShare: true,
        enableInstantApps: true,
        enableUrlBarHiding: true,
        showPageTitle: true,
        animation: CustomTabsSystemAnimation.fade(),
      ),
      safariVCOption: SafariViewControllerOption(
        preferredBarTintColor: color,
        barCollapsingEnabled: true,
        dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
      ),
    );
  }
}
