import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'models/profile.dart';

// final List<ThemeData> _themes = <ThemeData>[
//   new ThemeData(primarySwatch: Colors.blue),
//   new ThemeData(primarySwatch: Colors.purple),
//   new ThemeData(primarySwatch: Colors.orange),
//   new ThemeData(primarySwatch: Colors.green),
//   new ThemeData(primarySwatch: Colors.blueGrey),
//   new ThemeData(primarySwatch: Colors.black26),
//   new ThemeData(primarySwatch: Colors.red),
// ];
const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.brown
];

class Global {
  static SharedPreferences _prefs;
  static Profile profile = Profile();
  static List<MaterialColor> get themes => _themes;
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");
  static Future init() async {
    print("init begin");
    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString("profile");
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }
    print("init finished");
  }

  static saveProfile() {
    _prefs.setString("profile", jsonEncode(profile.toJson()));
  }

  static logout() {
    _prefs.remove("profile");
  }
}
