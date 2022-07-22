import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/controller/controller.dart';
import 'package:majimo_timer/model/helper/config.dart';
import 'package:majimo_timer/model/helper/notification.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/view/routes/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationManager().initialize();
  AwesomeNotifications()
      .actionStream
      .listen((ReceivedNotification receivedNotification) {});

  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ja', 'JP')],
      fallbackLocale: const Locale('en', 'US'),
      useOnlyLangCode: true,
      path: PathStore().translationJSON,
      // 追加するとなぜか動かない
      // assetLoader: JsonAssetLoader(),
      child: const ProviderScope(child: MyApp()),
    ),
  );
  GlobalController.switchOverlayMode(value: false);
  GlobalController.makeNavBarTransparent();
  Logger.i(' -- Start Majimo_Timer -- ');
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final light = ref.watch(themeState.notifier).lightTheme;
    final dark = ref.watch(themeState.notifier).darkTheme;
    final themeMode = ref.watch(themeState).themeMode;

    return BackGestureWidthTheme(
      backGestureWidth: BackGestureWidth.fraction(1 / 2),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: light,
        darkTheme: dark,
        themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        home: const Splash(),
      ),
    );
  }
}
