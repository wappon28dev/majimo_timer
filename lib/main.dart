import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/controller/controller.dart';
import 'package:majimo_timer/model/helper/config.dart';
import 'package:majimo_timer/model/helper/notification.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/helper/pref.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/model/state.dart';
import 'package:majimo_timer/view/routes/splash.dart';

//global
final globalState = StateNotifierProvider<GlobalController, GlobalState>(
  (ref) => GlobalController(),
);
final generalState = StateNotifierProvider<GeneralController, GeneralState>(
  (ref) => GeneralController(),
);
final themeState = StateNotifierProvider<ThemeController, ThemeState>(
  (ref) => ThemeController(),
);
final langState =
    StateNotifierProvider<LangController, LangState>((ref) => LangController());
final clockState = StateNotifierProvider<ClockController, ClockState>(
  (ref) => ClockController(),
);
final colorState = StateNotifierProvider<ColorController, ColorState>(
  (ref) => ColorController(),
);
final alarmState = StateNotifierProvider<AlarmController, AlarmState>(
  (ref) => AlarmController(ref.read),
);
final alarmTKState =
    StateNotifierProvider<AlarmTimeKeepingController, AlarmTimeKeepingState>(
  (ref) => AlarmTimeKeepingController(ref.read),
);
final timerState = StateNotifierProvider<TimerController, TimerState>(
  (ref) => TimerController(ref.read),
);
final timerTKState =
    StateNotifierProvider<TimerTimeKeepingController, TimerTimeKeepingState>(
  (ref) => TimerTimeKeepingController(ref.read),
);
final goalState =
    StateNotifierProvider<GoalController, GoalState>((ref) => GoalController());
final goalTKState =
    StateNotifierProvider<GoalTimeKeepingController, GoalTimeKeepingState>(
  (ref) => GoalTimeKeepingController(ref.read),
);
final nowStream = StreamProvider.autoDispose<DateTime>((ref) async* {
  while (true) {
    await Future<void>.delayed(const Duration(milliseconds: 10));
    yield DateTime.now();
  }
});

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
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      PrefManager().restore(ref, context);
      return null;
    });

    return BackGestureWidthTheme(
      backGestureWidth: BackGestureWidth.fraction(1 / 2),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: MyTheme().lightTheme(ref: ref),
        darkTheme: MyTheme().darkTheme(ref: ref),
        themeMode: ref.read(themeState).themeMode,
        debugShowCheckedModeBanner: false,
        home: const Splash(),
      ),
    );
  }
}
