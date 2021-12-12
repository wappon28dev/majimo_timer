import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart' as p;

import '../../main.dart';
import 'helpers/clock_model.dart';
import 'helpers/spinner_text.dart';

Widget largeclock(BuildContext context, WidgetRef ref, bool value) {
  final clockmanager = ref.read(clockManager);
  final colormanager = ref.read(colorManager);
  var color = (value) ? colormanager.get(context: context)[0] : Colors.white;

  return DigitalClock(
    digitAnimationStyle: clockmanager.get_animation()[2],
    showSecondsDigit: clockmanager.showSec,
    is24HourTimeFormat: clockmanager.is24,
    areaDecoration: const BoxDecoration(
      color: Colors.transparent,
    ),
    hourMinuteDigitTextStyle: TextStyle(
        fontSize: 50,
        color: color,
        wordSpacing: 5,
        fontWeight: FontWeight.bold),
    hourMinuteDigitDecoration: const BoxDecoration(color: Colors.transparent),
    amPmDigitTextStyle: TextStyle(
        fontSize: 10, height: 2, color: color, fontWeight: FontWeight.bold),
    secondDigitTextStyle: TextStyle(
        fontSize: 20, height: 1.5, color: color, fontWeight: FontWeight.bold),
    secondDigitDecoration: const BoxDecoration(color: Colors.transparent),
    areaAligment: AlignmentDirectional.center,
  );
}

Widget smallclock(BuildContext context, WidgetRef ref, bool value) {
  final clockmanager = ref.read(clockManager);
  final colormanager = ref.read(colorManager);
  var color = (value) ? colormanager.get(context: context)[0] : Colors.white;

  return p.DigitalClock(
    digitAnimationStyle: clockmanager.get_animation()[2],
    showSecondsDigit: clockmanager.showSec,
    is24HourTimeFormat: clockmanager.is24,
    areaDecoration: const BoxDecoration(
      color: Colors.transparent,
    ),
    hourMinuteDigitTextStyle: const TextStyle(
      fontSize: 17,
      height: 1,
      color: Colors.white,
    ),
    secondDigitTextStyle: const TextStyle(
      fontSize: 10,
      color: Colors.white,
    ),
    hourMinuteDigitDecoration: const BoxDecoration(color: Colors.transparent),
    secondDigitDecoration: const BoxDecoration(color: Colors.transparent),
  );
}

class DigitalClock extends StatefulWidget {
  DigitalClock({
    this.is24HourTimeFormat,
    this.showSecondsDigit,
    this.areaWidth,
    this.areaHeight,
    this.areaDecoration,
    this.areaAligment,
    this.hourMinuteDigitDecoration,
    this.secondDigitDecoration,
    this.digitAnimationStyle,
    this.hourMinuteDigitTextStyle,
    this.secondDigitTextStyle,
    this.amPmDigitTextStyle,
  });

  final bool? is24HourTimeFormat;
  final bool? showSecondsDigit;
  final double? areaWidth;
  final double? areaHeight;
  final BoxDecoration? areaDecoration;
  final AlignmentDirectional? areaAligment;
  final BoxDecoration? hourMinuteDigitDecoration;
  final BoxDecoration? secondDigitDecoration;
  final Curve? digitAnimationStyle;
  final TextStyle? hourMinuteDigitTextStyle;
  final TextStyle? secondDigitTextStyle;
  final TextStyle? amPmDigitTextStyle;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  late DateTime _dateTime;
  late ClockModel _clockModel;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    _clockModel = ClockModel();
    _clockModel.is24HourFormat = widget.is24HourTimeFormat ?? true;

    _dateTime = DateTime.now();
    _clockModel.hour = _dateTime.hour;
    _clockModel.minute = _dateTime.minute;
    _clockModel.second = _dateTime.second;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _dateTime = DateTime.now();
      _clockModel.hour = _dateTime.hour;
      _clockModel.minute = _dateTime.minute;
      _clockModel.second = _dateTime.second;

      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.areaWidth ??
          (widget.hourMinuteDigitTextStyle != null
              ? widget.hourMinuteDigitTextStyle!.fontSize! * 7
              : 180),
      height: widget.areaHeight ?? null,
      child: Container(
        alignment: widget.areaAligment ?? AlignmentDirectional.bottomCenter,
        decoration: widget.areaDecoration ??
            BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 3, 12, 84),
            ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _hour(),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 2),
                child: SpinnerText(
                  text: ":",
                  textStyle: widget.hourMinuteDigitTextStyle ?? null,
                )),
            _minute,
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _amPm,
                _second,
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _hour() => Container(
        decoration: widget.hourMinuteDigitDecoration ??
            BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5)),
        child: SpinnerText(
          text: _clockModel.is24HourTimeFormat
              ? hTOhh_24hTrue(_clockModel.hour)
              : hTOhh_24hFalse(_clockModel.hour)[0],
          animationStyle: widget.digitAnimationStyle ?? null,
          textStyle: widget.hourMinuteDigitTextStyle ?? null,
        ),
      );

  Widget get _minute => Container(
        decoration: widget.hourMinuteDigitDecoration ??
            BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5)),
        child: SpinnerText(
          text: mTOmm(_clockModel.minute),
          animationStyle: widget.digitAnimationStyle ?? null,
          textStyle: widget.hourMinuteDigitTextStyle ?? null,
        ),
      );

  Widget get _second => widget.showSecondsDigit != false
      ? Container(
          decoration: widget.secondDigitDecoration ??
              BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5)),
          child: SpinnerText(
            text: sTOss(_clockModel.second),
            animationStyle: widget.digitAnimationStyle,
            textStyle: widget.secondDigitTextStyle ??
                TextStyle(
                    fontSize: widget.hourMinuteDigitTextStyle != null
                        ? widget.hourMinuteDigitTextStyle!.fontSize! / 2
                        : 15,
                    color: widget.hourMinuteDigitTextStyle != null
                        ? widget.hourMinuteDigitTextStyle!.color!
                        : Colors.white),
          ),
        )
      : Text("");

  Widget get _amPm => _clockModel.is24HourTimeFormat
      ? Text("")
      : Container(
          child: Text(
            hTOhh_24hFalse(_clockModel.hour)[1],
            style: widget.amPmDigitTextStyle ??
                TextStyle(
                    fontSize: widget.hourMinuteDigitTextStyle != null
                        ? widget.hourMinuteDigitTextStyle!.fontSize! / 2
                        : 15,
                    color: widget.hourMinuteDigitTextStyle != null
                        ? widget.hourMinuteDigitTextStyle!.color!
                        : Colors.white),
          ),
        );
}
