import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/plugin/let_log/let_log.dart';
import 'package:workmanager/workmanager.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

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
              ledColor: Colors.white)
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

  static void background() {
    Logger.i("called background");
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 10,
            channelKey: 'basic_channel',
            title: 'バックグラウンド処理テスト',
            body: 'from まじもタイマー'));
  }
}

class ToastManager {
  static void toast({required BuildContext context, required int id}) {
    get({required int mode}) {
      switch (id) {
        case 0:
          switch (mode) {
            case 0:
              return Colors.green[600];
            case 1:
              return Icons.check;
            case 2:
              return "テスト通知";
          }
          break;
        case 1:
          switch (mode) {
            case 0:
              return Colors.blue;
            case 1:
              return Icons.light;
            case 2:
              return "画面の消灯を一時的にOFFにしました";
          }
          break;
      }
    }

    showToastWidget(
      Container(
        // 内側の余白（パディング）
        padding: EdgeInsets.all(5),
        // 外側の余白（マージン）
        margin: EdgeInsets.all(2),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: get(mode: 0) as Color,
        ),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  get(mode: 1) as IconData,
                  color: Colors.white,
                ),
              ),
              Text(
                get(mode: 2).toString(),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15)
            ]),
      ),
      context: context,
      isIgnoring: false,
      animation: StyledToastAnimation.slideFromBottomFade,
      reverseAnimation: StyledToastAnimation.slideToBottomFade,
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 5),
      curve: Curves.elasticOut,
      reverseCurve: Curves.easeOutCirc,
    );
  }
}
