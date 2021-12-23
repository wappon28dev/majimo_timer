import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/view/debug/body.dart';
import 'package:majimo_timer/view/setting/body.dart';
import 'package:majimo_timer/view/splash.dart';
import 'package:majimo_timer/vm/viewmodel.dart';
import 'package:workmanager/workmanager.dart';

import 'model/helper/notification.dart';
import 'model/helper/pref.dart';
import 'model/helper/theme.dart';
import 'plugin/let_log/let_log.dart';
import 'view/home/alarm/timekeep/body.dart';
import 'view/home/root/body.dart';

//global
final generalManager = StateNotifierProvider<GeneralManagerVM, GeneralManager>(
    (ref) => GeneralManagerVM());
final themeManager = StateNotifierProvider<ThemeManagerVM, ThemeManager>(
    (ref) => ThemeManagerVM());
final langManager =
    StateNotifierProvider<LangManagerVM, LangManager>((ref) => LangManagerVM());
final clockManager = StateNotifierProvider<ClockManagerVM, ClockManager>(
    (ref) => ClockManagerVM());
final colorManager = StateNotifierProvider<ColorManagerVM, ColorManager>(
    (ref) => ColorManagerVM());
final alarmManager = StateNotifierProvider<AlarmManagerVM, AlarmManager>(
    (ref) => AlarmManagerVM());
final alarmTimeKeepingManager =
    StateNotifierProvider<AlarmTimeKeepingManagerVM, AlarmTimeKeepingManager>(
        (ref) => AlarmTimeKeepingManagerVM(ref.read));

const int helloAlarmID = 0;

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    Logger.i('are you hear?');
    NotificationManager.alarm_finish();
    return Future.value(true);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  NotificationManager.initialize();
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('ja', 'JP')],
    fallbackLocale: const Locale('en', 'US'),
    path: 'assets/translations/langs.csv',
    assetLoader: CsvAssetLoader(),
    child: const ProviderScope(child: MyApp()),
  ));
  Logger.i(' -- Start Majimo_Timer -- ');
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alarmTK = ref.read(alarmTimeKeepingManager).alarmTK;

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
            themeMode: ref.read(themeManager).theme_value,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            home: !alarmTK
                ? const SplashScreen()
                : const AlarmTimeKeepingPage()));
  }
}
