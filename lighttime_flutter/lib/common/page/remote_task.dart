import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lighttime_flutter/common/database/databaseServer.dart';
import 'package:lighttime_flutter/common/models/index.dart';
import 'package:lighttime_flutter/common/models/taskStatus.dart';
import 'package:lighttime_flutter/common/page/taskList.dart';
import 'package:lighttime_flutter/common/widgets/taskItem.dart';
import 'package:lighttime_flutter/generated/l10n.dart';

class RemoteTasksList extends StatefulWidget {
  @override
  _RemoteTasksState createState() {
    return _RemoteTasksState();
  }

  static final sname = "RemoteTasksList";
}

class _RemoteTasksState extends State<RemoteTasksList>
    with SingleTickerProviderStateMixin {
  static List<Task> _remoteTasksFinished;
  static List<Task> _remoteTasksUnFinished;
  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey;
  TabController _tabController;

  GlobalKey _unfinishListKey;
  GlobalKey _completedListKey;
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    _refreshIndicatorKey = new GlobalKey();
    _tabController = new TabController(vsync: this, length: 2);
    _unfinishListKey = new GlobalKey();
    _completedListKey = new GlobalKey();

    SchedulerBinding.instance.addPostFrameCallback((timestamp) {
      _refreshIndicatorKey.currentState?.show();
    });
    this._onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("远程任务列表"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: "待完成任务",
            ),
            Tab(
              text: "已完成任务",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [todoList(), finishedList()],
      ),
    );
  }

  Future<void> _onRefresh() async {
    _remoteTasksFinished = await DatabaseServer.getInstance()
        .selectTasksByStatus(TaskStatus.REMOTE_TASK_FINISHED)
        .then((value) {
      return value;
    }).then((value) async {
      _remoteTasksUnFinished = await DatabaseServer.getInstance()
          .selectTasksByStatus(TaskStatus.REMOTE_TASK_UNFINISHED)
          .then((value) {
        return value;
      });
      return value;
    }).whenComplete(() {
      setState(() {});
    });
  }

  Widget finishedList() {
    if (_remoteTasksFinished == null || _remoteTasksFinished.isEmpty) {
      return RefreshIndicator(
        child: ListView(
          children: [
            Container(
              margin: new EdgeInsets.all(30),
              child: Center(
                child: Text(S.of(context).NoCompletedTasks,
                    style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
        onRefresh: _onRefresh,
      );
    } else {
      return RefreshIndicator(
        child: ListView.builder(
            key: _completedListKey,
            itemBuilder: (context, index) {
              return TaskItem(_remoteTasksFinished.elementAt(index));
            },
            itemCount:
                _remoteTasksFinished == null ? 0 : _remoteTasksFinished.length),
        onRefresh: _onRefresh,
      );
    }
  }

  Widget todoList() {
    if (_remoteTasksUnFinished == null || _remoteTasksUnFinished.isEmpty) {
      return RefreshIndicator(
        child: ListView(
          children: [
            Container(
              margin: new EdgeInsets.all(30),
              child: Center(
                child: Text(S.of(context).NoRemoteTasks,
                    style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
        onRefresh: _onRefresh,
      );
    } else {
      return RefreshIndicator(
        child: ListView.builder(
            key: _unfinishListKey,
            itemBuilder: (context, index) {
              return TaskItem(_remoteTasksUnFinished.elementAt(index));
            },
            itemCount: _remoteTasksUnFinished == null
                ? 0
                : _remoteTasksUnFinished.length),
        onRefresh: _onRefresh,
      );
    }
  }
}
