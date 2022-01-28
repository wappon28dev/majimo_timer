import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/helper/plugin/flutter_overboard-3.1.1/flutter_overboard.dart';
import 'package:majimo_timer/helper/plugin/flutter_overboard-3.1.1/src/overboard.dart';
import 'package:majimo_timer/helper/theme.dart';
import 'package:majimo_timer/helper/translations.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/view/home/root/body.dart';

class Tutorial extends ConsumerStatefulWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends ConsumerState<Tutorial> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          _globalKey.currentState?.showSnackBar(const SnackBar(
            content: Text('Skip clicked'),
          ));
        },
        finishCallback: () {
          _globalKey.currentState?.showSnackBar(const SnackBar(
            content: Text('Finish clicked'),
          ));
          ref
              .read(generalState.notifier)
              .push_replace(context: context, page: const HomePage());
          ref.read(globalState.notifier).change_isFirst(value: false);
        },
      ),
    );
  }

  final pages = [
    PageModel(
      color: ColorKey.orange.value,
      imageAssetPath: 'assets/me.png',
      title: 'Majimo-Timer',
      body: '- OSS light study-timer - \n  >> Get started ! <<',
      doAnimateImage: true,
    ),
    PageModel.withChild(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: Column(children: [
            const SizedBox.square(
                dimension: 300, child: Icon(Icons.alarm, color: Colors.white)),
            Text(t.timer.t)
          ]),
        ),
        color: ColorKey.blue.value,
        doAnimateChild: true),
    PageModel.withChild(
        child: const Padding(
          padding: EdgeInsets.only(bottom: 25),
          child: SizedBox.square(
              dimension: 300, child: Icon(Icons.alarm, color: Colors.white)),
        ),
        color: ColorKey.red.value,
        doAnimateChild: true),
    PageModel.withChild(
        child: const Padding(
          padding: EdgeInsets.only(bottom: 25),
          child: SizedBox.square(
              dimension: 300, child: Icon(Icons.alarm, color: Colors.white)),
        ),
        color: ColorKey.green.value,
        doAnimateChild: true),
  ];
}
