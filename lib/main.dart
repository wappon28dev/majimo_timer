import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:majimo_timer/view/debug/body.dart';
import 'package:majimo_timer/view/setting/body.dart';
import 'package:majimo_timer/view/splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:workmanager/workmanager.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'model/app_link.dart';
import 'model/notification.dart';
import 'model/work.dart';
import 'plugin/let_log/let_log.dart';
import 'model/manager.dart';
import 'model/theme.dart';
import 'model/pref.dart';
import 'view/home/root/body.dart';
import 'package:app_links/app_links.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

//global
final themeManager = ChangeNotifierProvider((ref) => ThemeManager());
final clockManager = ChangeNotifierProvider((ref) => ClockManager());
final langManager = ChangeNotifierProvider((ref) => LangManager());
final colorManager = ChangeNotifierProvider((ref) => ColorManager());
final alarmManager = ChangeNotifierProvider((ref) => AlarmManager());
const int helloAlarmID = 0;

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    Logger.i("are you hear?");
    NotificationManager.background();

    return Future.value(true);
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  NotificationManager.initialize();
  Workmanager().initialize(
      callbackDispatcher, // The top level function, aka callbackDispatcher
      isInDebugMode:
          true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
      );
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('ja', 'JP')],
    fallbackLocale: const Locale('en', 'US'),
    path: 'assets/translations/langs.csv',
    assetLoader: CsvAssetLoader(),
    child: const ProviderScope(child: MyApp()),
  ));
  Logger.i(" -- Start Majimo_Timer -- ");
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      PrefManager.restore(ref, context);
    });
    return BackGestureWidthTheme(
        backGestureWidth: BackGestureWidth.fraction(1 / 2),
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          themeMode: ref.read(themeManager).theme,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          routes: <String, WidgetBuilder>{
            '/': (context) => const SplashScreen(),
            '/home': (context) => HomePage(),
            '/setting': (context) => const Setting(),
            '/debug': (context) => const Debug(),
          },
        ));
  }
}
