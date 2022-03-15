import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

enum t {
  app_name,
  lang,
  ok,
  cancel,
  greetings,
  alarm,
  timer,
  goal,
  record,
  notification_ringtone,
  notification_ringtone_sub,
  notification_interval,
  notification_interval_sub,
  notification_timekeeping,
  notification_timekeeping_sub,
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
  notification,
  about,
  change_log,
  change_log_sub,
  app_maker,
  app_maker_sub,
  github,
  github_sub,
  license,
  license_sub
}

extension TypeExtension on t {
  String get t => describeEnum(this).tr();
  String p(int value) => describeEnum(this).plural(value);
}
