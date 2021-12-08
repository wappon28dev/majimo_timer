import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ezanimation/ezanimation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import '../../../../main.dart';

class AlarmTimeKeepingPage extends HookConsumerWidget {
  const AlarmTimeKeepingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;

    return Material(
        color: Colors.transparent,
        child: !(isLandscape)
            ? buildVertical(context, ref)
            : buildHorizontal(context));
  }
}

Widget buildVertical(BuildContext context, WidgetRef ref) {
  return Container(
    alignment: Alignment.center,
    color: Colors.blue,
    child: const Text("縦", style: TextStyle(fontSize: 32)),
  );
}

Widget buildHorizontal(BuildContext context) {
  return Container(
    alignment: Alignment.center,
    color: Colors.blue,
    child: const Text("ヨコ", style: TextStyle(fontSize: 32)),
  );
}
