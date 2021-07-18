import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:expandable_slider/expandable_slider.dart';
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
  const Home({@required this.max, @required this.min});

  final double max;
  final double min;

  @override
  _HomeState createState() => _HomeState();
}

String japanDate = DateFormat("MM/dd").format(DateTime.now());
String americanDate = DateFormat.yMMMMd('en_US').format(DateTime.now());

class _HomeState extends State<Home> {
  bool ht = true;
  int _currentPage = 0;
  final _pageController = PageController();

  double _value;

  @override
  void initState() {
    _value = widget.min;
    super.initState();
  }

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

  void _onChanged(double newValue) => setState(() => _value = newValue);

  // s: たて
  Widget _buildVertical(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DelayedWidget(
                  child: _first(),
                  delayDuration: Duration(milliseconds: 350), // Not required
                  animationDuration:
                      Duration(milliseconds: 200), // Not required
                  animation:
                      DelayedAnimations.SLIDE_FROM_BOTTOM, // Not required
                ),
              ]),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DelayedWidget(
                  delayDuration: Duration(milliseconds: 350), // Not required
                  animationDuration:
                      Duration(milliseconds: 200), // Not required
                  animation:
                      DelayedAnimations.SLIDE_FROM_BOTTOM, // Not required
                  child: _second(),
                ),
              ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DelayedWidget(
                delayDuration: Duration(milliseconds: 350), // Not required
                animationDuration: Duration(milliseconds: 200), // Not required
                animation: DelayedAnimations.SLIDE_FROM_BOTTOM, // Not required
                child: _third(),
              ),
            ],
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DelayedWidget(
                  child: _fourth(),
                  delayDuration: Duration(milliseconds: 350), // Not required
                  animationDuration:
                      Duration(milliseconds: 200), // Not required
                  animation:
                      DelayedAnimations.SLIDE_FROM_BOTTOM, // Not required
                ),
              ]),
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
    var listItem = ['one', 'two', 'three'];
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
        Widget>[
      SizedBox(height: 40),
      SizedBox(
        height: 40,
        width: double.infinity,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: SizedBox(height: 26, child: _digitaiclock()),
                ),
              ],
            ),
            Center(
              child: SizedBox(height: 31, child: Text("時刻モード")),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              Text("      "),
              SizedBox(height: 30),
              (tr('lang') == "ja_JP") ? Text(japanDate) : Text(americanDate),
            ]),
          ],
        ),
      ),
      SizedBox(
        height: 500,
        width: double.infinity,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black38),
                  ),
                ),
                child: ListTile(
                  leading: const Icon(Icons.flight_land),
                  title: Text('$index'),
                  subtitle: Text('&listItem'),
                  onTap: () {/* react to the tile being tapped */},
                ));
          },
          itemCount: listItem.length,
        ),
      ),
    ]);
  }

  Widget _second() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 40),
          Text("時間モード"),
          Center(
            child: Center(
              child: Text(_value.toStringAsFixed(0),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 100)),
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
          )
        ]);
  }

  Widget _third() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 40),
          Text("目標モード"),
        ]);
  }

  Widget _fourth() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 40),
          Text("あいすけえ１号（咳をしても一人）"),
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
        ]);
  }

  Widget _digitaiclock() {
    // g: ----デジタル時計----  ここから
    return DigitalClock(
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
