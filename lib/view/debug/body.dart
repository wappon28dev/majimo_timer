import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:majimo_timer/plugin/let_log.dart';

class Debug extends HookWidget {
  const Debug({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Logger();
  }
}
