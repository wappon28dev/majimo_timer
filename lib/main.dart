import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/view/debug/body.dart';
import 'package:majimo_timer/view/setting/body.dart';
import 'package:majimo_timer/view/splash.dart';
import 'package:majimo_timer/vm/viewmodel.dart';
import 'package:workmanager/workmanager.dart';

import 'model/manager.dart';
import 'model/notification.dart';
import 'model/pref.dart';
import 'model/theme.dart';
import 'plugin/let_log/let_log.dart';
import 'view/home/root/body.dart';

//global
final myTheme = ChangeNotifierProvider((ref) => MyTheme(ref.read));
final generalManager = ChangeNotifierProvider((ref) => GeneralManager());
final themeManager = ChangeNotifierProvider((ref) => ThemeManager(ref.read));
final langManager = ChangeNotifierProvider((ref) => LangManager());
final clockManager = ChangeNotifierProvider((ref) => ClockManager());
final colorManager = ChangeNotifierProvider((ref) => ColorManager(ref.read));
final alarmManager = ChangeNotifierProvider((ref) => AlarmManager(ref.read));

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
          theme: ref.read(myTheme).lightTheme,
          darkTheme: ref.read(myTheme).darkTheme,
          themeMode: ThemeManagerVM(ref.read).themeMode_value,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          routes: <String, WidgetBuilder>{
            '/': (context) => const SplashScreen(),
            '/home': (context) => const HomePage(),
            '/setting': (context) => const Setting(),
            '/debug': (context) => const Debug(),
          },
        ));
  }
}
