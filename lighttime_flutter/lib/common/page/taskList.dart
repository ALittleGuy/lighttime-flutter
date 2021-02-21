import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighttime_flutter/app.dart';
import 'package:lighttime_flutter/common/models/task.dart';
import 'package:lighttime_flutter/common/widgets/taskItem.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() {
    // TODO: implement createState
    return _TaskListState(_taskList);
  }

  static final String sname = "TaskList";
  List<Task> _taskList;
  TaskList(this._taskList);
}

class _TaskListState extends State<TaskList> {
  List _tasks;

  _TaskListState(this._tasks);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return TaskItem(_tasks.elementAt(index));
        },
        itemCount: _tasks == null ? 0 : _tasks.length);
  }

  @override
  void didUpdateWidget(covariant TaskList oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    setState(() {
      print("task list set state");
    });
  }
}
