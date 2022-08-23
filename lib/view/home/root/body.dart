import 'package:flutter/material.dart';
import 'package:flutter_color/src/helper.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:majimo_timer/controller/controller.dart';
import 'package:majimo_timer/model/helper/plugin/draggable_home/draggable_home.dart';
import 'package:majimo_timer/model/helper/plugin/flutter_analog_clock/flutter_analog_clock.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/helper/plugin/slide_digital_clock/slide_digital_clock.dart';
import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/view/components/button.dart';
import 'package:majimo_timer/view/debug/body.dart';
import 'package:majimo_timer/view/debug/widget.dart';
import 'package:majimo_timer/view/home/timer/modal.dart';
import 'package:majimo_timer/view/routes/transition.dart';
import 'package:majimo_timer/view/routes/tutorial.dart';
import 'package:majimo_timer/view/setting/body.dart';
import 'package:simple_animations/simple_animations.dart';

part 'horizontal.dart';
part 'vertical.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    useEffect(() {
      GlobalController.switchOverlayMode(value: false);
      return null;
    });

    return !isLandscape
        ? buildVertical(context, ref)
        : buildHorizontal(context);
  }
}

Widget analogclock({required BuildContext context, required WidgetRef ref}) {
  final isLight = ref.read(themeState.notifier).isLight(context: context);
  final showSec = ref.read(clockState).showSec;
  return FlutterAnalogClock(
    dialPlateColor: Colors.transparent,
    hourHandColor: isLight ? Colors.white : Colors.white.darker(20),
    minuteHandColor: isLight ? Colors.white : Colors.white.darker(20),
    secondHandColor: isLight ? Colors.white : Colors.white.darker(20),
    numberColor: Colors.white.darker(50),
    centerPointColor: isLight ? Colors.white : Colors.white.darker(20),
    borderWidth: 0,
    showSecondHand: showSec,
    showTicks: false,
  );
}

Widget fab({required BuildContext context, required WidgetRef ref}) {
  final colorScheme = Theme.of(context).colorScheme;

  return SizedBox(
    height: 80,
    width: 80,
    child: FloatingActionButton(
      heroTag: 'global',
      onPressed: () => RouteManager.runPush(
        context: context,
        page: const Tutorial(),
        isReplace: true,
      ),
      splashColor: colorScheme.shadow,
      backgroundColor: colorScheme.tertiary,
      child: Icon(
        Icons.accessibility_new_sharp,
        color: colorScheme.onTertiary,
      ),
    ),
  );
}
