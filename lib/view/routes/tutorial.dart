import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/helper/config.dart';
import 'package:majimo_timer/model/helper/plugin/flutter_overboard-3.1.1/flutter_overboard.dart';
import 'package:majimo_timer/model/helper/plugin/flutter_overboard-3.1.1/src/overboard.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/view/home/root/body.dart';

class Tutorial extends ConsumerStatefulWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends ConsumerState<Tutorial> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          ref.read(generalState.notifier).runPush(
                context: context,
                page: const HomePage(),
                isReplace: true,
              );
        },
        finishCallback: () {
          ref.read(generalState.notifier).runPush(
                context: context,
                page: const HomePage(),
                isReplace: true,
              );
          ref.read(globalState.notifier).updateIsFirst(value: false);
        },
      ),
    );
  }

  final pages = [
    PageModel(
      color: ColorKey.orange.value,
      imageAssetPath: PathStore().appIcon,
      title: t.app_name.t,
      body: '${AppDataStore().versionStr} \n  >> Get started ! <<',
      doAnimateImage: true,
    ),
    PageModel.withChild(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Column(
          children: [
            const SizedBox.square(
              dimension: 300,
              child: Icon(
                Icons.alarm,
                color: Colors.white,
              ),
            ),
            Text(t.timer.t),
          ],
        ),
      ),
      color: ColorKey.blue.value,
      doAnimateChild: true,
    ),
    PageModel.withChild(
      child: const Padding(
        padding: EdgeInsets.only(bottom: 25),
        child: SizedBox.square(
          dimension: 300,
          child: Icon(Icons.alarm, color: Colors.white),
        ),
      ),
      color: ColorKey.red.value,
      doAnimateChild: true,
    ),
    PageModel.withChild(
      child: const Padding(
        padding: EdgeInsets.only(bottom: 25),
        child: SizedBox.square(
          dimension: 300,
          child: Icon(Icons.alarm, color: Colors.white),
        ),
      ),
      color: ColorKey.green.value,
      doAnimateChild: true,
    ),
  ];
}
