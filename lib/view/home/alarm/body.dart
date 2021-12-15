import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/theme.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'widget.dart' as a;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AlarmPage extends HookConsumerWidget {
  const AlarmPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;
    String tag = "alarm";

    return Material(
        color: Colors.transparent,
        child: Hero(
            tag: tag,
            child: DismissiblePage(
                onDismiss: () => Navigator.of(context).pop(),
                isFullScreen: true,
                child: !(isLandscape)
                    ? a.buildVertical(context, ref)
                    : a.buildHorizontal(context))));
  }
}
