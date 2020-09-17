import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lighttime_flutter/models/index.dart';
import 'package:lighttime_flutter/network/httpManager.dart';


/**
 * @author : prh
 *
 * 网络请求行为
 *
 */
class Behaviour {

  HttpManager _httpManager = new HttpManager();

  login(String email , String){

  }

  static Behaviour _instance ;

  factory Behaviour () => _getInstance();

  register(@required User user){
    if(user!=null ) {
      _httpManager.post("/user", data: FormData.fromMap(user.toJson()));
    }
  }

  Behaviour._internal(){
  }

  static _getInstance() {
    if(_instance == null){
      _instance =  new Behaviour._internal();
    }
    return _instance;
  }
}