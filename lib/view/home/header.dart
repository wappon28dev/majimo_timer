import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../main.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import './widget.dart';
import '/model/theme.dart';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';

Widget lap(BuildContext context) {
  return Column(
    children: [
      Row(
        // 中央寄せ
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox.square(
            dimension: 100,
            child: Container(
              margin: EdgeInsets.all(2.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: MyTheme.getcolor("blue")),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Icon(Icons.alarm, color: Colors.white),
                Text('1st'.tr(), style: const TextStyle(color: Colors.white)),
              ]),
            ),
          ),
          SizedBox.square(
            dimension: 100,
            child: Container(
              margin: EdgeInsets.all(2.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: MyTheme.getcolor("red")),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Icon(Icons.alarm, color: Colors.white),
                Text('2nd'.tr(), style: const TextStyle(color: Colors.white)),
              ]),
            ),
          ),
          SizedBox.square(
            dimension: 100,
            child: Container(
              margin: EdgeInsets.all(2.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: MyTheme.getcolor("green")),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                const Icon(Icons.alarm, color: Colors.white),
                AutoSizeText('3rd'.tr(),
                    maxLines: 1, style: const TextStyle(color: Colors.white)),
              ]),
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      TextButton(
          onPressed: () {
            context.read(clockChanger).is24changer(true);
          },
          child: const Text("24hmode")),
      TextButton(
          onPressed: () {
            context.read(clockChanger).is24changer(false);
          },
          child: const Text("12hmode")),
      listView(),
    ],
  );
}
