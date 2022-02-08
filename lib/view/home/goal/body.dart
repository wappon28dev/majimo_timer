import 'dart:math';

import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:easy_localization/easy_localization.dart';

class GoalPage extends HookWidget {
  const GoalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tag = "goal";
    return Material(
        color: Colors.transparent,
        child: Hero(
            tag: tag,
            child: DismissiblePage(
                onDismiss: () => Navigator.of(context).pop(),
                isFullScreen: true,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Material(
                    color: Colors.transparent,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.alarm, color: Colors.white),
                          Text(tag.tr(),
                              style: const TextStyle(color: Colors.white)),
                        ]),
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(95, 216, 49, 1)),
                ))));
  }
}
