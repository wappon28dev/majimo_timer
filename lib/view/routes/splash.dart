// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/helper/config.dart';
import 'package:majimo_timer/model/helper/notification.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/view/home/root/body.dart';
import 'package:rive/rive.dart';

class Splash extends ConsumerStatefulWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends ConsumerState<Splash> {
  @override
  void initState() {
    super.initState();
    navigate();
    NotificationManager().lateInitialize();
    Logger.i(' -- notification initialized ! -- ');
  }

  Future<void> navigate() async {
    await Future<void>.delayed(const Duration(milliseconds: 1500));
    ref.read(generalState.notifier).home();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Logger.i(MyTheme().get_theme(context: context, ref: ref).backgroundColor);

    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        height: double.infinity,
        color: MyTheme().get_theme(context: context, ref: ref).backgroundColor,
        child: ref.read(themeState.notifier).isLight(context: context)
            ? RiveAnimation.asset(PathStore().splashLight)
            : RiveAnimation.asset(PathStore().splashDark),
      ),
    );
  }
}
