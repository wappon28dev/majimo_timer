// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/config.dart';
import 'package:majimo_timer/model/helper/notification.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/helper/pref.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/view/home/root/body.dart';
import 'package:rive/rive.dart';

class Splash extends ConsumerStatefulWidget {
  const Splash({super.key});
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
    ref.read(generalState.notifier).whenHome();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    Logger.i(backgroundColor.toString());

    PrefManager().restore(ref, context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        height: double.infinity,
        color: backgroundColor,
        child: ref.read(themeState.notifier).isLight(context: context)
            ? RiveAnimation.asset(PathStore().splashLight)
            : RiveAnimation.asset(PathStore().splashDark),
      ),
    );
  }
}
