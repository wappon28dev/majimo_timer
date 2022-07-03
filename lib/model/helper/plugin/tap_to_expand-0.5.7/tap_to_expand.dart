import 'package:flutter/material.dart';

class TapToExpand extends StatefulWidget {
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
    this.isExpand,
    this.leading,
  });

  /// A parameter that is used to show the content of the widget.
  final Widget content;

  /// A parameter that is used to show the title of the widget.
  final Widget title;

  /// A parameter that is used to show the trailing widget.
  final Widget? trailing;

  /// A parameter that is used to set the color of the widget.
  final Color? color;
  final Color? iconColor;

  /// Used to set the color of the shadow.
  final List<BoxShadow>? boxShadow;

  /// Used to make the widget scrollable.
  final bool? scrollable;

  /// Used to set the height of the widget when it is closed.
  final double? closedHeight;

  /// Used to set the height of the widget when it is opened.
  final double? openedHeight;

  /// Used to set the duration of the animation.
  final Duration? duration;

  /// Used to set the padding of the widget when it is closed.
  final double? onTapPadding;

  /// Used to set the border radius of the widget.
  final double? borderRadius;

  /// Used to set the physics of the scrollable widget.
  final ScrollPhysics? scrollPhysics;

  /// a Parameter of expand elements
  final bool? isExpand;
  final Widget? leading;

  /// A constructor.
  @override
  _TapToExpandState createState() => _TapToExpandState();
}

class _TapToExpandState extends State<TapToExpand> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final scrollable = widget.scrollable ?? false;

    /// Used to make the widget clickable.
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        /// Changing the state of the widget.
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(
          /// Used to set the padding of the widget when it is closed.
          horizontal: isExpanded ? 25 : widget.onTapPadding ?? 10,
          vertical: 10,
        ),
        padding: const EdgeInsets.all(5),
        height:

            /// Used to set the height of the widget when it is closed and
            /// opened depends on the isExpanded parameter.
            isExpanded ? widget.closedHeight ?? 85 : widget.openedHeight ?? 250,
        curve: Curves.fastLinearToSlowEaseIn,
        duration: widget.duration ?? const Duration(milliseconds: 1200),
        decoration: BoxDecoration(
          /// Used to set the default value of the boxShadow parameter.
          boxShadow: widget.boxShadow ?? [],
          color: widget.color ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(isExpanded ? widget.borderRadius ?? 10 : 5),
          ),
        ),
        child: Column(
          children: [
            /// Creating a row with two widgets. The first widget is
            /// the title widget and the second widget is the trailing
            /// widget. If the trailing widget is null, then it will
            /// show an arrow icon.
            ListTile(
              title: widget.title,
              leading: widget.leading,
              trailing: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_up,
              ),
              subtitle: const Text('わあああ'),
            ),

            /// Used to show the content of the widget.
            SingleChildScrollView(
              child: AnimatedCrossFade(
                firstChild: const SizedBox(),
                secondChild: Padding(
                  padding: const EdgeInsets.all(10),
                  child: widget.content,
                ),
                crossFadeState: isExpanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,

                /// Used to set the duration of the animation.
                duration: widget.duration ?? const Duration(milliseconds: 1200),
                reverseDuration: Duration.zero,

                /// Used to set the curve of the animation.
                sizeCurve: Curves.fastLinearToSlowEaseIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
