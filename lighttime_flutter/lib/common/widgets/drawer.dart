import 'package:flutter/material.dart';
import 'package:lighttime_flutter/common/page/languageRoute.dart';
import 'package:lighttime_flutter/common/page/localTask.dart';
import 'package:lighttime_flutter/common/page/new_task.dart';
import 'package:lighttime_flutter/common/page/remote_task.dart';
import 'package:lighttime_flutter/common/page/themeChangeRoute.dart';
import 'package:lighttime_flutter/common/page/user_center.dart';
import '../../generated/l10n.dart';

getDrawer(context) {
  return new Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          child: Container(
            child: Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg',
                ),
                radius: 40,
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.list_alt_outlined),
          title: Text(S.of(context).LocalTasks),
          onTap: () {
            Navigator.pushNamed(context, LocalTasksList.sname);
          },
        ),
        ListTile(
            leading: Icon(Icons.publish),
            title: Text(S.of(context).TaskRelease),
            onTap: () {
              Navigator.pushNamed(context, NewTask.sname);
            }),
        ListTile(
          leading: Icon(Icons.format_list_numbered_rounded),
          title: Text(S.of(context).RemoteTasks),
          onTap: () {
            print("任务列表 onclick");
            Navigator.pushNamed(context, RemoteTasksList.sname);
          },
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text(S.of(context).PersonalInfo),
          onTap: () {
            Navigator.pushNamed(context, UserCenter.sname);
          },
        ),
        ListTile(
          leading: Icon(Icons.color_lens),
          title: Text(S.of(context).ThemeSettings),
          onTap: () {
            Navigator.pushNamed(context, ThemeChangeRoute.sname);
          },
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text(S.of(context).LanguageSettings),
          onTap: () {
            Navigator.pushNamed(context, LanguageRoute.sname);
          },
        ),
      ],
    ),
  );
}
