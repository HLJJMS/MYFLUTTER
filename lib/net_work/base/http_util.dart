/* MARK: 网络请求工具类
 * @Description: 类描述
 * @Author: 刘驰
 * @Date: 2019-11-21 10:58:08
 * @Version: v1.0, 2019-11-21
 * @LastEditors: 刘驰
 * @LastEditTime: 2019-11-21 11:12:56
 * @Deprecated: 否
 */

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/net_work/base/base_model.dart';
import 'package:flutter_app/net_work/interceptor/interceptor_log.dart';
import 'package:flutter_app/net_work/interceptor/interceptor_response.dart';
import 'package:flutter_app/net_work/base/toast_util.dart' as toastUtil;
import 'package:flutter_app/net_work/config/server.dart';

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
  // 单例对象
  static HttpUtil _instance;
  // 属性
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
    // 下方为可选参数
    // 请求类型 默认get
    _instance._request = request ?? RequestType.Type_get;
    // 服务器类型 默认java
    _instance._server = server ?? ServerType.Type_java;

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
        //默认 JAVA主机地址
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
        //默认 GET请求
        res = await _dio.get(url, queryParameters: params);
    }

    //处理接口回参 统一处理行为
    return _handleResultData(res.data);
  }

  /* MARK: 所有接口都有的行为在这里进行处理
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-11-21
   * @param {
   *  StatusModel sm 状态模型数据
   * } 
   * @return: Future<dynamic> 接口数据
   * @Deprecated: 否
   */
  DataModel _handleResultData(ResultModel model) {
    //接口回参统一处理
    switch (model.code) {
      // 登录拦截
      case ResultCode.login:
        // toast接口返回登录拦截提示
        toastUtil.showToast(model.data["msg"]);
        // 模拟跳转到登录
        Navigator.pushNamed(_context, "/");
        return null;
      // 网络请求失败
      case ResultCode.fail:
        toastUtil.systemToast();
        return null;
      default:
        //其他 抛给 UI层 或者 接口层 处理
        return DataModel(
          code: model.data['code'],
          msg: model.data['msg'],
          //TODO 服务器统一错误码应为data 可以在拦截器里面处理
          data: model.data['data'],
        );
    }
  }
}
