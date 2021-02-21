import 'package:flutter/material.dart';
import 'package:lighttime_flutter/common/database/databaseServer.dart';
import 'package:lighttime_flutter/common/models/index.dart';
import 'package:lighttime_flutter/common/page/taskList.dart';
import 'package:lighttime_flutter/common/widgets/drawer.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'login.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  static final sname = "home";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WebSocketChannel _channel;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Light Time"),
      ),
      drawer: getDrawer(context),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (true) {
      return new Container(
        child: new Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(30),
                child: new RaisedButton(
                    onPressed: () =>
                        Navigator.pushNamed(this.context, Login.sname)),
              ),
              FlatButton(
                  onPressed: () {
                    _channel = IOWebSocketChannel.connect(
                        "ws://10.0.2.2:6250/websocket/test?from=1@qq.com");
                  },
                  child: Text("连接")),
              FlatButton(
                  onPressed: () {
                    Task temp = new Task();
                    temp.sponsor = "asdasdasd";
                    temp.title = "task1";
                    temp.content = "asdsadsa";
                    print(temp.toString());
                    _channel.sink.add(temp.toString());
                  },
                  child: Text("发送消息")),
              FlatButton(
                  onPressed: () {
                    Task task = new Task();
                    task.title = "asdsad";
                    task.id = 123;
                    task.status = 12;
                    task.content = "sadasd";
                    task.sponsor = "asdasd";
                    task.catalog = 2;
                    task.deadline = "sadasd";
                    task.lauchdate = "sadasd";
                    task.principal = "asdasd";
                    task.tag = "sadasd";
                    DatabaseServer.getInstance().insert(task);
                    print("插入成功");
                  },
                  child: Text("添加数据")),
              FlatButton(
                  onPressed: () {
                    List<Task> content =
                        DatabaseServer.getInstance().selectAllTask();
                    for (int i = 0; i < content.length; i++) {
                      print(content.elementAt(i).toString());
                    }
                  },
                  child: Text("查询数据库")),
              FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(this.context, TaskList.sname);
                  },
                  child: Text("TaskList"))
            ],
          ),
        ),
      );
    }
  }
}
