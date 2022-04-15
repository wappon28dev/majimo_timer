import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/helper/config.dart';
import 'package:majimo_timer/model/helper/route.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/model/helper/translations.dart';

class AboutApp {
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
}

class AboutAppTeam extends HookConsumerWidget {
  const AboutAppTeam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    Widget schoolHeader() {
      final size = MediaQuery.of(context).size;

      return Container(
        height: 270,
        width: size.width,
        color: Colors.purple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(PathStore().meidenLogo, height: 100),
            ),
            const Text(
              '  主なメンバーの所属校：\n愛知工業大学名電高等学校・情報システム部',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: CupertinoScrollbar(
                scrollbarOrientation: ScrollbarOrientation.bottom,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.purple,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.all(10),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.language, color: Colors.purple),
                            SizedBox(width: 10),
                            Text(
                              '学校公式HP',
                              style: TextStyle(color: Colors.purple),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.launch, color: Colors.purple),
                          ],
                        ),
                        onPressed: () =>
                            RouteManager().runURL(url: PathStore().meidenURL),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.purple,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.all(10),
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.language, color: Colors.purple),
                            SizedBox(width: 5),
                            Text(
                              '情報システム部',
                              style: TextStyle(color: Colors.purple),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.launch, color: Colors.purple),
                          ],
                        ),
                        onPressed: () =>
                            RouteManager().runURL(url: PathStore().miscURL),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget developer() {
      return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width / 3,
                    height: size.width / 3,
                    child: Image.asset('assets/images/me.png'),
                  ),
                  const Text(
                    'wappon_28_dev',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget debugger() {
      List<Widget> listWidget() {
        final iterableWidget = AppTeam().debuggers.entries.map((entry) {
          final widgets = <Widget>[
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                entry.key,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 50,
                child: Image.asset(entry.value),
              ),
            ),
            const SizedBox(height: 10),
          ];
          return widgets.toList();
        });
        return iterableWidget.toList().expand((element) => element).toList();
      }

      return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
        ),
      );
    }

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: MyTheme().lightTheme,
      darkTheme: MyTheme().darkTheme,
      themeMode: ref.read(themeState).themeMode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appbar(context: context, ref: ref),
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
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: debugger(),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar appbar({required BuildContext context, required WidgetRef ref}) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: AutoSizeText(
        t.about_app_team.t,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
      ),
    );
  }
}
