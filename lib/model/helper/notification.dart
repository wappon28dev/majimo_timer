import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart' as a;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/helper/theme.dart';
import 'package:majimo_timer/model/helper/translations.dart';
import 'package:majimo_timer/model/state.dart';

enum NotificationChannelKey { ringtone, interval, timekeeping }

enum NotificationActionKey { terminate, timerAdd, intervalAdd }

enum NotificationIdKey {
  test,
  alarmFinish,
  timerFinish,
  alarmTimeKeeping,
  timerAlarmKeeping,
  goalTimeKeeping,
}

class NotificationManager {
  Map<NotificationIdKey, int> key = {
    NotificationIdKey.test: 0,
    NotificationIdKey.alarmFinish: 1,
    NotificationIdKey.timerFinish: 2,
    NotificationIdKey.alarmTimeKeeping: 3,
    NotificationIdKey.timerAlarmKeeping: 4,
    NotificationIdKey.goalTimeKeeping: 5
  };

  void initialize() {
    AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
            channelKey: NotificationChannelKey.ringtone.name,
            channelName: t.notification_ringtone.name,
            channelDescription: t.notification_ringtone_sub.t,
            ledColor: Colors.orange,
            onlyAlertOnce: false,
            defaultPrivacy: NotificationPrivacy.Public,
            defaultRingtoneType: DefaultRingtoneType.Alarm,
            importance: NotificationImportance.Max,
            playSound: true,
          )
        ]);
    AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
            channelKey: NotificationChannelKey.interval.name,
            channelName: t.notification_interval.name,
            channelDescription: t.notification_interval_sub.t,
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.orange,
            onlyAlertOnce: false,
            defaultPrivacy: NotificationPrivacy.Public,
            defaultRingtoneType: DefaultRingtoneType.Alarm,
            importance: NotificationImportance.Max,
            playSound: true,
          )
        ]);
    AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
            channelKey: NotificationChannelKey.timekeeping.name,
            channelName: t.notification_timekeeping.name,
            channelDescription: t.notification_timekeeping_sub.t,
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white,
            onlyAlertOnce: false,
            defaultPrivacy: NotificationPrivacy.Public,
            defaultRingtoneType: DefaultRingtoneType.Notification,
            importance: NotificationImportance.Min,
            playSound: false,
          )
        ]);
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // Insert here your friendly dialog box before call the request method
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  void lateInitialize() {
    AwesomeNotifications().cancelAllSchedules();
    AwesomeNotifications().setChannel(
      NotificationChannel(
        channelKey: NotificationChannelKey.ringtone.name,
        channelName: t.notification_ringtone.t,
        channelDescription: t.notification_ringtone_sub.t,
        ledColor: Colors.orange,
        onlyAlertOnce: false,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultRingtoneType: DefaultRingtoneType.Alarm,
        importance: NotificationImportance.Max,
        playSound: true,
      ),
    );
    AwesomeNotifications().setChannel(
      NotificationChannel(
        channelKey: NotificationChannelKey.interval.name,
        channelName: t.notification_interval.t,
        channelDescription: t.notification_interval_sub.t,
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.orange,
        onlyAlertOnce: false,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultRingtoneType: DefaultRingtoneType.Alarm,
        importance: NotificationImportance.Max,
        playSound: true,
      ),
    );
    AwesomeNotifications().setChannel(
      NotificationChannel(
        channelKey: NotificationChannelKey.timekeeping.name,
        channelName: t.notification_timekeeping.t,
        channelDescription: t.notification_timekeeping_sub.t,
        defaultColor: const Color(0xFF9D50DD),
        ledColor: Colors.white,
        onlyAlertOnce: false,
        defaultPrivacy: NotificationPrivacy.Public,
        defaultRingtoneType: DefaultRingtoneType.Notification,
        importance: NotificationImportance.Min,
        playSound: false,
      ),
    );
  }

  void test() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: key[NotificationIdKey.test]!,
        channelKey: NotificationChannelKey.interval.name,
        title: 'test',
      ),
    );
  }

  void alarmFinish({required DateTime target}) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: key[NotificationIdKey.alarmFinish]!,
        channelKey: NotificationChannelKey.ringtone.name,
        title: '時間です！',
        body: 'from まじもタイマー',
        autoDismissible: true,
        category: NotificationCategory.Alarm,
        displayOnBackground: true,
        displayOnForeground: true,
        wakeUpScreen: true,
        fullScreenIntent: true,
      ),
      schedule: NotificationCalendar.fromDate(date: target),
      actionButtons: [
        NotificationActionButton(
          key: 'SHOW_SERVICE_DETAILS',
          label: 'Show details',
          showInCompactView: true,
        ),
        NotificationActionButton(
          key: 'SHOW_SERVICE_DETAILS',
          label: 'Show details',
        ),
      ],
    );
  }

  Future<void> timerFinish({required DateTime target}) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: key[NotificationIdKey.timerFinish]!,
        channelKey: NotificationChannelKey.ringtone.name,
        title: '時間です！',
        body: 'from まじもタイマー',
        autoDismissible: true,
        category: NotificationCategory.Alarm,
        displayOnBackground: true,
        displayOnForeground: true,
        showWhen: true,
        wakeUpScreen: true,
        fullScreenIntent: true,
      ),
      schedule: NotificationCalendar.fromDate(date: target),
      actionButtons: [
        NotificationActionButton(
          key: 'SHOW_SERVICE_DETAILS',
          label: 'Show details',
          showInCompactView: true,
        ),
        NotificationActionButton(
          key: 'SHOW_SERVICE_DETAILS',
          label: 'Show details',
        ),
      ],
    );
  }

  Future<void> alarmTimeKeeping({required DateTime target}) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: key[NotificationIdKey.alarmTimeKeeping]!,
        channelKey: NotificationChannelKey.timekeeping.name,
        title: 'じこくモードで計測中... ・ ${target.hour}:${target.minute}まで',
        body: 'from まじもタイマー',
        category: NotificationCategory.Service,
        backgroundColor: ColorKey.orange.value,
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'SHOW_SERVICE_DETAILS',
          label: '中止',
          showInCompactView: true,
          buttonType: ActionButtonType.DisabledAction,
        ),
        NotificationActionButton(key: 'SHOW_SERVICE_DETAILS', label: '5分追加'),
      ],
    );
  }

  Future<void> timerTimeKeeping({required DateTime target}) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: key[NotificationIdKey.timerAlarmKeeping]!,
        channelKey: NotificationChannelKey.timekeeping.name,
        title: 'じかんモードで計測中... ・ ${target.hour}:${target.minute}まで',
        body: 'from まじもタイマー',
        category: NotificationCategory.StopWatch,
        backgroundColor: ColorKey.orange.value,
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: NotificationActionKey.terminate.name,
          label: '中止',
          showInCompactView: true,
        ),
        NotificationActionButton(
          key: NotificationActionKey.timerAdd.name,
          label: '5分追加',
        ),
      ],
    );
  }

  Future<void> goalTimeKeeping({required DateTime from}) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: key[NotificationIdKey.goalTimeKeeping]!,
        channelKey: NotificationChannelKey.timekeeping.name,
        title: 'もくひょうモードで計測中... ${from.hour}:${from.minute}から',
        body: 'from まじもタイマー',
        category: NotificationCategory.StopWatch,
        backgroundColor: ColorKey.orange.value,
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: NotificationActionKey.terminate.name,
          label: '中止',
          showInCompactView: true,
        ),
        NotificationActionButton(
          key: NotificationActionKey.timerAdd.name,
          label: '5分追加',
        ),
      ],
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
