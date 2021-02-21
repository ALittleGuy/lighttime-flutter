import 'package:flutter/cupertino.dart';
import 'package:lighttime_flutter/common/global.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class TaskChannel {
  static TaskChannel _instance;

  static String _BASE_IP = "ws://10.0.2.2:6250/websocket/test";

  TaskChannel._internal();

  factory TaskChannel.getInstance() => _getInstance();

  static _getInstance() {
    if (_instance == null) {
      _instance = TaskChannel._internal();
    }
    return _instance;
  }

  static WebSocketChannel _taskChannel;

  bool connect() {
    if (true) {
      // _BASE_IP = _BASE_IP + "?from=${Global.profile.user.email}";
      _BASE_IP = "ws://10.0.2.2:6250/websocket/test?from=123@qq.com";
      _taskChannel = IOWebSocketChannel.connect(_BASE_IP);
      print('连接成功');
      _taskChannel.stream.listen((event) {
        print('接受信息');
        onMessage(event);
      }, onDone: () {
        print('message send success');
      }, onError: (e) {
        print('on error');
        throw e;
      });
      return true;
    } else {
      return false;
    }
  }

  bool sendMessage(String message) {
    _taskChannel.sink.add(message);
    return true;
  }

  onMessage(data) {
    print(data);
  }
}
