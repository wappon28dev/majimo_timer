import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Widget roundedCard({
  required BuildContext context,
  required WidgetRef ref,
  required List<Widget> body,
}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    color: Colors.white,
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
