import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lighttime_flutter/common/global.dart';
import 'package:lighttime_flutter/common/page/login.dart';
import 'package:lighttime_flutter/common/widgets/profile.dart';
import '../../generated/l10n.dart';

class UserInfo extends StatefulWidget {
  UserInfo({Key key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  var _username;
  var _email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Global.profile != null && Global.profile.user != null) {
      _username = Global.profile.user.username;
      _email = Global.profile.user.email;
    } else {
      _username = S.of(context).Offline;
      _email = S.of(context).Offline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://panrh.com/upload/2020/11/avatar-daa4565909aa48819330611828b92e52.jpg'),
                  radius: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisSize: MainAxisSize.max,
                //   children: [
                //     Container(
                //       alignment: Alignment.topLeft,
                //       child: Text(
                //         S.of(context).UserName,
                //         textAlign: TextAlign.left,
                //         style: TextStyle(
                //             fontFamily: 'sans-serif',
                //             fontSize: 18,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.grey),
                //       ),
                //     ),
                //     Padding(
                //       padding: EdgeInsets.only(bottom: 10),
                //     ),
                //     Container(
                //       alignment: Alignment.topLeft,
                //       child: Text(
                //         "121231231233@outlook.com",
                //         textAlign: TextAlign.left,
                //         style: TextStyle(fontSize: 16, color: Colors.black54),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: TextFormField(
              initialValue: _username,
              decoration: InputDecoration(
                  icon: Icon(Icons.person), labelText: S.of(context).UserName),
              enableInteractiveSelection: false,
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
            ),
          ),
          Container(
            child: TextFormField(
              initialValue: _email,
              decoration: InputDecoration(
                  icon: Icon(Icons.email_outlined),
                  labelText: S.of(context).Email),
              enableInteractiveSelection: false,
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
            ),
            margin: EdgeInsets.only(top: 30, left: 30, right: 30),
          ),
          Container(
              width: 300,
              margin: EdgeInsets.only(top: 30, left: 30, right: 30),
              child: RaisedButton(
                shape: StadiumBorder(),
                color: Colors.redAccent,
                onPressed: () {
                  Global.logout();
                  Navigator.pushNamedAndRemoveUntil(
                      context, Login.sname, (route) => true);
                },
                child: Text(
                  S.of(context).Logout,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
