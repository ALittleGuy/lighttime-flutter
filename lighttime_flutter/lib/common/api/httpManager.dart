import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lighttime_flutter/common/api/networkConfig.dart';

import 'http_error.dart';

///http请求成功回调
typedef HttpSuccessCallback<T> = void Function(dynamic data);

///失败回调
typedef HttpFailureCallback = void Function(HttpError data);

/**
 * @author : prh
 *
 * HttpManager
 * description: 网络请求管理类 ， 封装网络请求 ， 对Dio 进行封装
 * mode：单例模式
 *
 */
class HttpManager {
  Dio _client;
  static final int CONNECT_TIMEOUT = 30000;
  static final int RECEIVE_TIMEOUT = 30000;
  static const String GET = 'get';
  static const String POST = 'post';

  factory HttpManager() => _getInstance();

  static HttpManager _instance;

  HttpManager._internal() {
    if (_client == null) {
      _client = new Dio(BaseOptions(
          baseUrl: "http://${NetWorkConfig.URL}/",
          responseType: ResponseType.plain));
    }
  }

  // ignore: non_constant_identifier_names
  void init(
      {String url,
      int connectTimeOut,
      int receiveTimeout,
      List<Interceptor> inceptors}) {
    _client.options = _client.options.merge(
      baseUrl: url,
      connectTimeout: connectTimeOut,
      receiveTimeout: receiveTimeout,
    );

    if (inceptors != null && inceptors.isNotEmpty) {
      _client.interceptors.addAll(inceptors);
    }
  }

  static _getInstance() {
    if (_instance == null) {
      _instance = new HttpManager._internal();
    }
    return _instance;
  }

  get(String path,
      {Map<String, dynamic> queryParameters,
      Options options,
      CancelToken cancelToken,
      ProgressCallback onReceiveProgress}) {
    return _client.get(path,
        options: options,
        cancelToken: cancelToken,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress);
  }

  post(String path,
      {Map<String, dynamic> queryParameters,
      data,
      Options options,
      CancelToken cancelToken,
      ProgressCallback onReceiveProgress}) {
    return _client.post(path,
        data: data,
        options: options,
        cancelToken: cancelToken,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress);
  }
}
