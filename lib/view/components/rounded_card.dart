import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/theme.dart';

Widget roundedCard({
  required BuildContext context,
  required WidgetRef ref,
  required List<Widget> body,
  bool isOrange = false,
}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    color: isOrange ? ColorKey.orange.value : Colors.white,
    elevation: 2,
    child: Container(
      margin: const EdgeInsets.all(10),
      //height: 400,
      child: Center(
        child: Column(children: body),
      ),
    ),
  );
}
