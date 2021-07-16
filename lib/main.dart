// Programmed & Designed by wappon_28_dev, sakana
// コメントは各コードの上に記載
// s: セクション, g: ----グループ----, c: コード, d:デバッグ

// s: パッケージのインポート
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import './home.dart';
// import 'package:bottom_bar/bottom_bar.dart';
// import 'package:fabexdateformatter/fabexdateformatter.dart';
// import 'package:intl/intl.dart';  // d: temp
// import 'package:intl/date_symbol_data_local.dart';  //d: temp

//s: アプリ実行時に読まれる -> async; 必要なときに同期するやつ
void main() async {
  // g: ----easy_localizationの初期宣言----  ここから
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      // c: 使用可能な言語の列挙
      supportedLocales: [Locale('en', 'US'), Locale('ja', 'JP')],
      // c: デフォルトの言語
      fallbackLocale: Locale('en', 'US'),
      // startLocale: Locale('en', 'US'), // d: 言語を強制する設定
      path: 'assets/translations/langs.csv',
      assetLoader: CsvAssetLoader(),
      child: MyApp()));
  // g: ----easy_localizationの初期宣言----  ここまで
}

//s: 静的ウィジェット
class MyApp extends StatelessWidget {
  @override

  // s: テーマの設定
  Widget build(BuildContext context) {
    return MaterialApp(
      // g: ----easy_localizationの設定----  ここから
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomePage(),
      // g: ----easy_localizationの設定----  ここまで
      // g: ----テーマの設定----  ここから
      // c: ライトモードのとき
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.blue,
        fontFamily: 'M-plus',
      ),

      // c: ダークモードのとき
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.blue,
        fontFamily: 'M-plus',
      ),

      // c: テーマの選択 --> [light, dark, system]
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false, // これを追加するだけ
      // g: ----テーマの設定----  ここまで
    );
  }
}

// s: 縦か横を判断する
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth < constraints.maxHeight
            ? _buildVertical(context)
            : _buildHorizontal(context);
      },
    );
  }

// s: たて
  Widget _buildVertical(BuildContext context) {
    String japanDate = DateFormat("yyyy年 MM月 dd日 E曜日").format(DateTime.now());
    String americanDate = DateFormat.yMMMMd('en_US').format(DateTime.now());

    @override
        // d: FabexFormatterの初期宣言
        // FabexFormatter fabexFormatter = FabexFormatter();

        // g: ----変数の指定----  ここから
        String appname = tr('app_name');
    bool ht = false;
    // g: ----変数の指定----  ここまで
    // 縦向きの場合
    return Scaffold(
        // g: ----ウィジェット実体----  ここから
        body: Scaffold(
      // c: appbarの定義
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text(appname,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings_outlined),
          ),
        ],
        backgroundColor: Colors.deepOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),

      drawer: Drawer(child: Center(child: Text("Drawer"))), // d: ドロワーのテスト
      // body-columnです
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 30,
          ),

          // g: ----デジタル時計----  ここから
          DigitalClock(
            digitAnimationStyle: Curves.easeOutExpo,
            is24HourTimeFormat: ht,
            areaDecoration: BoxDecoration(
              color: Colors.transparent,
            ),
            hourMinuteDigitTextStyle: TextStyle(
              fontFamily: 'M-plus',
              fontSize: 70,
              height: 1,
            ),
            hourMinuteDigitDecoration: BoxDecoration(color: Colors.transparent),
            amPmDigitTextStyle: TextStyle(
              fontFamily: 'M-plus',
              fontSize: 20,
              height: 2,
            ),
            secondDigitTextStyle: TextStyle(
              fontFamily: 'M-plus',
              fontSize: 30,
              height: 1.5,
              // :
            ),
            secondDigitDecoration: BoxDecoration(color: Colors.transparent),
          ),
          // g: ----デジタル時計----  ここまで
          SizedBox(
            width: double.infinity,
            height: 0,
          ),
          /*
              memo: >> tr('lang') -> ["ja_JP", "en_US"]
            */
          (tr('lang') == "ja_JP") ? Text(japanDate) : Text(americanDate),
          SizedBox(height: 10),
          Text('greetings'.tr(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

          // Text("${fabexFormatter.dateTimeNowToTimeOfDay(DateTime.now())}")
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: Text('change'.tr()),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              onPrimary: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      // g: ----FAB----  ここから
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.arrow_forward),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return Home();
          }),
        ),
      ),
    )); // g: ----ウィジェット実体----  ここまで
  }

// s: よこ
  Widget _buildHorizontal(BuildContext context) {
    // 横向きの場合
    return Container(
      alignment: Alignment.center,
      color: Colors.pink,
      child: Text("ヨコ", style: TextStyle(fontSize: 32)),
    );
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
