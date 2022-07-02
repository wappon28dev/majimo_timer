part of 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final width = MediaQuery.of(context).size.width;

  Widget content() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: width * 0.9,
              alignment: Alignment.center,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  analogclockTimekeeping(context: context, ref: ref),
                  largeclock(context, ref, true, true),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(ref.read(goalState).goal),
            Text(ref.read(goalTKState).startedTime.toString()),
            Text(ref.watch(goalTKState).diff(ref: ref).toString()),
          ],
        ),
      ),
    );
  }

  return Scaffold(
    body: SafeArea(child: content()),
    appBar: appbar(context: context, ref: ref),
  );
}

AppBar appbar({required BuildContext context, required WidgetRef ref}) {
  return AppBar(
    centerTitle: true,
    leading: PlayAnimation(
      tween: Tween<double>(begin: 0, end: 1),
      delay: const Duration(milliseconds: 5900),
      duration: const Duration(milliseconds: 300),
      builder: (context, child, value) {
        return Opacity(
          opacity: value! as double,
          child: IconButton(
            icon: const Icon(Icons.alarm),
            onPressed: () {},
            enableFeedback: false,
          ),
        );
      },
    ),
    title: AnimatedOpacity(
      opacity: ref.watch(generalState).opacity,
      duration: const Duration(milliseconds: 300),
      child: AutoSizeText(
        ref.watch(generalState).status,
        style: const TextStyle(fontWeight: FontWeight.bold),
        maxLines: 1,
      ),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    ),
    backgroundColor: Colors.red,
  );
}
