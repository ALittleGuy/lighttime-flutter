import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lighttime_flutter/common/models/index.dart';
import 'package:lighttime_flutter/common/models/user.dart';
import 'package:lighttime_flutter/redux/locale_redux.dart';
import 'package:lighttime_flutter/redux/theme_redux.dart';
import 'package:lighttime_flutter/redux/token_redux.dart';
import 'package:lighttime_flutter/redux/user_redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

// const _themes = <MaterialColor>[
//   Colors.blue,
//   Colors.cyan,
//   Colors.teal,
//   Colors.green,
//   Colors.red,
//   Colors.brown
// ];
//
// class LightTimeGlobal {
//   static SharedPreferences _preferences;
//   static Profile profile = Profile();
//   static List<MaterialColor> get themes => _themes;
//
//   static Future init() async {
//     _preferences = await SharedPreferences.getInstance();
//     var _profile = _preferences.getString("profile");
//     if (_profile != null) {
//       try {
//         profile = Profile.fromJson(jsonDecode(_profile));
//       } catch (e) {
//         print("profile decode fialed,relogin please");
//       }
//     }
//   }
//
//   static saveProfile() =>
//       _preferences.setString("profile", jsonEncode(profile.toJson()));
// }
