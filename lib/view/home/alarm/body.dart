import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/theme.dart';
import '../model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AlarmPage extends HookWidget {
  const AlarmPage({Key? key}) : super(key: key);
  static getcolor(String colorname) => MyTheme.getcolor(colorname);

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final bool isLandscape = orientation == Orientation.landscape;
    final theme = useProvider(themeManager).theme;

    String tag = "alarm";
    return Material(
        color: Colors.transparent,
        child: Hero(
            tag: tag,
            child: DismissiblePage(
                onDismiss: () => Navigator.of(context).pop(),
                isFullScreen: true,
                child: !(isLandscape)
                    ? buildVertical(context)
                    : buildHorizontal(context))));
  }
}




// class AlarmPage extends HookWidget {
//   const AlarmPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     String tag = "alarm";

//     return Material(
//         color: Colors.transparent,
//         child: Hero(
//             tag: tag,
//             child: DismissiblePage(
//               onDismiss: () => Navigator.of(context).pop(),
//               isFullScreen: true,
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 child: Material(
//                   color: Colors.transparent,
//                   child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(Icons.alarm, color: Colors.white),
//                         Text(tag.tr(),
//                             style: const TextStyle(color: Colors.white)),
//                       ]),
//                 ),
//                 clipBehavior: Clip.antiAlias,
//                 decoration:
//                     const BoxDecoration(color: Color.fromRGBO(0, 163, 255, 1)),
//               ),
//             )));
//   }
// }
  