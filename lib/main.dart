import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ja', 'JP')],
      fallbackLocale: Locale('en', 'US'), // デフォルトの言語
      // startLocale: Locale('en', 'US'), // 端末の言語を強制的に設定する場合
      path: 'assets/translations/langs.csv',
      // path: 'assets/translations/',  // JSONの場合
      assetLoader: CsvAssetLoader(),
      // assetLoader: JsonAssetLoader() // JSONの場合
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'majimo_timer',
        home: Scaffold(
          appBar: AppBar(
            title: Text('greetings'.tr()),
          ),
          body: Center(
            child: Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(color: Colors.amber, width: 50, height: 50),
                  Container(color: Colors.blue, width: 50, height: 50),
                  Container(color: Colors.deepOrange, width: 50, height: 50),
                  Container(color: Colors.green, width: 50, height: 50),
                  Text('title').tr()
                ],
              ),
            ),
          ),
        ));
  }
}


/*










void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ja', 'JP')],
      fallbackLocale: Locale('en', 'US'), // デフォルトの言語
      // startLocale: Locale('en', 'US'), // 端末の言語を強制的に設定する場合
      path: 'assets/translations/langs.csv',
      // path: 'assets/translations/',  // JSONの場合
      assetLoader: CsvAssetLoader(),
      // assetLoader: JsonAssetLoader() // JSONの場合
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: MyApp());
  }
}

// This widget is the root of your application.
@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MyHomePage(title: 'Flutter Demo Home Page'),
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: DoNothingAction(),
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/