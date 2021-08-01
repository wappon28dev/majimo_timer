import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:majimo_timer/preferences.dart';
import './digital_clock/slide_digital_clock.dart';
import './home.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
              TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            }),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.blue,
        fontFamily: 'M-plus',
        pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            }),
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

bool _ht;

class _FrontState extends State<Front> {
  _saveBool(String key, bool value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  _restoreValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _ht = prefs.getBool('ht') ?? true;
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
                      MaterialPageRoute(
                        builder: (context) => Prefer(),
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
        drawer: Drawer(child: Center(child: Text("Drawer"))),
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
                    value: _ht,
                    onChanged: (newVal) {
                      setState(() {
                        _ht = newVal;
                        _saveBool('ht', _ht);
                      });
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
                        _ht = false;
                        _saveBool('ht', false);
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
                        _ht = true;
                        _saveBool('ht', true);
                      });
                    },
                  ),
                  (_ht) ? Text("24h format") : Text("12h format"),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ));
            }
          },
        ),
      ),
    );
  }

  Widget _digitaiclock() {
    _restoreValues();

    return DigitalClock(
      digitAnimationStyle: Curves.easeOutExpo,
      is24HourTimeFormat: _ht,
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
