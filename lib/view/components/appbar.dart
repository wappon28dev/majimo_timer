import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

AppBar commonAppbar({
  required BuildContext context,
  required WidgetRef ref,
  required String title,
  List<Widget>? actions,
}) {
  return AppBar(
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: AutoSizeText(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      maxLines: 1,
    ),
    actions: actions,
  );
}
