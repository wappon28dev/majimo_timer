import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majimo_timer/view/components/appbar.dart';

part 'log_widget.dart';

enum _Type { info, event, save, restore }

List<String> _printNames = [
  '[Application-Info]',
  '[Application-Event]',
  '[Manager-Save-Info]',
  '[Manager-Restore-Info]',
  '❌',
  '⬆️',
  '⬇️'
];
List<String> _tabNames = [
  '[Info]',
  '[Event]',
  '[Save]',
  '[Restore]',
  '[Error]'
];
final RegExp _tabReg = RegExp(r'\[|\]');

String _getTabName(int index) {
  return _tabNames[index].replaceAll(_tabReg, '');
}

class _Config {
  /// Whether to display the log in reverse order
  bool reverse = false;

  /// Whether or not to print logs in the ide
  bool printNet = true;

  /// Whether or not to print net logs in the ide
  bool printLog = true;

  /// Maximum number of logs, larger than this number, will be cleaned up, default value 500
  int maxLimit = 500;
}

class Logger extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar:
          commonAppbar(context: context, ref: ref, title: 'majimo_timer_log'),
      body: const LogWidget(),
    );
  }

  static bool enabled = true;
  static _Config config = _Config();

  /// Logging
  static void i(Object message, [Object? detail]) {
    if (enabled) _Log.add(_Type.info, message, detail);
  }

  /// Record debug information
  static void e(Object message, [Object? detail]) {
    if (enabled) _Log.add(_Type.event, message, detail);
  }

  /// Record debug information
  static void s(Object message, [Object? detail]) {
    if (enabled) _Log.add(_Type.save, message, detail);
  }

  /// Record warnning information
  static void r(Object message, [Object? detail]) {
    if (enabled) _Log.add(_Type.restore, message, detail);
  }

  /// Start recording time
  static void time(Object key) {
    if (enabled) _Log.time(key);
  }

  /// End of record time
  static void endTime(Object key) {
    if (enabled) _Log.endTime(key);
  }

  /// Clearance log
  static void clear() {
    _Log.clear();
  }

  /// Recording network information
  static void net(String api,
      {String type = 'Http', int status = 100, Object? data,}) {
    if (enabled) _Net.request(api, type, status, data);
  }

  /// End of record network information, with statistics on duration and size.
  static void endNet(String api,
      {int status = 200, Object? data, Object? headers, String? type,}) {
    if (enabled) _Net.response(api, status, data, headers, type);
  }
}

class _Log {

  const _Log({this.type, this.message, this.detail, this.start});
  static final List<_Log> list = [];
  static final ValueNotifier<int> length = ValueNotifier(0);
  static final Map<Object, Object> _map = {};

  final _Type? type;
  final String? message;
  final String? detail;
  final DateTime? start;

  String get typeName {
    return _printNames[type!.index];
  }

  String get tabName {
    return _tabNames[type!.index];
  }

  bool contains(String keyword) {
    if (keyword.isEmpty) return true;
    return message != null && message!.contains(keyword) ||
        detail != null && detail!.contains(keyword);
  }

  @override
  String toString() {
    final sb = StringBuffer();
    sb.writeln('Message: $message');
    sb.writeln('Time: $start');
    if (detail != null && detail!.length > 100) {
      sb.writeln('Detail: ');
      sb.writeln(detail);
    } else {
      sb.writeln('Detail: $detail');
    }

    return sb.toString();
  }

  static void add(_Type type, Object value, Object? detail) {
    final log = _Log(
      type: type,
      message: value.toString(),
      detail: detail?.toString(),
      start: DateTime.now(),
    );
    list.add(log);
    _clearWhenTooMuch();
    length.value++;
    if (Logger.config.printLog) {
      debugPrint(
          "--------------------------------\n${log.typeName}\n${log.message}${log.detail == null ? '' : '\n${log.detail}'}\n--------------------------------",);
    }
  }

  static void _clearWhenTooMuch() {
    if (list.length > Logger.config.maxLimit) {
      list.removeRange(0, (Logger.config.maxLimit * 0.2).ceil());
    }
  }

  static void time(Object key) {
    _map[key] = DateTime.now();
  }

  static void endTime(Object key) {
    final data = _map[key];
    if (data != null) {
      _map.remove(key);
      final spend = DateTime.now().difference(data as DateTime).inMilliseconds;
      _Log.add(_Type.info, '$key: $spend ms', null);
    }
  }

  static void clear() {
    list.clear();
    _map.clear();
    length.value = 0;
  }
}

class _Net extends ChangeNotifier {

  _Net({
    this.api,
    this.type,
    this.req,
    this.start,
    this.status = 100,
  });
  static const all = 'All';
  static final List<_Net> list = [];
  static final ValueNotifier<int> length = ValueNotifier(0);
  static final Map<String, _Net> _map = {};
  static final List<String> types = [all];
  static final ValueNotifier<int> typeLength = ValueNotifier(1);

  final String? api;
  final String? req;
  final DateTime? start;
  String? type;
  int status = 100;
  int spend = 0;
  String? res;
  String? headers;
  bool showDetail = false;
  int _reqSize = -1;
  int _resSize = -1;

  int getReqSize() {
    if (_reqSize > -1) return _reqSize;
    if (req != null && req!.isNotEmpty) {
      try {
        return _reqSize = utf8.encode(req!).length;
      } catch (e) {
        // print(e);
      }
    }
    return 0;
  }

  int getResSize() {
    if (_resSize > -1) return _resSize;
    if (res != null && res!.isNotEmpty) {
      try {
        return _resSize = utf8.encode(res!).length;
      } catch (e) {
        // print(e);
      }
    }
    return 0;
  }

  bool contains(String keyword) {
    if (keyword.isEmpty) return true;
    return api!.contains(keyword) ||
        req != null && req!.contains(keyword) ||
        res != null && res!.contains(keyword);
  }

  @override
  String toString() {
    final sb = StringBuffer();
    sb.writeln('[$status] $api');
    sb.writeln('Start: $start');
    sb.writeln('Spend: $spend ms');
    sb.writeln('Headers: $headers');
    sb.writeln('Request: $req');
    sb.writeln('Response: $res');
    return sb.toString();
  }

  static void request(String api, String type, int status, Object? data) {
    final net = _Net(
      api: api,
      type: type,
      status: status,
      req: data?.toString(),
      start: DateTime.now(),
    );
    list.add(net);
    _map[api] = net;
    if (type != '' && !types.contains(type)) {
      types.add(type);
      typeLength.value++;
    }
    _clearWhenTooMuch();
    length.value++;
    if (Logger.config.printNet) {
      debugPrint(
          "${_printNames[4]} ${'$type: '}${net.api}${net.req == null ? '' : '\nData: ${net.req}'}\n--------------------------------",);
    }
  }

  static void _clearWhenTooMuch() {
    if (list.length > Logger.config.maxLimit) {
      list.removeRange(0, (Logger.config.maxLimit * 0.2).ceil());
    }
  }

  static void response(
      String api, int status, Object? data, Object? headers, String? type,) {
    var net = _map[api];
    if (net != null) {
      _map.remove(net);
      net.spend = DateTime.now().difference(net.start!).inMilliseconds;
      net.status = status;
      net.headers = headers?.toString();
      net.res = data?.toString();
      length.notifyListeners();
    } else {
      net = _Net(api: api, start: DateTime.now(), type: type);
      net.status = status;
      net.headers = headers?.toString();
      net.res = data?.toString();
      list.add(net);
      _clearWhenTooMuch();
      length.value++;
    }
    if (Logger.config.printNet) {
      debugPrint(
          "${_printNames[5]} ${net.type == null ? '' : '${net.type}: '}${net.api}${net.res == null ? '' : '\nData: ${net.res}'}\nSpend: ${net.spend} ms\n--------------------------------",);
    }
  }

  static void clear() {
    list.clear();
    _map.clear();
    length.value = 0;
  }
}
