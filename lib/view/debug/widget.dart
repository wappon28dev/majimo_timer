import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/model/helper/config.dart';
import 'package:majimo_timer/model/helper/notification.dart';
import 'package:majimo_timer/model/helper/plugin/let_log/let_log.dart';
import 'package:majimo_timer/model/helper/route.dart';
import 'package:majimo_timer/view/debug/body.dart';

Widget debug({required BuildContext context, required WidgetRef ref}) {
  final colorScheme = Theme.of(context).colorScheme;

  return Column(
    children: [
      Card(
        elevation: 0,
        margin: const EdgeInsets.all(20),
        color: colorScheme.tertiaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: colorScheme.tertiary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  'このアプリはベータ版です',
                ),
                subtitle: Text(
                  '>> ${AppDataStore().versionStr}\n'
                  ' ${AppDataStore().buildDate}\n'
                  '${AppDataStore().changeLog}',
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: Platform.isAndroid ? 'monospace' : 'Menlo',
                    color: colorScheme.onBackground,
                  ),
                ),
                leading: const Icon(
                  Icons.bug_report,
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          NotificationManager().test();
                          Logger.e(
                            '- from majimo_timer/lib/view/home/root/widget.dart \n'
                            ' > notification test',
                          );
                        },
                        icon: const Icon(Icons.notifications_active),
                      ),
                      const Text(
                        'ローカル通知を送信',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          ToastManager()
                              .toast(context: context, ref: ref, id: 0);
                          Logger.e(
                            '- from majimo_timer/lib/view/home/root/widget.dart \n'
                            ' > toast test',
                          );
                        },
                        icon: const Icon(Icons.circle_notifications),
                      ),
                      const Text(
                        'トースト通知を送信',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          RouteManager().runPush(
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
                      ),
                      const Text(
                        'アプリのログを見る',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  SizedBox(width: 10),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
      ),
      Card(
        elevation: 0,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        color: colorScheme.tertiaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: colorScheme.tertiary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: const [
              ListTile(
                title: AutoSizeText(
                  '皆さんにやってほしいこと',
                ),
                leading: Icon(
                  Icons.info_outline,
                ),
              ),
              Divider(
                thickness: 2,
              ),
              ListTile(
                title: AutoSizeText(
                  '１. アプリが強制終了しないか',
                  maxLines: 1,
                ),
                leading: Icon(
                  Icons.running_with_errors_sharp,
                ),
              ),
              ListTile(
                title: AutoSizeText(
                  '２. レイアウトが崩れてないか',
                  maxLines: 1,
                ),
                leading: Icon(
                  Icons.layers,
                ),
              ),
              ListTile(
                title: AutoSizeText(
                  '３. 変な挙動はないか',
                  maxLines: 1,
                ),
                leading: Icon(
                  Icons.account_tree,
                ),
              ),
              ListTile(
                title: AutoSizeText(
                  '４. 通知は機能しているか',
                  maxLines: 1,
                ),
                leading: Icon(
                  Icons.notification_important,
                ),
              ),
              ListTile(
                title: AutoSizeText(
                  '５. アラームは作動するか',
                  maxLines: 1,
                ),
                leading: Icon(
                  Icons.alarm_on,
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Text(
                '上記に当てはまる挙動があったら, \nその手順をslackまで！\n(ログをスクショしてくれると嬉しい！)',
              )
            ],
          ),
        ),
      ),
    ],
  );
}
