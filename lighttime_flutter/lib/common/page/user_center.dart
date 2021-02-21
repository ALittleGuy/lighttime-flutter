import 'package:flutter/material.dart';
import 'package:lighttime_flutter/app.dart';
import 'package:lighttime_flutter/common/page/user_info.dart';
import 'package:lighttime_flutter/generated/l10n.dart';

class UserCenter extends StatefulWidget {
  UserCenter({Key key}) : super(key: key);
  static final sname = "userCenter";
  @override
  _UserCenterState createState() => _UserCenterState();
}

class _UserCenterState extends State<UserCenter>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(S.of(context).title),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: S.of(context).PersonalInfo,
            ),
            Tab(
              text: "LightTime",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [UserInfo(), Text("About us")],
      ),
    );
  }
}
