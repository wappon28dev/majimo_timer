import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:majimo_timer/view/debug/body.dart';
import 'package:majimo_timer/view/setting/body.dart';
import 'package:majimo_timer/view/splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'plugin/let_log.dart';
import 'model/manager.dart';
import 'model/theme.dart';
import '/model/pref.dart';
import 'view/home/root/body.dart';

//global
final themeManager = ChangeNotifierProvider((ref) => ThemeManager());
final clockManager = ChangeNotifierProvider((ref) => ClockManager());
final langManager = ChangeNotifierProvider((ref) => LangManager());
final colorManager = ChangeNotifierProvider((ref) => ColorManager());
final alarmManager = ChangeNotifierProvider((ref) => AlarmManager());
getBool({required PrefKey key}) => PrefManager.getBool(key: key);
getInt({required PrefKey key}) => PrefManager.getInt(key: key);
setBool({required PrefKey key, required bool value}) =>
    PrefManager.setBool(key: key, value: value);
setInt({required PrefKey key, required int value}) =>
    PrefManager.setInt(key: key, value: value);
remove({required Type key}) => PrefManager.remove(key: key);

/// テーマの変更・記憶を行うStateNotifier
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('ja', 'JP')],
    fallbackLocale: const Locale('en', 'US'),
    path: 'assets/translations/langs.csv',
    assetLoader: CsvAssetLoader(),
    child: const ProviderScope(child: MyApp()),
  ));
  Logger.i(" -- Start Majimo_Timer -- ");
}

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    restore(BuildContext context) async {
      final is24 = await getBool(key: PrefKey.clockStyle);
      final theme = await getInt(key: PrefKey.appTheme);
      final lang = await getInt(key: PrefKey.changeLanguage);
      final alarmHour = await getInt(key: PrefKey.alarmHour) ?? 12;
      final alarmMinute = await getInt(key: PrefKey.alarmMinute) ?? 12;
      context.read(clockManager).is24change(value: is24);
      context.read(themeManager).change(theme: theme);
      context.read(langManager).change(context: context, lang: lang);
      context
          .read(alarmManager)
          .change(value: TimeOfDay(hour: alarmHour, minute: alarmMinute));
      Logger.r(" >> restore bool is24 = " +
          is24.toString() +
          "\n >> restore int theme = " +
          theme.toString() +
          "\n >> restore int lang = " +
          theme.toString() +
          "\n >> restore TimeOfDay value = " +
          TimeOfDay(hour: alarmHour, minute: alarmMinute).toString());
    }

    useEffect(() {
      restore(context);
    });
    return BackGestureWidthTheme(
        backGestureWidth: BackGestureWidth.fraction(1 / 2),
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          themeMode: context.read(themeManager).theme,
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
