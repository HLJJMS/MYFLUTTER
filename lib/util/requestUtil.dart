import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as HTTP;
import 'package:flutter_app/liuc/model/newsModel.dart';
import 'package:http/http.dart';

/* MARK: 通过requestClient获取接口GET数据方法
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 废弃类以后不再使用
 */
Future<dynamic> requestUtil(String api, Map<String, dynamic> params) async {
  // 接口头地址，后期放入启动配置中
  var localhost = "api.tianapi.com";

  HttpClient client;
  HttpClientRequest request;
  HttpClientResponse response;

  try {
    client = HttpClient();
    var url = Uri.http(localhost, api, params);
    request = await client.getUrl(url);
    response = await request.close();
    var content = await response.transform(utf8.decoder).join();
    print(content);
    return json.decode(content);
  } catch (e) {
    print("e:" + e.toString());
    return json.decode("{code:-1, msg:'服务器暂无响应！'}");
  } finally {
    request?.close();
  }
}

/* MARK: 通过http三方工具获取接口GET数据方法
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 废弃方法
 */
Future<dynamic> requestHttpUtil(String api,
    {Map<String, String> params}) async {
  //TODO: 通过http三方工具获取接口GET数据方法
  var localhost = "http://api.tianapi.com";
  Client client;
  try {
    client = new Client();
    // FIXME 使用http.get方法传参headers会报错没有key参数问题，使用url?key=1&num=10则没有问题，暂时没有找到原因
    final res = await client.get(localhost + api, headers: params);
    if (res.statusCode == 200) {
      return json.decode(utf8.decode(res.bodyBytes));
    } else {
      return json.decode("{code:-1, msg:'服务器暂无响应！'}");
    }
  } catch (e) {
    print("e:" + e.toString());
    return json.decode("{code:-1, msg:'服务器暂无响应！'}");
  } finally {
    client?.close();
  }
}

/* MARK: 通过dio三方获取接口GET数据方法
 * @LastEditors: 刘驰
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 废弃方法
 */
Future<dynamic> requestDioUtil(String api, Map<String, dynamic> params) async {
  // TODO: 通过dio三方获取接口GET数据方法
  var localhost = "http://api.tianapi.com";
  HTTP.Dio dio;
  HTTP.Response res;
  try {
    dio = HTTP.Dio();
    res = await dio.get(localhost + api, queryParameters: params);
    print(res);
    return res.data;
  } catch (e) {
    print("e:" + e.toString());
    return json.decode("{code:-1, msg:'服务器暂无响应！'}");
  }
}
