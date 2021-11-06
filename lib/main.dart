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
    useEffect(() {
      PrefManager.restore(context);
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
