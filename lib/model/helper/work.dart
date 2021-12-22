import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:workmanager/workmanager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import 'notification.dart';

enum TaskName { Alarm_finish }

class WorkManager {
  // static notification() async {
  //   const url = "https://majimo.jp/app/a";
  //   await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  //   print("hello");
  //   AwesomeNotifications().createNotification(
  //       content: NotificationContent(
  //           id: 10,
  //           channelKey: 'basic_channel',
  //           title: 'Simple Notification',
  //           body: 'Simple body'));
  // }
  void register({required TaskName task, required Duration duration}) {
    reset(task: task);
    Workmanager().registerOneOffTask(
      task.index.toString(),
      task.name,
      initialDelay: duration,
    );
  }

  void reset({required TaskName task}) {
    Workmanager().cancelByUniqueName(task.index.toString());
  }
}
