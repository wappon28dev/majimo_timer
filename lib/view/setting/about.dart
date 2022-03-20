import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/helper/config.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/helper/pref.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/model/helper/translations.dart';

class AboutApp {
  void about(BuildContext context) {
    return showAboutDialog(
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
}

class AboutDeveloper extends HookConsumerWidget {
  const AboutDeveloper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 180,
                width: size.width,
                color: Colors.red,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Container(
                    width: 1580,
                    height: 1580,
                    decoration: const BoxDecoration(
                      color: Colors.purple,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      t.app_maker.t,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width / 2.5,
                          height: size.width / 2.5,
                          child: Image.asset('assets/me.png'),
                        ),
                        const Divider(
                          thickness: 2,
                          color: Colors.black,
                          height: 2,
                        ),
                        Column(
                          children: const [
                            Text('wappon_28_dev'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'デバッガー',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width / 2.5,
                          height: size.width / 2.5,
                          child: Image.asset('assets/me.png'),
                        ),
                        const Divider(
                          thickness: 2,
                          color: Colors.black,
                          height: 2,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Center(child: Text('wappon_28_dev')),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
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
        t.prefer.t,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            PrefManager().allremove();
            Logger.e(
              '- from majimo_timer/lib/view/setting/body.dart \n'
              ' >> ! SharedPreferences All Removed ! <<',
            );
            PrefManager().restore(ref, context);
          },
          icon: const Icon(Icons.settings_backup_restore),
        )
      ],
    );
  }
}
