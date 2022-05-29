part of 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final width = MediaQuery.of(context).size.width;
  final show = ref.watch(generalState).showFAB;
  useEffect(() {
    LinkManager().initQuickAction(context: context, ref: ref);
    LinkManager().initDeepLinks(ref, context);
    return null;

    // AwesomeNotifications().actionStream.listen((receivedNotification) {
    //   if (receivedNotification.channelKey == "basic_channel") {
    //     Logger.e("received!");
    //     Navigator.of(context).pushNamed(
    //       '/setting',
    //     );
    //   }
    // });
  });

  // ignore: avoid_unnecessary_containers
  Container headerWidget(BuildContext context) => Container(
        child: Container(child: largeclock(context, ref, false)),
      );

  Widget button({required String tag}) {
    late Color value;
    switch (tag) {
      case 'alarm':
        value = ColorKey.blue.value;
        break;
      case 'timer':
        value = ColorKey.red.value;
        break;
      case 'goal':
        value = ColorKey.green.value;
        break;
    }

    /// ```
    ///  int mode 0 => define onTap()
    ///           1 => return Color
    ///           2 => return Icon
    /// ```
    dynamic func({required int mode}) {
      switch (mode) {
        case 0:
          switch (tag) {
            case 'alarm':
              context.pushTransparentRoute(const AlarmPage());
              ref.read(alarmState.notifier).runInitialize();
              ref.read(generalState.notifier).runFAB();

              break;
            case 'timer':
              context.pushTransparentRoute(const TimerPage());
              if (ref.read(timerState).canStart) {
                ref.read(generalState.notifier).runFAB();
              } else {
                ref.read(generalState.notifier).updateShowFAB(value: false);
              }
              break;
            case 'goal':
              context.pushTransparentRoute(const GoalPage());
              ref.read(generalState.notifier).runFAB();

              break;
          }
          break;
        case 1:
          switch (tag) {
            case 'alarm':
              return Icons.alarm;
            case 'timer':
              return Icons.hourglass_top;
            case 'goal':
              return Icons.flag;
          }
          break;
        default:
          throw Exception('error!');
      }
    }

    return GestureDetector(
      onTap: () => func(mode: 0),
      child: Hero(
        tag: tag,
        child: Material(
          color: Colors.transparent,
          child: SizedBox.square(
            dimension: width / 3.6,
            child: Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: value,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(func(mode: 1) as IconData, color: Colors.white),
                  Text(
                    tag.tr(),
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget content() {
    return Column(
      children: [
        AnimatedOpacity(
          opacity: ref.read(generalState).opacity,
          duration: const Duration(milliseconds: 300),
          child: Text(
            ref.read(generalState).status,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            button(tag: 'alarm'),
            button(tag: 'timer'),
            button(tag: 'goal'),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: getColorScheme(ref: ref, context: context).primary,
            onPrimary: getColorScheme(ref: ref, context: context).onPrimary,
          ),
          onPressed: () => NotificationManager().alarmFinish(
            target: DateTime.now().add(
              const Duration(seconds: 5),
            ),
          ),
          icon: const Icon(Icons.abc),
          label: const Text('test Device Notification'),
        ),
      ],
    );
  }

  Widget expand(BuildContext context) {
    final color = ref.read(colorState).colorTween(context: context, ref: ref);
    final opacity = ref.watch(colorState).opacity;
    final path = ref.read(colorState).picturePath(context: context, ref: ref);
    return PlayAnimation<Color?>(
      tween: color,
      builder: (context, child, value) {
        return Container(
          alignment: Alignment.center,
          color: value,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedOpacity(
                    opacity: opacity,
                    duration: const Duration(seconds: 1),
                    child: Lottie.asset(path),
                  ),
                ],
              ),
              AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(seconds: 1),
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: analogclock(context: context, ref: ref),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  largeclock(context, ref, true, true),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  return DraggableHome(
    title: Text(
      t.app_name.t,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {
          RouteManager()
              .runPush(context: context, page: const Debug(), isReplace: false);
          Logger.e(
            '- from majimo_timer/lib/view/home/root/widget.dart \n'
            ' > debug page opened',
          );
        },
        icon: const Icon(Icons.developer_mode),
        color: Colors.white,
      ),
      IconButton(
        onPressed: () => RouteManager()
            .runPush(context: context, page: const Setting(), isReplace: false),
        icon: const Icon(Icons.settings),
        color: Colors.white,
      ),
    ],
    headerWidget: headerWidget(context),
    headerBottomBar: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            RouteManager().runPush(
              context: context,
              page: const Debug(),
              isReplace: false,
            );
            Logger.e(
              '- from majimo_timer/lib/view/home/root/widget.dart \n'
              ' > debug page opened',
            );
          },
          icon: const Icon(Icons.developer_mode),
          color: Colors.white,
        ),
        IconButton(
          onPressed: () {
            RouteManager().runPush(
              context: context,
              page: const Setting(),
              isReplace: false,
            );
          },
          icon: const Icon(Icons.settings),
          color: Colors.white,
        ),
      ],
    ),
    body: [content(), debug(context: context, ref: ref)],
    fullyStretchable: true,
    expandedBody: expand(context),
    backgroundColor: MyTheme().getBackgroundColor(context: context, ref: ref),
    floatingActionButton: show ? fab(context: context, ref: ref) : null,
  );
}
