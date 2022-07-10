import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TapToExpand extends HookConsumerWidget {
  const TapToExpand({
    super.key,
    required this.content,
    required this.title,
    this.color,
    this.iconColor,
    this.scrollable,
    this.closedHeight,
    this.openedHeight,
    this.boxShadow,
    this.duration,
    this.onTapPadding,
    this.borderRadius,
    this.scrollPhysics,
    this.trailing,
    this.leading,
  });

  final Widget content;
  final Widget title;
  final Widget? trailing;
  final Color? color;
  final Color? iconColor;
  final List<BoxShadow>? boxShadow;
  final bool? scrollable;
  final double? closedHeight;
  final double? openedHeight;
  final Duration? duration;
  final double? onTapPadding;
  final double? borderRadius;
  final ScrollPhysics? scrollPhysics;
  final Widget? leading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isExpanded = false;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        isExpanded = !isExpanded;
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(
          horizontal: isExpanded ? 25 : onTapPadding ?? 10,
          vertical: 10,
        ),
        padding: const EdgeInsets.all(5),
        height: isExpanded ? closedHeight ?? 85 : openedHeight ?? 150,
        curve: Curves.fastLinearToSlowEaseIn,
        duration: duration ?? const Duration(milliseconds: 1200),
        decoration: BoxDecoration(
          boxShadow: boxShadow ?? [],
          color: color ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(isExpanded ? borderRadius ?? 10 : 5),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: title,
                leading: leading,
                trailing: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                ),
                subtitle: const Text('わあああ'),
              ),
              AnimatedCrossFade(
                firstChild: const SizedBox(),
                secondChild: Padding(
                  padding: const EdgeInsets.all(10),
                  child: content,
                ),
                crossFadeState: isExpanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: duration ?? const Duration(milliseconds: 1200),
                reverseDuration: Duration.zero,
                sizeCurve: Curves.fastLinearToSlowEaseIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
