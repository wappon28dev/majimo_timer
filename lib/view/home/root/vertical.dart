part of 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final show = ref.watch(generalState).showFAB;
  final colorScheme = Theme.of(context).colorScheme;
  // useEffect(() {
  //   LinkManager().initQuickAction(context: context, ref: ref);
  //   LinkManager().initDeepLinks(ref, context);
  //   return null;
  //
  //   // AwesomeNotifications().actionStream.listen((receivedNotification) {
  //   //   if (receivedNotification.channelKey == "basic_channel") {
  //   //     Logger.e("received!");
  //   //     Navigator.of(context).pushNamed(
  //   //       '/setting',
  //   //     );
  //   //   }
  //   // });
  // });

  // ignore: avoid_unnecessary_containers
  Widget headerWidget(BuildContext context) => ColoredBox(
        color: Theme.of(context).appBarTheme.backgroundColor!,
        child: Container(
          child: largeclock(context, ref, false),
        ),
      );

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
          children: button(context: context, ref: ref),
        ),
        const SizedBox(height: 20),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            primary: colorScheme.primary,
            onPrimary: colorScheme.onPrimary,
          ),
          onPressed: () => NotificationManager().test(),
          icon: const Icon(Icons.abc),
          label: const Text('test Device Notification'),
        ),
      ],
    );
  }

  Widget expand(BuildContext context) {
    final color = ref.watch(colorState).colorTween(context: context, ref: ref);
    final opacity = ref.watch(colorState).opacity;
    final path = ref.watch(colorState).picturePath(context: context, ref: ref);
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
          RouteManager.runPush(
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
        onPressed: () => RouteManager(context, ref).home2setting(),
        icon: const Icon(Icons.settings),
        color: Colors.white,
      ),
    ],
    headerWidget: headerWidget(context),
    headerBottomBar: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            RouteManager.runPush(
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
            RouteManager.runPush(
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
    floatingActionButton: show ? fab(context: context, ref: ref) : null,
  );
}
