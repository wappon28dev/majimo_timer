import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/main.dart';
import 'package:majimo_timer/model/helper/config.dart';
import 'package:majimo_timer/model/helper/notification.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/view/debug/body.dart';

Widget debug({required BuildContext context, required WidgetRef ref}) {
  return Column(
    children: [
      Card(
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.purple,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  'このアプリはベータ版です',
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  '>> ${AppDataStore().versionStr} << \n ${AppDataStore().buildDate} \n ${AppDataStore().changeLog}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily:
                        Platform.isAndroid ? 'monospace' : 'Menlo-Regular',
                  ),
                ),
                leading: const Icon(
                  Icons.bug_report,
                  color: Colors.white,
                ),
                onTap: () {},
              ),
              const Divider(
                thickness: 2,
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      NotificationManager().test();
                      Logger.e(
                        '- from majimo_timer/lib/view/home/root/widget.dart \n'
                        ' > notification test',
                      );
                    },
                    icon: const Icon(Icons.notifications_active),
                    color: Colors.white,
                  ),
                  const SizedBox(width: 2),
                  IconButton(
                    onPressed: () {
                      ToastManager().toast(context: context, ref: ref, id: 0);
                      Logger.e(
                        '- from majimo_timer/lib/view/home/root/widget.dart \n'
                        ' > toast test',
                      );
                    },
                    icon: const Icon(Icons.circle_notifications),
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: () {
                      ref.read(generalState.notifier).runPush(
                            context: context,
                            page: const Debug(),
                            isReplace: false,
                          );
                      Logger.e(
                        '- from majimo_timer/lib/view/home/root/widget.dart \n'
                        ' > debug page opened',
                      );
                    },
                    icon: const Icon(Icons.developer_mode),
                    color: Colors.white,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'ローカル通知を送信',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'トースト通知を送信',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'アプリのログを見る',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      Card(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.cyan.shade600,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ListTile(
                  title: const AutoSizeText(
                    '皆さんにやってほしいこと',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                  onTap: () {}),
              const Divider(
                thickness: 2,
                color: Colors.white,
              ),
              ListTile(
                  title: const AutoSizeText(
                    '１. アプリが強制終了しないか',
                    style: TextStyle(color: Colors.white),
                    maxLines: 1,
                  ),
                  leading: const Icon(
                    Icons.running_with_errors_sharp,
                    color: Colors.white,
                  ),
                  onTap: () {}),
              ListTile(
                  title: const AutoSizeText(
                    '２. レイアウトが崩れてないか',
                    style: TextStyle(color: Colors.white),
                    maxLines: 1,
                  ),
                  leading: const Icon(
                    Icons.layers,
                    color: Colors.white,
                  ),
                  onTap: () {}),
              ListTile(
                  title: const AutoSizeText(
                    '３. 変な挙動はないか',
                    style: TextStyle(color: Colors.white),
                    maxLines: 1,
                  ),
                  leading: const Icon(
                    Icons.account_tree,
                    color: Colors.white,
                  ),
                  onTap: () {}),
              ListTile(
                  title: const AutoSizeText(
                    '４. 通知は機能しているか',
                    style: TextStyle(color: Colors.white),
                    maxLines: 1,
                  ),
                  leading: const Icon(
                    Icons.notification_important,
                    color: Colors.white,
                  ),
                  onTap: () {}),
              ListTile(
                  title: const AutoSizeText(
                    '５. アラームは作動するか',
                    style: TextStyle(color: Colors.white),
                    maxLines: 1,
                  ),
                  leading: const Icon(
                    Icons.alarm_on,
                    color: Colors.white,
                  ),
                  onTap: () {}),
              const Divider(
                thickness: 2,
                color: Colors.white,
              ),
              const Text(
                  '上記に当てはまる挙動があったら, \nその手順をdiscordまで！\n(ログをスクショしてくれると嬉しい！)',
                  style: TextStyle(color: Colors.white))
            ],
          ),
        ),
      ),
    ],
  );
}
