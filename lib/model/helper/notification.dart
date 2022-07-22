import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart' as a;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/model/state.dart';

enum NotificationChannelKey { test, ringtone, timekeeping }

enum NotificationActionKey { terminate, add10min, runNext }

enum NotificationType {
  normal(NotificationCategory.Reminder),
  alarm(NotificationCategory.Alarm),
  timekeeping(NotificationCategory.StopWatch);

  const NotificationType(this.value);
  final NotificationCategory value;
}

enum NotificationIdKey {
  test,
  alarmFinish,
  timerFinish,
  alarmTimeKeeping,
  timerAlarmKeeping,
  goalTimeKeeping,
}

class NotificationManager {
  void initialize() {
    AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelKey: NotificationChannelKey.ringtone.name,
        channelName: t.notif_description_ringtone.name,
        channelDescription: t.notif_description_ringtone_sub.t,
        ledColor: Colors.orange,
        onlyAlertOnce: false,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultRingtoneType: DefaultRingtoneType.Alarm,
        importance: NotificationImportance.Max,
        playSound: true,
      ),
      NotificationChannel(
        channelKey: NotificationChannelKey.timekeeping.name,
        channelName: t.notif_description_timekeeping.name,
        channelDescription: t.notif_description_timekeeping_sub.t,
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
        onlyAlertOnce: false,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultRingtoneType: DefaultRingtoneType.Notification,
        importance: NotificationImportance.Min,
        playSound: false,
      ),
      NotificationChannel(
        channelKey: NotificationChannelKey.test.name,
        channelName: t.notif_description_test.name,
        channelDescription: t.notif_description_test_sub.t,
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.orange,
        onlyAlertOnce: false,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultRingtoneType: DefaultRingtoneType.Alarm,
        importance: NotificationImportance.Max,
        playSound: true,
      ),
    ]);
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  void lateInitialize() {
    AwesomeNotifications().cancelAllSchedules();
    AwesomeNotifications().initialize(null, [
      NotificationChannel(
        channelKey: NotificationChannelKey.ringtone.name,
        channelName: t.notif_description_ringtone.name,
        channelDescription: t.notif_description_ringtone_sub.t,
        ledColor: Colors.orange,
        onlyAlertOnce: false,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultRingtoneType: DefaultRingtoneType.Alarm,
        importance: NotificationImportance.Max,
        playSound: true,
      ),
      NotificationChannel(
        channelKey: NotificationChannelKey.timekeeping.name,
        channelName: t.notif_description_timekeeping.name,
        channelDescription: t.notif_description_timekeeping_sub.t,
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
        onlyAlertOnce: false,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultRingtoneType: DefaultRingtoneType.Notification,
        importance: NotificationImportance.Min,
        playSound: false,
      ),
      NotificationChannel(
        channelKey: NotificationChannelKey.test.name,
        channelName: t.notif_description_test.name,
        channelDescription: t.notif_description_test_sub.t,
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.orange,
        onlyAlertOnce: false,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultRingtoneType: DefaultRingtoneType.Alarm,
        importance: NotificationImportance.Max,
        playSound: true,
      ),
    ]);
  }

  void test() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: NotificationIdKey.test.index,
        channelKey: NotificationChannelKey.test.name,
        category: NotificationType.normal.value,
        title: 'test',
      ),
    );
  }

  void alarmFinish({required DateTime target}) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: NotificationIdKey.alarmFinish.index,
        channelKey: NotificationChannelKey.ringtone.name,
        title: t.notif_content_alarm_title.t,
        body: t.notif_content_alarm_body.t,
        autoDismissible: true,
        category: NotificationType.alarm.value,
        displayOnBackground: true,
        displayOnForeground: true,
        wakeUpScreen: true,
        fullScreenIntent: true,
      ),
      schedule: NotificationCalendar.fromDate(date: target),
      actionButtons: [
        // NotificationActionButton(
        //   key: NotificationActionKey.terminate.name,
        //   label: t.notif_action_alarm_terminate.t,
        //   showInCompactView: true,
        // ),
        // NotificationActionButton(
        //   key: NotificationActionKey.add10min.name,
        //   label: ,
        // ),
      ],
    );
  }

  Future<void> timerFinish({required DateTime target}) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: NotificationIdKey.timerFinish.index,
        channelKey: NotificationChannelKey.ringtone.name,
        title: t.notif_content_timer_title.t,
        body: t.notif_content_timer_body.t,
        autoDismissible: true,
        category: NotificationType.alarm.value,
        displayOnBackground: true,
        displayOnForeground: true,
        showWhen: true,
        wakeUpScreen: true,
        fullScreenIntent: true,
      ),
      schedule: NotificationCalendar.fromDate(date: target),
      actionButtons: [
        // NotificationActionButton(
        //   key: 'SHOW_SERVICE_DETAILS',
        //   label: 'Show details',
        //   showInCompactView: true,
        // ),
        // NotificationActionButton(
        //   key: 'SHOW_SERVICE_DETAILS',
        //   label: 'Show details',
        // ),
      ],
    );
  }

  Future<void> alarmTimeKeeping({required DateTime target}) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: NotificationIdKey.alarmTimeKeeping.index,
        channelKey: NotificationChannelKey.timekeeping.name,
        title: t.notif_content_alarmTK_title
            .a(['${target.hour}:${target.minute}']),
        body: t.notif_content_alarm_body.t,
        category: NotificationType.timekeeping.value,
        backgroundColor: ColorKey.orange.value,
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: NotificationActionKey.terminate.name,
          label: t.notif_action_alarm_terminate.t,
          showInCompactView: true,
          buttonType: ActionButtonType.KeepOnTop,
        ),
        NotificationActionButton(
          key: NotificationActionKey.add10min.name,
          label: t.notif_action_alarm_add10min.t,
          showInCompactView: true,
          buttonType: ActionButtonType.KeepOnTop,
        ),
      ],
    );
  }

  Future<void> timerTimeKeeping({required DateTime target}) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: NotificationIdKey.timerAlarmKeeping.index,
        channelKey: NotificationChannelKey.timekeeping.name,
        title: t.notif_content_timerTK_title
            .a(['${target.hour}:${target.minute}']),
        body: t.notif_content_timerTK_body.t,
        category: NotificationType.timekeeping.value,
        backgroundColor: ColorKey.orange.value,
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: NotificationActionKey.terminate.name,
          label: t.notif_action_timer_terminate.t,
          showInCompactView: true,
          buttonType: ActionButtonType.KeepOnTop,
        ),
        NotificationActionButton(
          key: NotificationActionKey.add10min.name,
          label: t.notif_action_timer_add10min.t,
          showInCompactView: true,
          buttonType: ActionButtonType.KeepOnTop,
        ),
        NotificationActionButton(
          key: NotificationActionKey.runNext.name,
          label: t.notif_action_timer_runNext.t,
          showInCompactView: true,
          buttonType: ActionButtonType.KeepOnTop,
        ),
      ],
    );
  }

  Future<void> goalTimeKeeping({required DateTime from}) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: NotificationIdKey.goalTimeKeeping.index,
        channelKey: NotificationChannelKey.timekeeping.name,
        title: t.notif_content_goal_title.a(['${from.hour}:${from.minute}']),
        body: t.notif_content_goal_body.t,
        category: NotificationType.timekeeping.value,
        backgroundColor: ColorKey.orange.value,
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [],
    );
  }

  Future<void> cancelAllNotifications() async {
    await AwesomeNotifications().cancelAll();
    Logger.e(
      '- from NotificationManager \n >> Scheduled Notification canceled!',
    );
  }
}

class ToastManager {
  void toast({
    required BuildContext context,
    required WidgetRef ref,
    required int id,
  }) {
    var array = <dynamic>[]..length = 2;
    final topToast = ref.read(generalState).topToast;
    final duration = ref.read(generalState).toastDuration;
    switch (id) {
      case 0:
        array = <dynamic>[Colors.green[600], Icons.check, 'テスト通知'];
        break;
      case 1:
        array = <dynamic>[Colors.blue, Icons.light, '画面の消灯を一時的にOFFにしました'];
        break;
    }
    final color = array[0] as Color;

    a.showToastWidget(
      GestureDetector(
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: [
              BoxShadow(
                color: color.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(1, 1),
              ),
            ],
            color: color,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  array[1] as IconData,
                  color: Colors.white,
                ),
              ),
              Text(
                array[2] as String,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15)
            ],
          ),
        ),
        onVerticalDragEnd: (_) => a.ToastManager().dismissAll(showAnim: true),
      ),
      context: context,
      isIgnoring: false,
      animation: topToast
          ? a.StyledToastAnimation.slideFromTopFade
          : a.StyledToastAnimation.slideFromBottomFade,
      reverseAnimation: topToast
          ? a.StyledToastAnimation.slideToTopFade
          : a.StyledToastAnimation.slideToBottomFade,
      position: topToast
          ? const a.StyledToastPosition(align: Alignment.topCenter)
          : const a.StyledToastPosition(align: Alignment.bottomCenter),
      animDuration: const Duration(seconds: 1),
      duration: Duration(seconds: duration),
      curve: Curves.elasticOut,
      reverseCurve: Curves.easeOutCirc,
    );
  }
}
