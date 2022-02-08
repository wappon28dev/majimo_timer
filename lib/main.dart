import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/controller/controller.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/helper/pref.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/view/routes/splash.dart';

//global
final globalState = StateNotifierProvider<GlobalController, GlobalState>(
    (ref) => GlobalController());

final generalState = StateNotifierProvider<GeneralController, GeneralState>(
    (ref) => GeneralController());
final themeState = StateNotifierProvider<ThemeController, ThemeState>(
    (ref) => ThemeController());
final langState =
    StateNotifierProvider<LangController, LangState>((ref) => LangController());
final clockState = StateNotifierProvider<ClockController, ClockState>(
    (ref) => ClockController());
final colorState = StateNotifierProvider<ColorController, ColorState>(
    (ref) => ColorController());
final alarmState = StateNotifierProvider<AlarmController, AlarmState>(
    (ref) => AlarmController());
final alarmTKState =
    StateNotifierProvider<AlarmTimeKeepingController, AlarmTimeKeepingState>(
        (ref) => AlarmTimeKeepingController(ref.read));
final timerState = StateNotifierProvider<TimerController, TimerState>(
    (ref) => TimerController());
final timerTKState =
    StateNotifierProvider<TimerTimeKeepingController, TimerTimeKeepingState>(
        (ref) => TimerTimeKeepingController(ref.read));

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('ja', 'JP')],
    fallbackLocale: const Locale('en', 'US'),
    path: 'assets/translations/langs.csv',
    assetLoader: CsvAssetLoader(),
    child: const ProviderScope(child: MyApp()),
  ));
  Logger.i(' -- Start Majimo_Timer -- ');
  GlobalController.switch_full_screen(value: false);
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
            theme: MyTheme().lightTheme,
            darkTheme: MyTheme().darkTheme,
            themeMode: ref.read(themeState).theme_value,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            home: const Splash()));
  }
}
