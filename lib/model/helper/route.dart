import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/notification.dart';
import 'package:majimo_timer/model/helper/plugin/circular_countdown_timer-0.2.0/circular_countdown_timer.dart';
import 'package:majimo_timer/model/helper/plugin/flutter_analog_clock/flutter_analog_clock.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/view/home/root/body.dart';
import 'package:majimo_timer/view/routes/splash.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> runURL({required String url}) async {
    await launch(url);
  }
}
