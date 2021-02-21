import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lighttime_flutter/common/database/databaseServer.dart';
import 'package:lighttime_flutter/common/models/index.dart';
import 'package:lighttime_flutter/common/models/taskStatus.dart';
import 'package:lighttime_flutter/common/page/new_local_task.dart';
import 'package:lighttime_flutter/common/page/taskList.dart';
import 'package:lighttime_flutter/common/widgets/taskItem.dart';
import 'package:lighttime_flutter/generated/l10n.dart';

class LocalTasksList extends StatefulWidget {
  @override
  _LocalTasksState createState() {
    return _LocalTasksState();
  }

  static final sname = "LocalTasksList";
}

class _LocalTasksState extends State<LocalTasksList>
    with SingleTickerProviderStateMixin {
  static List<Task> _localTodoTasks;
  static List<Task> _localCompletedTasks;
  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey;
  TabController _tabController;

  GlobalKey _globalKey;
  GlobalKey _todoListKey;
  GlobalKey _completedListKey;
  @override
  initState() {
    // TODO: implement initState
    super.initState();
    _refreshIndicatorKey = new GlobalKey();
    _tabController = new TabController(vsync: this, length: 2);
    _todoListKey = new GlobalKey();
    _completedListKey = new GlobalKey();
    _globalKey = new GlobalKey();

    SchedulerBinding.instance.addPostFrameCallback((timestamp) {
      _refreshIndicatorKey.currentState?.show();
    });
    this._onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, NewLocalTask.sname);
        },
      ),
      appBar: AppBar(
        title: Text(S.of(context).LocalTasks),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: S.of(context).Todo,
            ),
            Tab(
              text: S.of(context).Completed,
            )
          ],
        ),
      ),
      body: TabBarView(
        key: _globalKey,
        controller: _tabController,
        children: [todoList(), completedList()],
      ),
    );
  }

  Future<void> _onRefresh() async {
    print("fresh");
    _localCompletedTasks = await DatabaseServer.getInstance()
        .selectTasksByStatus(TaskStatus.LOCAL_TASK_FINISHED)
        .then((value) {
      return value;
    }).whenComplete(() {
      setState(() {});
    });

    _localTodoTasks = await DatabaseServer.getInstance()
        .selectTasksByStatus(TaskStatus.LOCAL_TASK_UNFINISHED)
        .then((value) {
      return value;
    }).whenComplete(() {
      setState(() {});
    });
  }

  Widget completedList() {
    if (_localCompletedTasks == null || _localCompletedTasks.isEmpty) {
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
              return TaskItem(_localCompletedTasks.elementAt(index));
            },
            itemCount:
                _localCompletedTasks == null ? 0 : _localCompletedTasks.length),
        onRefresh: _onRefresh,
      );
    }
  }

  Widget todoList() {
    if (_localTodoTasks == null || _localTodoTasks.isEmpty) {
      return RefreshIndicator(
        child: ListView(
          children: [
            Container(
              margin: new EdgeInsets.all(30),
              child: Center(
                child: Text(S.of(context).NoToedoTasks,
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
            key: _todoListKey,
            itemBuilder: (context, index) {
              return TaskItem(_localTodoTasks.elementAt(index));
            },
            itemCount: _localTodoTasks == null ? 0 : _localTodoTasks.length),
        onRefresh: _onRefresh,
      );
    }
  }
}
