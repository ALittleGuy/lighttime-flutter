import 'dart:io';
import 'dart:ui';
import 'package:lighttime_flutter/channel/taskChannel.dart';
import 'package:lighttime_flutter/channel/websocketUtil.dart';
import 'package:lighttime_flutter/common/database/databaseServer.dart';
import 'package:lighttime_flutter/common/global.dart';
import 'package:lighttime_flutter/common/models/task.dart';
import 'package:lighttime_flutter/common/models/taskStatus.dart';
import 'package:lighttime_flutter/common/page/login.dart';
import 'package:lighttime_flutter/common/page/remote_task.dart';
import 'package:lighttime_flutter/common/widgets/goBack.dart';
import 'package:lighttime_flutter/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TaskDetail extends StatefulWidget {
  @override
  _TaskDetailState createState() => _TaskDetailState(_content);

  Task _content;

  TaskDetail(this._content);
}

class _TaskDetailState extends State<TaskDetail> {
  Task _content;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  _TaskDetailState(this._content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: FlatButton(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black54,
            ),
            onPressed: () {
              if (Platform.isAndroid) {
                Navigator.pop(context);
              } else {
                exit(0);
              }
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
            initialValue: _content.title,
            style: TextStyle(textBaseline: TextBaseline.alphabetic),
            cursorWidth: 5,
            cursorHeight: 20,
            strutStyle: StrutStyle(fontSize: 20),
            decoration: InputDecoration(border: InputBorder.none),
            enableInteractiveSelection: false,
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
          ),
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
                          initialValue: _content.lauchdate,
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
                            initialValue: _content.deadline,
                            decoration: InputDecoration(
                              icon: Icon(Icons.more_time_outlined),
                              border: InputBorder.none,
                              hintText: S.of(context).Deadline,
                              hintStyle: TextStyle(fontSize: 12),
                            ),
                            enableInteractiveSelection: false,
                            onTap: () {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                            },
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
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      initialValue: _content.principal,
                      decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: S.of(context).PrincipalEmail),
                      enableInteractiveSelection: false,
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                    ),
                  ),
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
                      initialValue: _content.content,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                      ),
                      maxLines: 8,
                      enableInteractiveSelection: false,
                      onTap: () {
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            shape: StadiumBorder(),
                            color: Colors.redAccent,
                            onPressed: () {
                              _showSnackBar(S.of(context).DeleteTaskConfirmInfo,
                                  S.of(context).Confirm, () {
                                DatabaseServer.getInstance()
                                    .deleteTask(_content.id);
                                Navigator.pushNamed(
                                    context, RemoteTasksList.sname);
                              });
                            },
                            child: Text(
                              S.of(context).DeleteTask,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          child: null,
                          width: 30,
                        ),
                        Expanded(
                          flex: 1,
                          child: RaisedButton(
                            shape: StadiumBorder(),
                            color: Theme.of(context).primaryColorLight,
                            onPressed: () {
                              _showSnackBar(S.of(context).FinishTaskConfirmInfo,
                                  S.of(context).Confirm, () {
                                if (_content.status ==
                                    TaskStatus.REMOTE_TASK_UNFINISHED.index) {
                                  _content.status =
                                      TaskStatus.REMOTE_TASK_FINISHED.index;
                                } else if (_content.status ==
                                    TaskStatus.LOCAL_TASK_UNFINISHED.index) {
                                  _content.status =
                                      TaskStatus.LOCAL_TASK_FINISHED.index;
                                }
                                DatabaseServer.getInstance()
                                    .updateTask(_content);
                                goBack(context);
                              });
                            },
                            child: Text(
                              S.of(context).FinishTask,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }

  _showSnackBar(String content, String lable, Function handle) {
    var snackBar = SnackBar(
      content: Text(content),
      action: SnackBarAction(
        label: lable,
        onPressed: () {
          handle();
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
