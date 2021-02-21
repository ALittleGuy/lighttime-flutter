import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lighttime_flutter/common/models/user.dart';

import 'httpManager.dart';

/**
 * @author : prh
 *
 * 网络请求行为
 *
 */
class Behaviour {
  static final HttpManager _httpManager = HttpManager();

  Future<String> login(String email, String password) async {
    Response response = await _httpManager.post("/user/login",
        data: FormData.fromMap({"email": email, "password": password}));
    print(response.data.toString());
    return (response.data.toString());
  }

  static Behaviour _instance;

  factory Behaviour() => _getInstance();

  register(User user) {
    if (user != null) {
      _httpManager.post("/user", data: FormData.fromMap(user.toJson()));
    }
  }

  Future<bool> tokenValidate(String token) async {
    Response response = await _httpManager.post("/user/tokenValidate",
        data: FormData.fromMap({"token": token}));
    var code = json.decode(response.data.toString())["code"];
    print("token validate code:" + code.toString());
    return code == 102;
  }

  Behaviour._internal() {}

  static _getInstance() {
    if (_instance == null) {
      _instance = new Behaviour._internal();
    }
    return _instance;
  }
}
