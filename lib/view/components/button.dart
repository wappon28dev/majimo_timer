import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/view/routes/transition.dart';

List<Widget> button({required BuildContext context, required WidgetRef ref}) {
  final width = MediaQuery.of(context).size.width;

  final array = [
    <String>['alarm', 'timer', 'goal'],
    <Color>[ColorKey.blue.value, ColorKey.red.value, ColorKey.green.value],
    <IconData>[Icons.alarm, Icons.hourglass_top, Icons.flag],
    <void Function()>[
      () => RouteManager(context, ref).home2alarm(),
      () => RouteManager(context, ref).home2timer(),
      () => RouteManager(context, ref).home2goal()
    ],
  ];
  final widgets = <Widget>[];

  for (var i = 0; i < array[0].length; i++) {
    final widget = GestureDetector(
      onTap: array[3][i] as void Function(),
      child: Hero(
        tag: array[0][i],
        child: Material(
          color: Colors.transparent,
          child: SizedBox.square(
            dimension: width / 3.6,
            child: Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: array[1][i] as Color,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(array[2][i] as IconData, color: Colors.white),
                  Text(
                    (array[0][i] as String).tr(),
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    widgets.add(widget);
  }

  return widgets;
}
