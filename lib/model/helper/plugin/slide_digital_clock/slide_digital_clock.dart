import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/controller/controller.dart';
import 'package:majimo_timer/main.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart' as p;
import 'helpers/clock_model.dart';
import 'helpers/spinner_text.dart';

Widget largeclock(BuildContext context, WidgetRef ref, bool value,
    [bool? isExpand]) {
  final clockmanager = ref.read(clockState);
  final colormanager = ref.read(colorState);
  final isLight = ref.read(themeState.notifier).isLight(context: context);

  final color = value
      ? ref.read(colorState).color_clockcolor(context: context, ref: ref)
      : Colors.white;
  final flame = (isExpand ?? false)
      ? (value
          ? isLight
              ? Colors.white
              : Colors.black
          : Colors.white)
      : Colors.transparent;

  return DigitalClock(
    digitAnimationStyle: ref.read(clockState).animation_curve,
    showSecondsDigit: clockmanager.showSec,
    is24HourTimeFormat: clockmanager.is24,
    areaDecoration: const BoxDecoration(
      color: Colors.transparent,
    ),
    hourMinuteDigitTextStyle: TextStyle(
      fontSize: 50,
      color: color,
      wordSpacing: 5,
      fontWeight: FontWeight.bold,
    ),
    hourMinuteDigitDecoration: const BoxDecoration(color: Colors.transparent),
    amPmDigitTextStyle: TextStyle(
        fontSize: 15, height: 2, color: color, fontWeight: FontWeight.bold),
    secondDigitTextStyle: TextStyle(
        fontSize: 20, height: 1.5, color: color, fontWeight: FontWeight.bold),
    secondDigitDecoration: const BoxDecoration(color: Colors.transparent),
    areaAligment: AlignmentDirectional.center,
    flame: flame,
  );
}

Widget smallclock(BuildContext context, WidgetRef ref, bool value) {
  final clockmanager = ref.read(clockState);
  final colormanager = ref.read(colorState);
  final color = value
      ? colormanager.color_clockcolor(context: context, ref: ref)
      : Colors.white;

  return p.DigitalClock(
    digitAnimationStyle: clockmanager.animation_curve,
    showSecondsDigit: ref.read(clockState).showSec,
    is24HourTimeFormat: ref.read(clockState).is24,
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
    this.flame,
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
  final Color? flame;

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
    return Container(
      alignment: Alignment.center,
      width: widget.areaWidth ??
          (widget.hourMinuteDigitTextStyle != null
              ? widget.hourMinuteDigitTextStyle!.fontSize! * 7
              : 180),
      height: widget.areaHeight,
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
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _hour(),
            Stack(children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: SpinnerText(
                      text: ":",
                      textStyle: widget.hourMinuteDigitTextStyle?.copyWith(
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 5
                            ..color = widget.flame ?? Colors.transparent))),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  child: SpinnerText(
                    text: ":",
                    textStyle: widget.hourMinuteDigitTextStyle,
                  )),
            ]),
            _minute,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
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
        child: Stack(children: [
          SpinnerText(
            text: _clockModel.is24HourTimeFormat
                ? hTOhh_24hTrue(_clockModel.hour).toString()
                : hTOhh_24hFalse(_clockModel.hour)[0].toString(),
            animationStyle: widget.digitAnimationStyle,
            textStyle: widget.hourMinuteDigitTextStyle?.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 5
                ..color = widget.flame ?? Colors.transparent,
            ),
          ),
          SpinnerText(
            text: _clockModel.is24HourTimeFormat
                ? hTOhh_24hTrue(_clockModel.hour).toString()
                : hTOhh_24hFalse(_clockModel.hour)[0].toString(),
            animationStyle: widget.digitAnimationStyle,
            textStyle: widget.hourMinuteDigitTextStyle,
          )
        ]),
      );

  Widget get _minute => Container(
      decoration: widget.hourMinuteDigitDecoration ??
          BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5)),
      child: Stack(children: [
        SpinnerText(
          text: mTOmm(_clockModel.minute),
          animationStyle: widget.digitAnimationStyle,
          textStyle: widget.hourMinuteDigitTextStyle?.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 5
              ..color = widget.flame ?? Colors.transparent,
          ),
        ),
        SpinnerText(
          text: mTOmm(_clockModel.minute),
          animationStyle: widget.digitAnimationStyle,
          textStyle: widget.hourMinuteDigitTextStyle,
        ),
      ]));

  Widget get _second => widget.showSecondsDigit != false
      ? Container(
          padding: EdgeInsets.only(bottom: 0, left: 8, right: 8),
          decoration: widget.secondDigitDecoration ??
              BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5)),
          child: Stack(children: [
            SpinnerText(
                text: sTOss(_clockModel.second),
                animationStyle: widget.digitAnimationStyle,
                textStyle: widget.secondDigitTextStyle!.copyWith(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 5
                    ..color = widget.flame ?? Colors.transparent,
                )),
            SpinnerText(
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
          ]))
      : (widget.is24HourTimeFormat ?? false)
          ? const SizedBox()
          : Container(
              padding: EdgeInsets.only(bottom: 0, left: 8, right: 8),
              decoration: widget.secondDigitDecoration ??
                  BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
              child: Stack(children: [
                SpinnerText(
                    text: sTOss(_clockModel.second),
                    animationStyle: widget.digitAnimationStyle,
                    textStyle: widget.secondDigitTextStyle!
                        .copyWith(color: Colors.transparent)),
              ]));

  Widget get _amPm => _clockModel.is24HourTimeFormat
      ? !(widget.showSecondsDigit ?? true)
          ? SizedBox()
          : Container(
              child: Stack(children: [
              Text(hTOhh_24hFalse(_clockModel.hour)[1].toString(),
                  style: widget.amPmDigitTextStyle
                      ?.copyWith(color: Colors.transparent))
            ]))
      : Container(
          child: Stack(children: [
          Text(hTOhh_24hFalse(_clockModel.hour)[1].toString(),
              style: widget.amPmDigitTextStyle!.copyWith(
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 3
                  ..color = widget.flame ?? Colors.transparent,
              )),
          Text(
            hTOhh_24hFalse(_clockModel.hour)[1].toString(),
            style: widget.amPmDigitTextStyle ??
                TextStyle(
                    fontSize: widget.hourMinuteDigitTextStyle != null
                        ? widget.hourMinuteDigitTextStyle!.fontSize! / 2
                        : 15,
                    color: widget.hourMinuteDigitTextStyle != null
                        ? widget.hourMinuteDigitTextStyle!.color!
                        : Colors.white),
          ),
        ]));
}
