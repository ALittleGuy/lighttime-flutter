import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lighttime_flutter/generated/l10n.dart';
import 'package:lighttime_flutter/states/notifier.dart';
import 'package:provider/provider.dart';

class LanguageRoute extends StatelessWidget {
  static String sname = "LanguageRoute";

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    var localeModel = Provider.of<LocaleModel>(context);
    //构建语言选择项
    Widget _buildLanguageItem(String lan, value) {
      return ListTile(
        title: Text(
          lan,
          // 对APP当前语言进行高亮显示
          style: TextStyle(color: localeModel.locale == value ? color : null),
        ),
        trailing:
            localeModel.locale == value ? Icon(Icons.done, color: color) : null,
        onTap: () {
          // 更新locale后MaterialApp会重新build
          localeModel.locale = value;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Language),
      ),
      body: ListView(
        children: <Widget>[
          _buildLanguageItem("中文简体", "zh_CN"),
          _buildLanguageItem("English", "en_US"),
          _buildLanguageItem(S.of(context).LanguageAuto, null),
        ],
      ),
    );
  }
}
