import 'package:auto_size_text/auto_size_text.dart';
import 'package:flare_flutter/base/math/aabb.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:majimo_timer/model/pref.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:majimo_timer/view/setting/widget.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../main.dart';
import '../../model/theme.dart';
import '../setting/widget.dart';

class Setting extends HookConsumerWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thememanager = ref.read(themeManager);
    final theme = ref.read(themeManager).theme;
    final clockmanager = ref.read(clockManager);
    final langmanager = ref.read(langManager);
    final generalmanager = ref.read(generalManager);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ref.read(myTheme).lightTheme,
      darkTheme: ref.read(myTheme).darkTheme,
      themeMode: ref.read(themeManager).theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: appbar(context),
          body: SingleChildScrollView(
              child: Column(children: [
            const SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("　" + 'sec1'.tr(),
                      style: TextStyle(
                        color: ColorKey.orange.value,
                      )),
                ]),
            ListTile(
              title: Text('pref1'.tr()),
              subtitle: Text(langmanager.get()),
              leading: const Icon(Icons.language),
              onTap: () {
                dia1(context, ref);
              },
            ),
            ListTile(
              title: Text('pref2'.tr()),
              subtitle: Text(clockmanager.is24get()[0]),
              leading: Icon(clockmanager.is24get()[1]),
              onTap: () {
                dia2(context, ref);
              },
            ),
            ListTile(
              title: Text('pref3'.tr()),
              subtitle: Text(thememanager.get()[0]),
              leading: Icon(thememanager.get()[1]),
              onTap: () {
                dia3(context, ref);
              },
            ),
            ListTile(
              title: Text('pref4'.tr()),
              subtitle: Text(generalmanager.gettopToast()[0]),
              leading: Icon(generalmanager.gettopToast()[1]),
              onTap: () {
                dia4(context, ref);
              },
            ),
            ElevatedButton(
                onPressed: () {
                  PrefManager.allremove();
                  Logger.e("- from majimo_timer/lib/view/setting/body.dart \n" +
                      " >> ! SharedPreferences All Removed ! <<");
                  PrefManager.restore(ref, context);
                },
                child: const Text("all reset")),
          ]))),
    );
  }
}

AppBar appbar(BuildContext context) {
  return AppBar(
    leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        }),
    title: AutoSizeText('prefer'.tr(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        )),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    ),
  );
}
