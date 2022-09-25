import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/config.dart';

import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/view/components/appbar.dart';
import 'package:majimo_timer/view/components/rounded_card.dart';
import 'package:majimo_timer/view/routes/transition.dart';

class AboutApp extends HookConsumerWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void about(BuildContext context) => showAboutDialog(
          context: context,
          applicationVersion: AppDataStore().versionStr,
          applicationIcon: SizedBox(
            height: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.asset(PathStore().appIcon),
            ),
          ),
          applicationName: t.app_name.t,
          applicationLegalese:
              'This application has been approved for all audiences.',
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('ここにアプリの説明、概要などを表示させます。'),
            ),
          ],
        );

    return Scaffold(
      appBar: commonAppbar(context: context, ref: ref, title: t.about.t),
      body: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: roundedCard(
                  context: context,
                  ref: ref,
                  isOrange: true,
                  body: <Widget>[
                    Image.asset(PathStore().appIcon),
                    Text(
                      AppDataStore().versionStr,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => about(context),
                icon: const Icon(Icons.info_outline),
                label: Text(t.about.t),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutAppTeam extends HookConsumerWidget {
  const AboutAppTeam({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final isLight = ref.read(themeState.notifier).isLight(context: context);

    Widget schoolHeader() {
      return Container(
        width: size.width,
        color: isLight ? Colors.purple : Colors.purple.shade700,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(PathStore().meidenLogo, height: 100),
            ),
            Text(
              '  ${t.about_member_0.t}'
              '\n${t.about_member_1.t}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.purple,
                  backgroundColor: Colors.white,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.all(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.language, color: Colors.purple),
                    const SizedBox(width: 25),
                    Text(
                      t.hp_0.t,
                      style: const TextStyle(color: Colors.purple),
                    ),
                    const SizedBox(width: 25),
                    const Icon(Icons.launch, color: Colors.purple),
                  ],
                ),
                onPressed: () =>
                    RouteManager.runURL(url: PathStore().meidenURL),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.purple,
                  backgroundColor: Colors.white,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.all(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.language, color: Colors.purple),
                    const SizedBox(width: 1),
                    Text(
                      t.hp_1.t,
                      style: const TextStyle(color: Colors.purple),
                    ),
                    const SizedBox(width: 1),
                    const Icon(Icons.launch, color: Colors.purple),
                  ],
                ),
                onPressed: () => RouteManager.runURL(url: PathStore().miscURL),
              ),
            ),
          ],
        ),
      );
    }

    Widget developer() {
      final colorScheme = Theme.of(context).colorScheme;
      return Card(
        elevation: 0,
        color: colorScheme.tertiaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: colorScheme.tertiary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                t.developer.t,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    'assets/images/me.png',
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'wappon_28_dev',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );
    }

    Widget tester() {
      List<Widget> listWidget() {
        final iterableWidget = AppTeam().debuggers.entries.map((entry) {
          final widgets = <Widget>[
            ListTile(
              title: Text(entry.key),
              subtitle: const Text('caption'),
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.asset(entry.value),
                ),
              ),
            ),
          ];
          return widgets.toList();
        });
        return iterableWidget.toList().expand((element) => element).toList();
      }

      return Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
                const SizedBox(height: 10),
                Text(
                  t.tester.t,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
              ] +
              listWidget(),
        ),
      );
    }

    return Scaffold(
      appBar: commonAppbar(
        context: context,
        ref: ref,
        title: t.about_app_team.t,
      ),
      body: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              schoolHeader(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: developer(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: tester(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
