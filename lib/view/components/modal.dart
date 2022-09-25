import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color/src/helper.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<dynamic> showModal(
  BuildContext context,
  WidgetRef ref,
  IconData icon,
  String title,
  String subtitle,
  List<Widget> widget,
) {
  const padding = EdgeInsets.only(bottom: 15, left: 15, right: 15, top: 8);
  final header = <Widget>[
    Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 3),
          width: 35,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[400],
          ),
        ),
        const SizedBox(height: 10),
        Icon(icon),
        const SizedBox(height: 8),
        AutoSizeText(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
          minFontSize: 20,
          maxLines: 1,
        ),
        const SizedBox(height: 5),
        AutoSizeText(
          subtitle,
          maxLines: 1,
          minFontSize: 10,
        ),
        const SizedBox(height: 5),
        const Divider(thickness: 2),
      ],
    )
  ];
  final bottom = <Widget>[];
  return showCupertinoModalBottomSheet<dynamic>(
    context: context,
    barrierColor: Colors.black54,
    duration: const Duration(milliseconds: 300),
    topRadius: const Radius.circular(20),
    animationCurve: Curves.easeOutQuint,
    builder: (context) => SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: Material(
        child: Ink(
          padding: padding,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(children: header + widget + bottom),
        ),
      ),
    ),
  );
}

Future<dynamic> numberPad({
  required BuildContext context,
  required WidgetRef ref,
}) {
  var padNumList = <String>['0', '0', '0', '0'];
  var latestDigit = 0;

  final pad = <Widget>[
    Text(
      '${padNumList[0]}${padNumList[1]}:${padNumList[2]}${padNumList[3]}',
      style: const TextStyle(
        fontSize: 70,
        fontFamily: 'M-plus-B',
      ),
    ),
    SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: GridButton(
          borderColor: Colors.transparent,
          borderWidth: 2,
          textStyle: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
          onPressed: (dynamic val) {
            padNumList.insert(latestDigit, val.toString());
            latestDigit++;
          },
          items: const [
            [
              GridButtonItem(title: '1'),
              GridButtonItem(title: '2'),
              GridButtonItem(title: '3'),
            ],
            [
              GridButtonItem(title: '4'),
              GridButtonItem(title: '5'),
              GridButtonItem(title: '6'),
            ],
            [
              GridButtonItem(title: '7'),
              GridButtonItem(title: '8'),
              GridButtonItem(title: '9'),
            ],
            [
              GridButtonItem(title: '00'),
              GridButtonItem(title: '0'),
              GridButtonItem(title: 'c', child: Icon(Icons.check)),
            ],
          ],
        ),
      ),
    ),
  ];

  return showModal(context, ref, Icons.add_alarm, '時間を入力しよう', 'わあ', pad);
}
