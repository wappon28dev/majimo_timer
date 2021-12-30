// ignore_for_file: avoid_classes_with_only_static_members, non_constant_identifier_names

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart' as a;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:simple_animations/simple_animations.dart';

class NotificationManager {
  static void initialize() {
    AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
              channelKey: 'basic_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: const Color(0xFF9D50DD),
              ledColor: Colors.white,
              onlyAlertOnce: false,
              importance: NotificationImportance.Max)
        ]);
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // Insert here your friendly dialog box before call the request method
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  static void test() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 10,
            channelKey: 'basic_channel',
            title: 'フォアグラウンド処理テスト',
            body: 'from まじもタイマー'));
  }

  // static void background() {
  //   Logger.i('called background');
  //   AwesomeNotifications().createNotification(
  //       content: NotificationContent(
  //           id: 10,
  //           channelKey: 'basic_channel',
  //           title: 'バックグラウンド処理テスト',
  //           body: 'from まじもタイマー'));
  // }

  void alarm_finish({required DateTime target}) {
    Logger.i('finish AlarmMode');
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
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
              showInCompactView: true),
          NotificationActionButton(
              key: 'SHOW_SERVICE_DETAILS', label: 'Show details'),
        ]);
  }

  Future<void> alarm_tk({required Duration duration}) async {
    final target = duration;
    await Future<void>.delayed(const Duration(seconds: 1));
    final Duration current = duration - const Duration(seconds: 1);
    final int rate = (current.inSeconds / target.inSeconds * 100).toInt();

    await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: 'basic_channel',
          title: '計測中...',
          body: 'from まじもタイマー',
          category: NotificationCategory.Progress,
          notificationLayout: NotificationLayout.ProgressBar,
          progress: rate,
        ),
        actionButtons: [
          NotificationActionButton(
              key: 'SHOW_SERVICE_DETAILS',
              label: 'Show details',
              showInCompactView: true),
          NotificationActionButton(
              key: 'SHOW_SERVICE_DETAILS', label: 'Show details'),
        ]);
  }

  void cancel_notification() {
    AwesomeNotifications().cancelAll();
    Logger.i("cancel!!!");
  }
}

class ToastManager {
  static void toast({
    required BuildContext context,
    required WidgetRef ref,
    required int id,
  }) {
    var _array = <dynamic>[]..length = 2;
    final _topToast = ref.read(generalManager).topToast;
    final _duration = ref.read(generalManager).toastDuration;
    switch (id) {
      case 0:
        _array = <dynamic>[Colors.green[600]!, Icons.check, 'テスト通知'];
        break;
      case 1:
        _array = <dynamic>[Colors.blue, Icons.light, '画面の消灯を一時的にOFFにしました'];
        break;
    }

    a.showToastWidget(
      GestureDetector(
        child: Container(
          // 内側の余白（パディング）
          padding: const EdgeInsets.all(5),
          // 外側の余白（マージン）
          margin: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: _array[0] as Color,
          ),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    _array[1] as IconData,
                    color: Colors.white,
                  ),
                ),
                Text(
                  _array[2] as String,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 15)
              ]),
        ),
        onVerticalDragEnd: (_) => a.ToastManager().dismissAll(showAnim: true),
      ),
      context: context,
      isIgnoring: false,
      animation: _topToast
          ? a.StyledToastAnimation.slideFromTopFade
          : a.StyledToastAnimation.slideFromBottomFade,
      reverseAnimation: _topToast
          ? a.StyledToastAnimation.slideToTopFade
          : a.StyledToastAnimation.slideToBottomFade,
      position: _topToast
          ? const a.StyledToastPosition(align: Alignment.topCenter)
          : const a.StyledToastPosition(align: Alignment.bottomCenter),
      animDuration: const Duration(seconds: 1),
      duration: Duration(seconds: _duration),
      curve: Curves.elasticOut,
      reverseCurve: Curves.easeOutCirc,
    );
  }
}
