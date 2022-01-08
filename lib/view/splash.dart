// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
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
  }

  Future<void> navigate() async {
    await Future<void>.delayed(const Duration(milliseconds: 1500));
    ref.read(generalManager.notifier).home();
    Navigator.of(context).pushReplacement(MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            height: double.infinity,
            color: ColorKey.orange.value,
            child: const RiveAnimation.asset('assets/splash/splash.riv')));
  }
}


                  // final alarmTK = ref.read(alarmTimeKeepingManager).alarmTK;
                  // Navigator.of(context).pushReplacement(MaterialPageRoute<void>(
                  //     builder: (BuildContext context) => const HomePage()));
                  // ref.read(generalManager.notifier).home();
