class ClockModel {
  late int hour;
  late int minute;
  late int second;
  late bool is24HourFormat;

  bool get is24HourTimeFormat => this.is24HourFormat;
}

String hTOhh_24hTrue(int hour) {
  late String sHour;
  if (hour < 10) {
    sHour = '$hour';
  } else {
    sHour = '$hour';
  }
  return sHour;
}

List hTOhh_24hFalse(int hour) {
  late String sHour;
  late String h12State;
  var times = <String>[];
  if (hour < 10) {
    sHour = '$hour';
    h12State = 'AM';
  } else if (hour > 9 && hour < 13) {
    sHour = '$hour';
    h12State = 'AM';
  } else if (hour > 12 && hour < 22) {
    sHour = '${hour % 12}';
    h12State = 'PM';
  } else if (hour > 21) {
    sHour = '${hour % 12}';
    h12State = 'PM';
  }
  times.add(sHour);
  times.add(h12State);
  return times;
}

String mTOmm(int minute) {
  late String sMinute;
  if (minute < 10) {
    sMinute = '0$minute';
  } else {
    sMinute = '$minute';
  }
  return sMinute;
}

String sTOss(int second) {
  late String sSecond;
  if (second < 10) {
    sSecond = '0$second';
  } else {
    sSecond = '$second';
  }
  return sSecond;
}
