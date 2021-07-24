import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:expandable_slider/expandable_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:animations/animations.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

void main() async {
  // g: ----easy_localizationの初期宣言----  ここから
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      // c: 使用可能な言語の列挙
      supportedLocales: [Locale('en', 'US'), Locale('ja', 'JP')],
      // c: デフォルトの言語
      fallbackLocale: Locale('en', 'US'),
      startLocale: Locale('en', 'US'), // d: 言語を強制する設定
      path: 'assets/translations/langs.csv',
      assetLoader: CsvAssetLoader(),
      child: MyApp()));

  // g: ----easy_localizationの初期宣言----  ここまで
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Navigator.pop(context, true);
    return MaterialApp(
      // g: ----easy_localizationの設定----  ここから
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: MyApp(),
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

class Home extends StatefulWidget {
  const Home();

  final double max = 120;
  final double min = 0;

  @override
  _HomeState createState() => _HomeState();
}

String japanDate = DateFormat("MM/dd").format(DateTime.now());
String americanDate = DateFormat.yMMMMd('en_US').format(DateTime.now());

class _HomeState extends State<Home> {
  bool _ht = true;
  int _currentPage = 0;
  final _pageController = PageController();

  double _value;

  // Shared Preferenceに値を保存されているデータを読み込んで_counterにセットする。

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

  void _onChanged(double newValue) {
    setState(() {
      _value = newValue;
      _saveDouble('value', _value)(); // Shared Preferenceに値を保存する。
    });
  }

  _saveDouble(String key, double value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  _restoreValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _ht = prefs.getBool('ht') ?? true;
      _value = prefs.getBool('value') ?? 60;
    });
  }

  @override
  void initState() {
    _restoreValues();
    super.initState();
  }

  // s: たて
  Widget _buildVertical(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[_first()]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[_second()],
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[_third()]),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[_fourth()]),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.alarm),
            title: Text('1st'.tr(),
                style: TextStyle(
                  fontFamily: 'M-plus',
                )),
            activeColor: Colors.blue,
            darkActiveColor: Colors.lightBlueAccent.shade200,
          ),
          BottomBarItem(
              icon: Icon(Icons.hourglass_top),
              title: Text('2nd'.tr(),
                  style: TextStyle(
                    fontFamily: 'M-plus',
                  )),
              activeColor: Colors.red,
              darkActiveColor: Colors.deepOrangeAccent.shade200),
          BottomBarItem(
            icon: Icon(Icons.flag),
            title: Text('3rd'.tr(),
                style: TextStyle(
                  fontFamily: 'M-plus',
                )),
            activeColor: Colors.greenAccent.shade700,
            darkActiveColor: Colors.greenAccent.shade400,
          ),
          BottomBarItem(
            icon: Icon(Icons.receipt_long),
            title: Text('4th'.tr(),
                style: TextStyle(
                  fontFamily: 'M-plus',
                )),
            activeColor: Colors.orange,
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _first() {
    var listItem = ['はるき', 'たくみ', 'ゆうた', 'ゆうと', 'りょうた', 'かのふ'];
    var caption = [
      'モテるし頭が良いコアラ',
      'ダグい. それだけだ',
      '最近は海辺へ行ったらしい',
      'みんな大好きカピバラちゃん',
      'ドッジボールとビターステップ',
      '歴史的仮名遣いの使われ手'
    ];
    return SafeArea(
        child: AnimationLimiter(
            child: Column(
                children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                    children: <Widget>[
          SizedBox(height: 20),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: SizedBox(height: 30, child: _digitaiclock()),
                    ),
                  ],
                ),
                Center(
                  child: SizedBox(
                    height: 31,
                    child: new Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 9.0, vertical: 2.0),
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent.shade200,
                          border: Border.all(
                              color: Colors.lightBlueAccent.shade200, width: 3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("時間モード",
                            style: TextStyle(color: Colors.white))),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("      "),
                      SizedBox(height: 40),
                      (tr('lang') == "ja_JP")
                          ? Text(japanDate)
                          : Text(americanDate),
                    ]),
              ],
            ),
          ),
          SizedBox(
            height: 500,
            width: double.infinity,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                            child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.black38),
                            ),
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.star),
                            title: Text(listItem[index]),
                            subtitle: Text(caption[index],
                                style: TextStyle(fontSize: 14)),
                            onTap: () {/* react to the tile being tapped */},
                          ),
                        ))));
              },
              itemCount: listItem.length,
            ),
          ),
          (_ht) ? Text("debug: 24h format") : Text("debug: 12h format"),
          Text("  _saveBool(String key, bool value) async\n"
              "    var prefs = await SharedPreferences.getInstance();\n"
              "    prefs.setBool(key, value);")
        ]))));
  }

  Widget _second() {
    return SafeArea(
      child: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: <Widget>[
              SizedBox(height: 20),
              new Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 9.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    color: Colors.redAccent.shade200,
                    border:
                        Border.all(color: Colors.redAccent.shade200, width: 3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("時間モード", style: TextStyle(color: Colors.white))),
              Center(
                child: Center(
                  child: Text(_value.toStringAsFixed(0),
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 100)),
                ),
              ),
              ExpandableSlider.adaptive(
                value: _value,
                onChanged: _onChanged,
                min: 0,
                max: 120,
                estimatedValueStep: 5,
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _onChanged(15),
                      child: const Text("15分"),
                    ),
                    ElevatedButton(
                      onPressed: () => _onChanged(30),
                      child: const Text("30分"),
                    ),
                    ElevatedButton(
                      onPressed: () => _onChanged(45),
                      child: const Text("45分"),
                    ),
                    ElevatedButton(
                      onPressed: () => _onChanged(60),
                      child: const Text("60分"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _third() {
    return SafeArea(
        child: AnimationLimiter(
            child: Column(
                children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                    children: <Widget>[
          SizedBox(height: 20),
          new Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 9.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: Colors.greenAccent.shade200,
                border:
                    Border.all(color: Colors.greenAccent.shade200, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("目標モード")),
        ]))));
  }

  Widget _fourth() {
    return SafeArea(
        child: AnimationLimiter(
            child: Column(
                children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset: 0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                    children: <Widget>[
          SizedBox(height: 20),
          new Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 9.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: Colors.orangeAccent.shade200,
                border:
                    Border.all(color: Colors.orangeAccent.shade200, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("記録モード", style: TextStyle(color: Colors.white))),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 500,
            width: double.infinity,
            child: Scaffold(
              body: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 3.0,
                    child: Padding(
                      child: Text(
                        '$index',
                        style: TextStyle(fontSize: 22.0),
                      ),
                      padding: EdgeInsets.all(20.0),
                    ),
                  );
                },
              ),
            ),
          )
        ]))));
  }

  Widget _digitaiclock() {
    // g: ----デジタル時計----  ここから
    return DigitalClock(
      digitAnimationStyle: Curves.easeOutExpo,
      is24HourTimeFormat: _ht,
      areaDecoration: BoxDecoration(
        color: Colors.transparent,
      ),
      hourMinuteDigitTextStyle: TextStyle(
        fontSize: 15,
      ),
      secondDigitTextStyle: TextStyle(
        fontSize: 8,
      ),
      hourMinuteDigitDecoration: BoxDecoration(color: Colors.transparent),
      secondDigitDecoration: BoxDecoration(color: Colors.transparent),
    );

    // g: ----デジタル時計----  ここまで
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
          // Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: <Widget>[
          //       Text(""),
          //       Text(""),
          //       Text(""),
          //       Text("あいすけえ４号"),
          //       SizedBox(
          //         child: AnimatedTextKit(
          //           animatedTexts: [
          //             FadeAnimatedText(
          //               '\n\n浮かび上がれあいすけ',
          //               textStyle: TextStyle(
          //                   fontSize: 32.0, fontWeight: FontWeight.bold),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ]),
