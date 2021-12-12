// ignore_for_file: constant_identifier_names

import 'dart:ffi';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:ezanimation/ezanimation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_color/src/helper.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/notification.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import '../../../main.dart';
import 'pref.dart';
import 'theme.dart';
import 'package:wakelock/wakelock.dart';

enum t {
  app_name,
  ok,
  cancel,
  greetings,
  alarm,
  timer,
  goal,
  record,
  prefer,
  system,
  app_appearance,
  change_lang,
  change_lang_sub,
  app_theme,
  app_theme_sub,
  light,
  dark,
  clock_appearance,
  clock_style,
  clock_style_sub,
  style12,
  style24,
  restart,
  clock_animation,
  clock_animation_sub,
  easeOutExpo,
  elasticOut,
  show_temp,
  clock_seconds,
  clock_seconds_sub,
  show_sec,
  not_show_sec,
  toast,
  toast_position,
  toast_position_sub,
  top,
  bottom,
  toast_duration,
  toast_duration_sub,
  duration,
  sec,
}

extension TypeExtension on t {
  String get t => describeEnum(this).tr();
  String p(int value) => describeEnum(this).plural(value);
}
