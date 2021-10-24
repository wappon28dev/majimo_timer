import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:majimo_timer/view/home/body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:majimo_timer/view/setting/body.dart';
import 'package:majimo_timer/view/splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'model/theme.dart';
import 'view/home/model.dart';
import 'view/setting/model.dart';
import '/model/pref.dart';

//global
final themeChanger = ChangeNotifierProvider((_) => ThemeChanger());
final clockChanger = ChangeNotifierProvider((_) => ClockChanger());
final langChanger = ChangeNotifierProvider((_) => LangChanger());
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
}

class MyApp extends HookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    restore(BuildContext context) async {
      final is24 = await getBool(key: PrefKey.clockStyle);
      final theme = await getInt(key: PrefKey.appTheme);
      final lang = await getInt(key: PrefKey.changeLanguage);
      context.read(clockChanger).is24changer(is24);
      context.read(themeChanger).changetheme(theme: theme);
      context.read(langChanger).changelang(context: context, lang: lang);
      print("restore bool is24 = " + is24.toString());
      print("restore int theme = " + theme.toString());
      print("restore int lang = " + theme.toString());
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
          themeMode: context.read(themeChanger).theme,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          routes: <String, WidgetBuilder>{
            '/': (context) => const AppSplashPage(),
            '/home': (context) => const HomePage(),
            '/setting': (context) => const Setting(),
          },
        ));
  }
}
