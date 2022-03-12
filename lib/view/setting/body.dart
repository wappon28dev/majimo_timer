import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/helper/config.dart';
import 'package:majimo_timer/model/helper/notification.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/helper/pref.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/view/setting/widget.dart';

class Setting extends HookConsumerWidget {
  const Setting({Key? key}) : super(key: key);

  Widget section(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '　$title',
          style: TextStyle(
            color: ColorKey.orange.value,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themestate = ref.watch(themeState);
    final clockstate = ref.watch(clockState);
    final langstate = ref.watch(langState);
    final generalstate = ref.watch(generalState);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: MyTheme().lightTheme,
      darkTheme: MyTheme().darkTheme,
      themeMode: ref.read(themeState).theme_value,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appbar(context: context, ref: ref),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              section(t.app_appearance.t),
              ListTile(
                title: Text(t.change_lang.t),
                subtitle: Text(langstate.lang_caption),
                leading: const Icon(Icons.language),
                onTap: () {
                  change_lang(context, ref);
                },
              ),
              ListTile(
                title: Text(t.app_theme.t),
                subtitle: Text(themestate.theme_caption),
                leading: Icon(themestate.theme_icon),
                onTap: () {
                  app_theme(context, ref);
                },
              ),
              section(t.clock_appearance.t),
              ListTile(
                title: Text(t.clock_style.t),
                subtitle: Text(clockstate.is24_caption),
                leading: Icon(clockstate.is24_icon),
                onTap: () {
                  clock_style(context, ref);
                },
              ),
              ListTile(
                title: Text(t.clock_seconds.t),
                subtitle: Text(clockstate.showSec_caption),
                leading: Icon(clockstate.showSec_icon),
                onTap: () {
                  clock_showSec(context, ref);
                },
              ),
              ListTile(
                title: Text(t.clock_animation.t),
                subtitle: Text(clockstate.animation_caption),
                leading: Icon(clockstate.animation_icon),
                onTap: () {
                  clock_animation(context, ref);
                },
              ),
              section(t.toast.t),
              ListTile(
                title: Text(t.toast_position.t),
                subtitle: Text(generalstate.topToast_caption),
                leading: Icon(generalstate.topToast_icon),
                onTap: () {
                  toast_position(context, ref);
                },
              ),
              ListTile(
                title: Text(t.toast_duration.t),
                subtitle: Text(generalstate.toastDuration_caption),
                leading: const Icon(Icons.timelapse),
                onTap: () {
                  toast_duration(context, ref);
                },
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.notifications_active_outlined),
                onPressed: () =>
                    ToastManager.toast(context: context, ref: ref, id: 0),
                label: const Text('test toast'),
              ),
              section(t.about.t),
              ListTile(
                title: Text('${t.app_name.t} β'),
                subtitle: Text(AppDataStore().versionStr),
                leading: const Icon(Icons.timelapse),
                onTap: () {
                  null;
                },
              ),
              ListTile(
                title: Text(t.change_log.t),
                subtitle: Text(t.change_log_sub.t),
                leading: const Icon(Icons.edit_note),
                onTap: () {
                  null;
                },
              ),
              ListTile(
                title: Text(t.app_maker.t),
                subtitle: Text(t.app_maker_sub.t),
                leading: const Icon(Icons.emoji_people),
                trailing: const Icon(Icons.launch),
                onTap: () {
                  null;
                },
              ),
              ListTile(
                title: Text(t.github.t),
                subtitle: Text(t.github_sub.t),
                leading: const Icon(Icons.receipt_long),
                trailing: const Icon(Icons.launch),
                onTap: () {
                  null;
                },
              ),
              ListTile(
                title: Text(t.license.t),
                subtitle: Text(t.license_sub.t),
                leading: const Icon(Icons.balance),
                trailing: const Icon(Icons.launch),
                onTap: () {
                  null;
                },
              ),
            ],
          ),
        ),
      ),
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
          PrefManager.allremove();
          Logger.e(
            '- from majimo_timer/lib/view/setting/body.dart \n'
            ' >> ! SharedPreferences All Removed ! <<',
          );
          PrefManager.restore(ref, context);
        },
        icon: const Icon(Icons.settings_backup_restore),
      )
    ],
  );
}
