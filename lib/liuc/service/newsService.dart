/* 
 * @Description: 类描述
 * @Author: 刘驰
 * @Date: 2019-11-20 09:00:18
 * @Version: 版本号, YYYY-MM-DD
 * @LastEditors: 刘驰
 * @LastEditTime: 2019-11-20 11:06:16
 * @Deprecated: 否
 */

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/base/baseModel.dart';
import 'package:flutter_app/config/i.dart';
import 'package:flutter_app/liuc/model/OneModel.dart';
import 'package:flutter_app/liuc/model/newsModel.dart';
import 'package:flutter_app/liuc/model/weatherModel.dart';
import 'package:flutter_app/util/httpUtil.dart';
import 'package:flutter_app/util/requestUtil.dart';

class NewsService {
  // 工厂类
  factory NewsService() => NewsService._instance();
  NewsService._instance();

  /* MARK: 加载今天天气信息
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-11-24
   * @param {type} 
   * @return: WeatherModel 天气数据模型
   * @Deprecated: 否
   */
  static Future<WeatherModel> queryWeatherList() async {
    // 参数处理
    var params = {
      "key": "1868f3c1d5623bf9d1d268286d4ee3d1",
      "city": "哈尔滨",
    };

    DataModel dm = await HttpUtil().get(
      Interface.tianqi_index,
      params: params,
    );

    //成功处理解析数据
    if (null != dm && dm.code == StatusCode.SUCCESS) {
      // 处理数据
      List<WeatherModel> list = new List<WeatherModel>();
      for (Map<String, dynamic> map in dm.data) {
        list.add(WeatherModel.fromJson(map));
      }
      return list.isEmpty ? null : list[0];
    }
    return null;
  }

  /* MARK: 加载新闻列表页数据
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-11-24
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  static Future<DataModel> queryNewsList(BuildContext context) async {
    // 参数处理
    var params = {
      "key": "1868f3c1d5623bf9d1d268286d4ee3d1",
      "num": "20",
    };

    // TODO 这里拼接公共参数

    // 进行请求
    //可以选择请求类型 与 服务器类型 有默认值
    // DataModel dm = await HttpUtil.of(
    //   context,
    //   request: RequestType.Type_post,
    //   server: ServerType.Type_php,
    // ).get(
    //   Interface.film_index,
    //   params: params,
    // );

    DataModel dm = await HttpUtil.of(context).get(
      Interface.film_index,
      params: params,
    );

    //成功处理解析数据
    if (null != dm && dm.code == StatusCode.SUCCESS) {
      // 处理数据
      List<NewsModel> list = new List<NewsModel>();
      for (Map<String, dynamic> map in dm.data) {
        list.add(NewsModel.fromJson(map));
      }
      // 赋值
      dm.data = list;
      return dm;
    }

    // TODO 对于此接口公共处理在这里

    // XXX 或者返回空或其他
    return dm;
  }

  /* MARK: 加载ONE一个数据
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-11-24
   * @param {
   * BuildContext context
   * } 
   * @return: OneModel 
   * @Deprecated: 否
   */
  static Future<OneModel> queryOneMagazineList(BuildContext context) async {
    // 新闻列表接口入参
    var params = {"key": "1868f3c1d5623bf9d1d268286d4ee3d1", "rand": "0"};
    // TODO: 下次优化创建公共接口类
    // 调用接口查询新闻列表数据
    DataModel dm = await HttpUtil.of(context).post(
      Interface.one_index,
      params: params,
    );
    if (null != dm && dm.code == StatusCode.SUCCESS) {
      OneModel oneModel = OneModel();
      oneModel = OneModel.fromJson(dm.data[0]);
      return oneModel;
    }
    // 防止接口报错返回null后到页面报错
    return OneModel();
  }

  /* MARK: 通过httpClient获取新闻列表页数据
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: Future<List<NewsModel>>
   * @Deprecated: 废弃方法
   */
  Future<List<NewsModel>> queryNewsListClient() async {
    // 新闻列表接口入参
    var params = {"key": "1868f3c1d5623bf9d1d268286d4ee3d11", "num": "20"};
    // TODO 下次优化创建公共接口类
    // 调用接口查询新闻列表数据
    var result = await requestUtil("/film/index", params);
    // 接口返回数据是否成功 200 表示成功
    if (result.code == StatusCode.SUCCESS) {
      List<NewsModel> list = new List<NewsModel>();
      for (Map<String, dynamic> map in result["newslist"]) {
        list.add(NewsModel(
            ctime: map["ctime"],
            title: map["title"],
            description: map["description"],
            picUrl: map["picUrl"],
            url: map["url"]));
      }
      return list;
    } else {
      //FIXME: queryNewsList 下次优化错误处理放入基类中
      print("出错了！ 错误码：${result['code']}, 错误信息：${result['msg']}");
      // StatusModel sm = StatusModel(result["code"], result["msg"]);
    }
  }

  /* MARK: 通过http获取新闻列表页数据
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 废弃方法
   */
  Future<List<NewsModel>> queryNewsListHttp() async {
    // 新闻列表接口入参
    var params = {"key": "1868f3c1d5623bf9d1d268286d4ee3d1", "num": "10"};
    // TODO: 下次优化创建公共接口类
    // 调用接口查询新闻列表数据
    var result = await requestHttpUtil(
        "/film/index?key=1868f3c1d5623bf9d1d268286d4ee3d1&num=10");
    if (result["code"] == 200) {
      List<NewsModel> list = new List<NewsModel>();
      for (Map<String, dynamic> map in result["newslist"]) {
        list.add(NewsModel.fromJson(map));
      }
      return list;
    } else {
      //FIXME: queryNewsListHttp 下次优化错误处理放入基类中
      print("出错了！ 错误码：${result['code']}, 错误信息：${result['msg']}");
      // StatusModel sm = StatusModel(result["code"], result["msg"]);
    }
  }

  /* MARK: 通过dio获取新闻列表页数据
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 废弃方法
   */
  Future<List<NewsModel>> queryNewsListDio() async {
    // 新闻列表接口入参
    var params = {"key": "1868f3c1d5623bf9d1d268286d4ee3d1", "num": "10"};
    // TODO: 下次优化创建公共接口类
    // 调用接口查询新闻列表数据
    var result = await requestDioUtil("/film/index", params);
    if (result["code"] == 200) {
      List<NewsModel> list = new List<NewsModel>();
      for (Map<String, dynamic> map in result["newslist"]) {
        list.add(NewsModel.fromJson(map));
      }
      return list;
    } else {
      //FIXME queryNewsListHttp 下次优化错误处理放入基类中
      print("出错了！ 错误码：${result['code']}, 错误信息：${result['msg']}");
      // StatusModel sm = StatusModel(result["code"], result["msg"]);
    }
  }
}
