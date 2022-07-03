import 'package:auto_size_text/auto_size_text.dart';
import 'package:flag/flag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/config.dart';
import 'package:majimo_timer/model/helper/notification.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/helper/plugin/slide_digital_clock/slide_digital_clock.dart';
import 'package:majimo_timer/model/helper/pref.dart';

import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/view/components/appbar.dart';
import 'package:majimo_timer/view/components/modal.dart';
import 'package:majimo_timer/view/routes/transition.dart';
import 'package:majimo_timer/view/setting/about.dart';

part 'widget.dart';

class Setting extends HookConsumerWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themestate = ref.watch(themeState);
    final clockstate = ref.watch(clockState);
    final langstate = ref.watch(langState);
    final generalstate = ref.watch(generalState);
    final colorScheme = Theme.of(context).colorScheme;

    Widget section(String title) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '　$title',
            style: TextStyle(
              color: colorScheme.primary,
            ),
          ),
        ],
      );
    }

    List<Widget> actions() => <Widget>[
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
          ),
        ];

    return Scaffold(
      appBar: commonAppbar(
        context: context,
        ref: ref,
        title: t.prefer.t,
        actions: actions(),
      ),
      body: CupertinoScrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              section(t.app_appearance.t),
              ListTile(
                title: Text(t.change_lang.t),
                subtitle: Text(langstate.langCaption),
                leading: const Icon(Icons.language),
                onTap: () => change_lang(context, ref),
              ),
              ListTile(
                title: Text(t.app_theme.t),
                subtitle: Text(themestate.themeCaption),
                leading: Icon(themestate.themeIcon),
                onTap: () => app_theme(context, ref),
              ),
              ListTile(
                title: Text(t.app_seed_color.t),
                subtitle: Text(
                  themestate.seedColorCaption,
                  style: TextStyle(color: themestate.seedColor),
                ),
                leading: const Icon(Icons.palette_outlined),
                onTap: () => app_seed_color(context, ref),
              ),
              section(t.clock_appearance.t),
              ListTile(
                title: Text(t.clock_style.t),
                subtitle: Text(clockstate.is24Caption),
                leading: Icon(clockstate.is24Icon),
                onTap: () => clock_style(context, ref),
              ),
              ListTile(
                title: Text(t.clock_seconds.t),
                subtitle: Text(clockstate.showSecCaption),
                leading: Icon(clockstate.showSecIcon),
                onTap: () => clock_showSec(context, ref),
              ),
              ListTile(
                title: Text(t.clock_animation.t),
                subtitle: Text(clockstate.animationCaption),
                leading: Icon(clockstate.animationIcon),
                onTap: () => clock_animation(context, ref),
              ),
              section(t.toast.t),
              ListTile(
                title: Text(t.toast_position.t),
                subtitle: Text(generalstate.topToastCaption),
                leading: Icon(generalstate.topToastIcon),
                onTap: () => toast_position(context, ref),
              ),
              ListTile(
                title: Text(t.toast_duration.t),
                subtitle: Text(generalstate.toastDurationCaption),
                leading: const Icon(Icons.timelapse),
                onTap: () => toast_duration(context, ref),
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.notifications_active_outlined),
                onPressed: () =>
                    ToastManager().toast(context: context, ref: ref, id: 0),
                label: const Text('test toast'),
              ),
              section(t.notification.t),
              const SizedBox(height: 20),
              section(t.about.t),
              ListTile(
                title: Text('${t.app_name.t} - ${t.beta.t}'),
                subtitle: Text(AppDataStore().versionStr),
                leading: const Icon(Icons.info_outline),
                onTap: () => RouteManager(context, ref).runPush(
                  page: const AboutApp(),
                  isReplace: false,
                ),
              ),
              ListTile(
                title: Text(t.change_log.t),
                subtitle: Text(t.change_log_sub.t),
                leading: const Icon(Icons.edit_note),
                enabled: false,
              ),
              ListTile(
                title: Text(t.about_app_team.t),
                subtitle: Text(t.about_app_team_sub.t),
                leading: const Icon(Icons.emoji_people),
                onTap: () => RouteManager(context, ref).runPush(
                  page: const AboutAppTeam(),
                  isReplace: false,
                ),
              ),
              ListTile(
                title: Text(t.github.t),
                subtitle: Text(t.github_sub.t),
                leading: const Icon(Icons.receipt_long),
                trailing: const Icon(Icons.launch),
                onTap: () => RouteManager(context, ref).runURL(
                  url: PathStore().githubURL,
                ),
              ),
              ListTile(
                title: Text(t.license.t),
                subtitle: Text(t.license_sub.t),
                leading: const Icon(Icons.balance),
                trailing: const Icon(Icons.launch),
                onTap: () => RouteManager(context, ref).runURL(
                  url: PathStore().licenseURL,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
