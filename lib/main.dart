import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:majimo_timer/preferences.dart';
import './digital_clock/slide_digital_clock.dart';
import './home.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ja', 'JP')],
      fallbackLocale: Locale('en', 'US'),
      // startLocale: Locale('en', 'US'),
      path: 'assets/translations/langs.csv',
      assetLoader: CsvAssetLoader(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Front(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.blue,
        fontFamily: 'M-plus',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.blue,
        fontFamily: 'M-plus',
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Front extends StatefulWidget {
  Front({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FrontState createState() => _FrontState();
}

bool _cf;

class _FrontState extends State<Front> {
  _saveBool(String key, bool value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  _restoreValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _cf = prefs.getBool('cf') ?? true;
    });
  }

  @override
  void initState() {
    _restoreValues();
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

  Widget _buildVertical(BuildContext context) {
    String japanDate = DateFormat("yyyy年 MM月 dd日 E曜日").format(DateTime.now());
    String americanDate =
        DateFormat('EEEE, MMM d, yyyy').format(DateTime.now());

    @override
    String appname = tr('app_name');

    return Scaffold(
      body: Scaffold(
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
              onPressed: () {
                if (mounted) {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Prefer(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return OpenUpwardsPageTransitionsBuilder()
                              .buildTransitions(
                                  MaterialPageRoute(
                                      builder: (context) => Prefer()),
                                  context,
                                  animation,
                                  secondaryAnimation,
                                  child);
                        },
                      ));
                }
              },
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
          brightness: Brightness.dark,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
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
                  SizedBox(
                    width: double.infinity,
                    height: 30,
                  ),
                  _digitaiclock(),
                  SizedBox(
                    width: double.infinity,
                    height: 0,
                  ),
                  /*
              memo: >> tr('lang') -> ["ja_JP", "en_US"]
            */
                  (tr('lang') == "ja_JP")
                      ? Text(japanDate)
                      : Text(americanDate),
                  SizedBox(height: 10),
                  Text('greetings'.tr(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    height: 20,
                  ),
                  Text("24h format"),
                  Switch(
                    value: _cf,
                    onChanged: (newVal) {
                      setState(() {
                        _cf = newVal;
                        _saveBool('cf', _cf);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('24時間表記？ : $newVal',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                fontFamily: 'M-Plus')),
                        backgroundColor: Colors.blue,
                        duration: Duration(seconds: 2),
                      ));
                    },
                  ),
                  ElevatedButton(
                    child: Text('change12'.tr()),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _cf = false;
                        _saveBool('cf', false);
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text('change24'.tr()),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _cf = true;
                        _saveBool('cf', true);
                      });
                    },
                  ),
                  // (_cf) ? Text("24h format") : Text("12h format"),
                ],
              ),
            ),
          ),
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          child: Icon(Icons.arrow_forward),
          onPressed: () {
            if (mounted) {
              Navigator.of(context).push(SwipeablePageRoute(
                backGestureDetectionStartOffset:
                    -30, //@note scl23 -> double -30
                canOnlySwipeFromEdge: true,
                builder: (BuildContext context) => Home(),
              ));
            }
          },
        ),
      ),
    );
  }

  Widget _digitaiclock() {
    _restoreValues();
    if (_cf) {
      print("clock_true");
    } else {
      print("clock_false");
    }
    return DigitalClock(
      digitAnimationStyle: Curves.easeOutExpo,
      is24HourTimeFormat: _cf,
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
      ),
      secondDigitDecoration: BoxDecoration(color: Colors.transparent),
    );
  }

  Widget _buildHorizontal(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.pink,
      child: Text("ヨコ", style: TextStyle(fontSize: 32)),
    );
  }
}




/*
      //@audit-ok 直った
      //@note 原因：スペースの問題  ->  カッコで括る
      // _intcurrentTime = _currentTime.toStringAsFixed(0);

      _currentTime = prefs.getDouble('currentTime') ?? 60;
      _intcurrentTime =
          (prefs.getDouble('currentTime') ?? 60).toStringAsFixed(0);


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ja', 'JP')],
      fallbackLocale: Locale('en', 'US'), 
      
      path: 'assets/translations/langs.csv',
      
      assetLoader: CsvAssetLoader(),
      
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
      
      
      
      
      
    );
  }
}
*/
