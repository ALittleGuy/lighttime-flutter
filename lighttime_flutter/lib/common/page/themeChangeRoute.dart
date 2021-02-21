import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighttime_flutter/states/notifier.dart';
import 'package:provider/provider.dart';
import '../../generated/l10n.dart';
import '../global.dart';

class ThemeChangeRoute extends StatelessWidget {
  static String sname = "ThemeChangeRoute";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Theme),
      ),
      body: ListView(
        //显示主题色块
        children: Global.themes.map<Widget>((e) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Container(
                color: e,
                height: 40,
              ),
            ),
            onTap: () {
              print("ThemeSetting on tap");
              //主题更新后，MaterialApp会重新build
              Provider.of<ThemeModel>(context, listen: false).theme = e;
            },
          );
        }).toList(),
      ),
    );
  }
}
