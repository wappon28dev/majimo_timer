import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:bottom_bar/bottom_bar.dart';

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
    return MaterialApp(
      // g: ----easy_localizationの設定----  ここから
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Home(),
      // g: ----easy_localizationの設定----  ここまで

      debugShowCheckedModeBanner: false,
      title: 'Bottom Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Container(color: Colors.blue),
          Container(color: Colors.red),
          Container(color: Colors.greenAccent.shade700),
          Container(color: Colors.orange),
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
            title: Text('1st'.tr()),
            activeColor: Colors.blue,
          ),
          BottomBarItem(
            icon: Icon(Icons.hourglass_top),
            title: Text('2nd'.tr()),
            activeColor: Colors.red,
            darkActiveColor: Colors.red.shade400,
          ),
          BottomBarItem(
            icon: Icon(Icons.flag),
            title: Text('3rd'.tr()),
            activeColor: Colors.greenAccent.shade700,
            darkActiveColor: Colors.greenAccent.shade400,
          ),
          BottomBarItem(
            icon: Icon(Icons.receipt_long),
            title: Text('4th'.tr()),
            activeColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
