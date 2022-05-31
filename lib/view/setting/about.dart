import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/controller/controller.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/helper/config.dart';
import 'package:majimo_timer/model/helper/route.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/view/components/appbar.dart';
import 'package:majimo_timer/view/components/rounded_card.dart';

class AboutApp extends HookConsumerWidget {
  const AboutApp({Key? key}) : super(key: key);

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

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: MyTheme(context: context, ref: ref).lightTheme,
      darkTheme: MyTheme(context: context, ref: ref).darkTheme,
      themeMode: ref.read(themeState).themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                  onPressed: () => RouteManager().runURL(
                    ref: ref,
                    url: PathStore().privacyURL,
                  ),
                  icon: const Icon(Icons.launch),
                  label: Text(t.privacy_policy.t),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutAppTeam extends HookConsumerWidget {
  const AboutAppTeam({Key? key}) : super(key: key);

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
                  primary: Colors.white,
                  onPrimary: Colors.purple,
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
                onPressed: () => RouteManager().runURL(
                  ref: ref,
                  url: PathStore().meidenURL,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.purple,
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
                onPressed: () => RouteManager().runURL(
                  ref: ref,
                  url: PathStore().miscURL,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget developer() {
      final colorScheme = MyTheme(context: context, ref: ref).getColorScheme;
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
                  t.debugger.t,
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

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: MyTheme(context: context, ref: ref).lightTheme,
      darkTheme: MyTheme(context: context, ref: ref).darkTheme,
      themeMode: ref.read(themeState).themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
      ),
    );
  }
}
