import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import './digital_clock/slide_digital_clock.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:expandable_slider/expandable_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {}
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
  bool _cf;
  int _currentPage = 0;
  final _pageController = PageController();
  TimeOfDay _time = TimeOfDay.now().replacing(minute: 30);
  bool _iosStyle = true;
  bool _interval5 = true;
  double _currentTime;
  String _intcurrentTime;

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
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

  void _onChanged(double newValue) {
    setState(() {
      _currentTime = newValue;
      _intcurrentTime = _currentTime.toStringAsFixed(0);
      _saveDouble('currenttime', _currentTime);
    });
  }

  _saveDouble(String key, double value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, value);
  }

  _saveBool(String key, bool value) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  _restoreValues() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _cf = prefs.getBool('cf') ?? true;
      _iosStyle = prefs.getBool('iosstyle') ?? false;
      _currentTime = prefs.getDouble('currenttime') ?? 60;
      //@audit-ok 直った
      //@note 原因：スペースの問題  ->  カッコで括る
      // _intcurrentTime = _currentTime.toStringAsFixed(0);

      _currentTime = prefs.getDouble('currenttime') ?? 60;
      _intcurrentTime =
          (prefs.getDouble('currenttime') ?? 60).toStringAsFixed(0);
    });
  }

  @override
  void initState() {
    _restoreValues();
    super.initState();
  }

  Widget _buildVertical(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[_first()],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[_second()],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[_third()],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[_fourth()],
            ),
          ),
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
          createInlinePicker(
            isOnChangeValueMode: true,
            dialogInsetPadding:
                EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            hourLabel: "時",
            minuteLabel: "分",
            elevation: 1,
            value: _time,
            onChange: onTimeChanged,
            iosStylePicker: _iosStyle,
            is24HrFormat: _cf,
            minMinute: 0,
            maxMinute: 59,
            onChangeDateTime: (DateTime dateTime) {
              print(dateTime);
            },
          ),
          Text("iOS Style?"),
          Switch(
            value: _iosStyle,
            onChanged: (newVal) {
              setState(() {
                _iosStyle = newVal;
                _saveBool('iosstyle', _iosStyle);
              });
            },
          ),
          Text("interval 5?"),
          Switch(
            value: _interval5,
            onChanged: (newVal) {
              setState(() {
                _interval5 = newVal;
              });
            },
          ),
          SizedBox(
              height: 500,
              width: double.infinity,
              child: IgnorePointer(
                ignoring: true,
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
                                onTap: () {
                                  /* react to the tile being tapped */
                                },
                              ),
                            ))));
                  },
                  itemCount: listItem.length,
                ),
              )),
          // (_ht) ? Text("debug: 24h format") : Text("debug: 12h format"),
          Text("  _saveBool(String key, bool value) async\n"
              "    var prefs = await SharedPreferences.getInstance();\n"
              "    prefs.setBool(key, value);"),
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
                  child: Text(_intcurrentTime ?? "null",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 100)),
                ),
              ),
              ExpandableSlider.adaptive(
                value: _currentTime,
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
          Text(
            _time.format(context),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).accentColor,
            ),
            onPressed: () {
              Navigator.of(context).push(
                showPicker(
                  context: context,
                  value: _time,
                  onChange: onTimeChanged,
                  minuteInterval: MinuteInterval.FIVE,
                  disableHour: false,
                  disableMinute: false,
                  minMinute: 7,
                  maxMinute: 56,
                  onChangeDateTime: (DateTime dateTime) {
                    print(dateTime);
                  },
                ),
              );
            },
            child: Text(
              "Open time picker",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text("Inline Picker Style", style: TextStyle(fontSize: 20)),
          createInlinePicker(
            elevation: 1,
            value: _time,
            onChange: onTimeChanged,
            minuteInterval: MinuteInterval.FIVE,
            iosStylePicker: _iosStyle,
            minMinute: 7,
            maxMinute: 56,
          ),
          Text(
            "IOS Style",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Switch(
            value: _iosStyle,
            onChanged: (newVal) {
              setState(() {
                _iosStyle = newVal;
              });
            },
          )
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
            height: 1000,
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
    return DigitalClock(
      digitAnimationStyle: Curves.easeOutExpo,
      is24HourTimeFormat: _cf,
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
  }

  Widget _buildHorizontal(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.pink,
      child: Text("ヨコ", style: TextStyle(fontSize: 32)),
    );
  }
}
