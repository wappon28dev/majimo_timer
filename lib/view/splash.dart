import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:majimo_timer/view/home/body.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';

class AppSplashPage extends StatefulWidget {
  const AppSplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppSplashPageState();
}

class _AppSplashPageState extends State<AppSplashPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blueAccent,
            child: FlareActor(
              'assets/splash/splash.flr',
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: 'all',
              callback: (name) {
                //main.dartからのprovider of riverpod 例外が起きたぁ
                SchedulerBinding.instance?.addPostFrameCallback((_) {
                  Navigator.of(context).pushReplacementNamed("/home");
                });
              },
            )));
  }
}
