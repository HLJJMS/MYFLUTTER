/* MARK: 网络请求工具类
 * @Description: 类描述
 * @Author: 刘驰
 * @Date: 2019-11-21 10:58:08
 * @Version: v1.0, 2019-11-21
 * @LastEditors: 刘驰
 * @LastEditTime: 2019-11-21 11:12:56
 * @Deprecated: 否
 */
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/base/baseModel.dart';
import 'package:flutter_app/config/c.dart';
import 'package:flutter_app/interceptor/logsInterceptor.dart';
import 'package:flutter_app/interceptor/responseInterceptor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/util/toastUtil.dart' as toastUtil;

//请求类型
enum RequestType {
  Type_get,
  Type_post,
}

//服务器类型
enum ServerType {
  Type_java,
  Type_php,
}

class HttpUtil {
  /**
   * wedget组件context
   * context不是单例，根据接口调用所在的页面传入的context，用以拦截跳转
   */
  BuildContext _context;
  // 单例dio
  Dio _dio;
  // 构造函数
  factory HttpUtil() => getInstance();
  // static HttpUtil get instance => _getInstance();
  // 单例对象
  static HttpUtil _instance;

  //属性
  RequestType _request;
  ServerType _server;

  /* MARK: 单例初始化方法
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-11-21
   * @param {void} 
   * @return: void
   * @Deprecated: 否
   */
  HttpUtil._internal() {
    if (null == _dio) {
      _dio = Dio(
        BaseOptions(
          baseUrl: Config.getJAVA(),
          connectTimeout: Config.CONNECT_TIMEOUT,
        ),
      );
      // 加载日志拦截器功能
      _dio.interceptors.add(LogsInterceptor());
      // 加载响应拦截器功能开发
      _dio.interceptors.add(ResponseInterceptor());
    }
  }

  /* MARK: 单例实例化方法
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-11-21
   * @param {void} 
   * @return: _instance httpUtil单例对象
   * @Deprecated: 否
   */
  static HttpUtil getInstance() {
    if (_instance == null) {
      _instance = HttpUtil._internal();
    }
    return _instance;
  }

  /* MARK: 设置BuildContext
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-11-21
   * @param {void} 
   * @return: _instance httpUtil单例对象
   * @Deprecated: 否
   */
  _setConext(BuildContext context) {
    _context = context;
  }

  /* MARK: 单例设置BuildContext
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-11-21
   * @param {void} 
   * @return: _instance httpUtil单例对象
   * @Deprecated: 否
   */
  static HttpUtil of(
    BuildContext context, {
    RequestType request,
    ServerType server,
  }) {
    _instance = _instance ?? HttpUtil._internal();
    _instance._setConext(context);
    // context ?? _instance._setConext(context);
    // 下方为可选参数
    // 请求类型 默认get
    _instance._request = request;
    // 服务器类型 默认java
    _instance._server = server;

    return _instance;
  }

  //请求
  Future<DataModel> request(String url, {Map<String, dynamic> params}) async {
    BaseOptions options = _dio.options;
    //地址
    switch (_server) {
      //PHP主机地址
      case ServerType.Type_php:
        options.baseUrl = Config.getPHP();
        break;
      default:
        //默认JAVA主机地址
        options.baseUrl = Config.getJAVA();
    }
    _dio.options = options;

    Response res;
    switch (_request) {
      //POST请求
      case RequestType.Type_post:
        res = await _dio.post(url, queryParameters: params);
        break;
      default:
        //默认GET请求
        res = await _dio.get(url, queryParameters: params);
    }

    //处理接口回参 行为
    return _handleResultData(res.data);
  }

  /* MARK: http接口请求GET方法
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-11-21
   * @param {
   * String url: 接口地址，
   * Map<String, dynamic> params： 接口参数， 
   * } 
   * @return: 
   * @Deprecated: 否
   */
  Future<DataModel> get(String url, {Map<String, dynamic> params}) async {
    try {
      // get方法调用
      Response res = await _dio.get(url, queryParameters: params);
      //处理接口回参 行为
      return _handleResultData(res.data);
    } catch (e) {
      /* TODO: 下次优化错误出现 
       * 调试模式下错误信息打印
       */
      print("httpUtil post请求报错：" + e.toString());
      toastUtil.systemToast();
    }
  }

  /* MARK: http接口请求POST方法
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-11-21
   * @param {
   *  String url 接口名，
   *  Map<String, dynamic> params 接口参数，
   * } 
   * @return: 
   * @Deprecated: 否
   */
  Future<dynamic> post(String url, {Map<String, dynamic> params}) async {
    Response res;
    try {
      // post方法调用
      res = await _dio.post(url, queryParameters: params);
      // 处理接口返回数据
      return _handleResultData(res.data);
    } on DioError catch (e) {
      /* TODO: 下次优化错误出现 
       * 调试模式下错误信息打印
       */
      print("httpUtil post请求报错：" + e.toString());
      toastUtil.systemToast();
    }
    return null;
  }

  /* MARK: 接口返回值处理
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-11-21
   * @param {
   *  StatusModel sm 状态模型数据
   * } 
   * @return: Future<dynamic> 接口数据
   * @Deprecated: 否
   */
  DataModel _handleResultData(ResultModel sm) {
    //接口回参统一处理
    switch (sm.code) {
      // 登录拦截
      case ResultCode.login:
        if (null != _context) {
          // toast接口返回登录拦截提示
          toastUtil.showToast(sm.data["msg"]);
          // 模拟跳转到登录
          Navigator.pushNamed(_context, "/");
        }
        return null;
      // 网络请求失败
      case ResultCode.fail:
        toastUtil.systemToast();
        return null;
      default:
        //其他 抛给 UI层 或者 接口层 处理
        return DataModel(
          code: sm.data['code'],
          msg: sm.data['msg'],
          //TODO 服务器统一错误码应为data 可以在拦截器里面处理
          data: sm.data['newslist'],
        );
    }
  }
}
