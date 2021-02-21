import 'dart:io';
import 'dart:ui';
import 'package:lighttime_flutter/channel/taskChannel.dart';
import 'package:lighttime_flutter/channel/websocketUtil.dart';
import 'package:lighttime_flutter/common/database/databaseServer.dart';
import 'package:lighttime_flutter/common/global.dart';
import 'package:lighttime_flutter/common/models/task.dart';
import 'package:lighttime_flutter/common/models/taskStatus.dart';
import 'package:lighttime_flutter/common/page/login.dart';
import 'package:lighttime_flutter/common/widgets/goBack.dart';
import 'package:lighttime_flutter/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NewLocalTask extends StatefulWidget {
  @override
  _NewLocalTaskState createState() => _NewLocalTaskState();
  static final sname = "NewLocalTask";
}

class _NewLocalTaskState extends State<NewLocalTask> {
  DateTime _beginDate = DateTime(2021);
  DateTime _endDate = DateTime(2021);
  TextEditingController _title;
  TextEditingController _lauchdate;
  TextEditingController _deadLine;
  TextEditingController _content;

  GlobalKey<FormState> _newTaskKey = new GlobalKey();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _title = new TextEditingController();
    _lauchdate = new TextEditingController();
    _deadLine = new TextEditingController();

    _content = new TextEditingController();

    _lauchdate.text = DateTime.now().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _newTaskKey,
      child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: FlatButton(
              child: Icon(
                Icons.arrow_back,
                color: Colors.black54,
              ),
              onPressed: () {
                goBack(context);
              },
            ),

            /**
             * 任务标题
             *
             *
             *
             *
             *
             *
             */
            title: TextFormField(
              controller: _title,
              validator: (value) {
                if (value.isEmpty) {
                  _scaffoldKey.currentState.showSnackBar(
                      SnackBar(content: Text(S.of(context).TaskTitleIsNull)));
                }
                return null;
              },
              style: TextStyle(textBaseline: TextBaseline.alphabetic),
              cursorWidth: 5,
              cursorHeight: 20,
              strutStyle: StrutStyle(fontSize: 20),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: S.of(context).TaskTitle,
                hintStyle:
                    new TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              sendTask();
            },
            child: Icon(Icons.send),
            splashColor: Colors.greenAccent,
          ),
          body: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.only(top: 20, right: 20, left: 20),
                alignment: Alignment(0, -1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Table(
                      columnWidths: const <int, TableColumnWidth>{
                        0: FixedColumnWidth(200),
                        1: FixedColumnWidth(200),
                        2: FixedColumnWidth(200)
                      },
                      children: [
                        TableRow(children: [
                          /**
                           * 任务开始时间
                           *
                           *
                           *
                           *
                           *
                           *
                           *
                           */

                          TextFormField(
                              controller: _lauchdate,
                              decoration: InputDecoration(
                                icon: Icon(Icons.more_time_outlined),
                                hintText: S.of(context).StartDate,
                                hintStyle: TextStyle(fontSize: 12),
                              ),
                              enableInteractiveSelection: false,
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                              },
                              validator: (value) => _getValidator(
                                  value, S.of(context).TaskStartDateIsNull)),
                          FlatButton(
                            onPressed: () {
                              if (_lauchdate != null) {
                                _showDataPicker(_lauchdate);
                              } else {
                                print("_lauchdate is null");
                              }
                            },
                            child: Container(
                              child: Text(S.of(context).SelectStartTime),
                            ),
                          ),
                        ]),
                        TableRow(
                          children: [
                            /***
                             *
                             *
                             * 任务结束时间
                             *
                             *
                             *
                             *
                             */
                            TextFormField(
                              controller: _deadLine,
                              decoration: InputDecoration(
                                icon: Icon(Icons.more_time_outlined),
                                border: InputBorder.none,
                                hintText: S.of(context).Deadline,
                                hintStyle: TextStyle(fontSize: 12),
                              ),
                              validator: (value) => _getValidator(
                                  value, S.of(context).TaskDeadLineIsNull),
                              enableInteractiveSelection: false,
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                              },
                            ),
                            FlatButton(
                              onPressed: () {
                                if (_lauchdate != null) {
                                  _showDataPicker(_deadLine);
                                } else {
                                  print("_deadline is null");
                                }
                              },
                              child: Container(
                                child: Text(S.of(context).SelectEndTime),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),

                    /**
                     *
                     *
                     * 任务接受人邮箱
                     *
                     *
                     *
                     *
                     *
                     */

                    Container(
                        margin: EdgeInsets.only(top: 30),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, right: 10),
                                  child: Icon(
                                    Icons.content_paste,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              TextSpan(
                                  text: S.of(context).TaskContent,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black87)),
                            ],
                          ),
                        )),

                    /**
                     *
                     *
                     *
                     * 任务内容
                     *
                     *
                     *
                     */

                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextFormField(
                        controller: _content,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                        ),
                        maxLines: 12,
                      ),
                    ),
                  ],
                )),
          )),
    );
  }

  _showDataPicker(TextEditingController controller) async {
    var result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1971),
      lastDate: DateTime(2037),
    );
    var today =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    DateTime date = DateTime(
        result.year, result.month, result.day, today.hour, today.minute);
    controller.text = date.toString();
  }

// _getDate(DateTime datetime) {
//   return datetime.year.toString() +
//       "/" +
//       datetime.month.toString() +
//       "/" +
//       datetime.day.toString();
// }
//
// _showTimePicker() async {
//   showTimePicker(context: context, initialTime: TimeOfDay.now());
// }

  _getValidator(var value, String content) {
    if (value.isEmpty) {
      return content;
    }
    return null;
  }

  sendTask() {
    // if (Global.profile == null || Global.profile.token == null) {
    //   var snackBar = SnackBar(
    //     content: Text(S.of(context).Login),
    //     action: SnackBarAction(
    //       label: S.of(context).LoginFirst,
    //       onPressed: () {
    //         Navigator.pushNamed(context, Login.sname);
    //       },
    //     ),
    //   );
    //   _scaffoldKey.currentState.showSnackBar(snackBar);
    // }
    var newTaskState = _newTaskKey.currentState;
    if (newTaskState.validate() && _title.text.isNotEmpty) {
      newTaskState.save();
      Task task = new Task();
      task.title = _title.text;
      task.lauchdate = _lauchdate.text;
      task.deadline = _deadLine.text;
      task.principal = S.of(context).Local;
      task.status = TaskStatus.LOCAL_TASK_UNFINISHED.index;
      if (_content.text.isEmpty) {
        var snackBar = SnackBar(
          content: Text(S.of(context).TaskContentIsNull),
          action: SnackBarAction(
              label: S.of(context).Confirm,
              onPressed: () {
                task.content = "";
                _sendMessage(task);
              }),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      } else {
        task.content = _content.text;
        _sendMessage(task);
      }
    }
  }

  _sendMessage(Task task) {
    DatabaseServer.getInstance().insert(task);
    var snackBar = SnackBar(
      content: Text(S.of(context).TaskSendSuccess),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
