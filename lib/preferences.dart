import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:majimo_timer/main.dart';
import './digital_clock/slide_digital_clock.dart';
import './home.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  await PrefService.init(prefix: 'pref_');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {}
}

class Prefer extends StatefulWidget {
  Prefer({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PreferState createState() => _PreferState();
}

class MyTheme extends ChangeNotifier {
  ThemeData current = ThemeData.light();
  bool _isDark = false;
}

class _PreferState extends State<Prefer> {
  bool _cf;
  double _value;
  bool _iosStyle;
  bool _interval5;

  _saveBool(String key, bool value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  _restoreValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _cf = prefs.getBool('cf') ?? true;
      _iosStyle = prefs.getBool('iosstyle') ?? false;
      _value = prefs.getDouble('value') ?? 60;
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
    String americanDate = DateFormat.yMMMMd('en_US').format(DateTime.now());

    @override
    String title = tr('prefer');

    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                if (mounted) {
                  Navigator.of(context).pop();
                }
              }),
          title: Text(title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          actions: <Widget>[],
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
                  Text("hello"),
                  SizedBox(
                    width: double.infinity,
                    height: 1000,
                    child: _prefer(),
                  )
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

  Widget _prefer() {
    return PreferencePage([
      PreferenceTitle('General'),
      DropdownPreference(
        'Start Page',
        'start_page',
        defaultVal: 'じゃがいも',
        values: ['じゃがいも', 'Timeline', '焼き肉'],
      ),
      PreferenceTitle('Personalization'),
      RadioPreference(
        'Light Theme',
        'light',
        'ui_theme',
        isDefault: true,
      ),
      RadioPreference(
        'Dark Theme',
        'dark',
        'ui_theme',
      ),
      PreferenceTitle('Langage'),
      RadioPreference(
        'White',
        'white',
        'theme',
        isDefault: true,
      ),
      RadioPreference(
        'Dark',
        'dark',
        'theme',
        isDefault: true,
      ),
      RadioPreference(
        'Dark',
        'dark',
        'theme',
        isDefault: true,
      ),
    ]);
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
