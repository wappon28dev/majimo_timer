import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:majimo_timer/model/notification.dart';
import 'package:majimo_timer/model/pref.dart';
import 'package:majimo_timer/model/translations.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:majimo_timer/view/setting/widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/vm/viewmodel.dart';
import '../../main.dart';
import '../../model/theme.dart';
import '../setting/widget.dart';

class Setting extends HookConsumerWidget {
  const Setting({Key? key}) : super(key: key);

  Widget section(String title) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('　$title',
              style: TextStyle(
                color: ColorKey.orange.value,
              )),
        ]);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thememanager = ref.watch(themeManager);
    final theme = ref.watch(themeManager).theme;
    final clockmanager = ref.watch(clockManager);
    final langmanager = ref.watch(langManager);
    final generalmanager = ref.watch(generalManager);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ref.read(myTheme).lightTheme,
      darkTheme: ref.read(myTheme).darkTheme,
      themeMode: ThemeManagerVM(ref.read).themeMode_value,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: appbar(context: context, ref: ref),
          body: SingleChildScrollView(
              child: Column(children: [
            const SizedBox(height: 10),
            section(t.app_appearance.t),
            ListTile(
              title: Text(t.change_lang.t),
              subtitle: Text(LangManagerVM().lang_caption),
              leading: const Icon(Icons.language),
              onTap: () {
                change_lang(context, ref);
              },
            ),
            ListTile(
              title: Text(t.app_theme.t),
              subtitle: Text(ThemeManagerVM(ref.read).themeMode_caption),
              leading: Icon(ThemeManagerVM(ref.read).themeMode_icon),
              onTap: () {
                app_theme(context, ref);
              },
            ),
            section(t.clock_appearance.t),
            ListTile(
              title: Text(t.clock_style.t),
              subtitle: Text(ClockManagerVM().is24_caption),
              leading: Icon(ClockManagerVM().is24_icon),
              onTap: () {
                clock_style(context, ref);
              },
            ),
            ListTile(
              title: Text(t.clock_seconds.t),
              subtitle: Text(ClockManagerVM().showSec_caption),
              leading: Icon(ClockManagerVM().showSec_icon),
              onTap: () {
                clock_showSec(context, ref);
              },
            ),
            ListTile(
              title: Text(t.clock_animation.t),
              subtitle: Text(ClockManagerVM().animation_caption),
              leading: Icon(ClockManagerVM().animation_icon),
              onTap: () {
                clock_animation(context, ref);
              },
            ),
            section(t.toast.t),
            ListTile(
              title: Text(t.toast_position.t),
              subtitle: Text(GeneralManagerVM().topToast_caption),
              leading: Icon(GeneralManagerVM().topToast_icon),
              onTap: () {
                toast_position(context, ref);
              },
            ),
            ListTile(
              title: Text(t.toast_duration.t),
              subtitle: Text(GeneralManagerVM().toastDuration_caption),
              leading: const Icon(Icons.timelapse),
              onTap: () {
                toast_duration(context, ref);
              },
            ),
            OutlinedButton.icon(
                icon: const Icon(Icons.notifications_active_outlined),
                onPressed: () =>
                    ToastManager.toast(context: context, ref: ref, id: 0),
                label: const Text("test toast")),
          ]))),
    );
  }
}

AppBar appbar({required BuildContext context, required WidgetRef ref}) {
  return AppBar(
    centerTitle: true,
    leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        }),
    title: AutoSizeText(t.prefer.t,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        maxLines: 1),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {
            PrefManager.allremove();
            Logger.e("- from majimo_timer/lib/view/setting/body.dart \n" +
                " >> ! SharedPreferences All Removed ! <<");
            PrefManager.restore(ref, context);
          },
          icon: const Icon(Icons.settings_backup_restore))
    ],
  );
}
