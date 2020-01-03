import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/net_work/base/http_util.dart';
import 'package:flutter_app/net_work/base/base_model.dart';
import 'package:flutter_app/net_work/config/interface.dart';
import 'package:flutter_app/liuc/model/newsModel.dart';
import 'package:flutter_app/liuc/model/order_list.dart';
import 'package:flutter_app/extension/sh_extension_string.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_app/util/toastUtil.dart';

// 公共请求类
class Request {
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
      'key': '1868f3c1d5623bf9d1d268286d4ee3d1',
    };

    // TODO 这里拼接公共参数
    DataModel dm = await HttpUtil.of(
      context,
    ).request(
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

  /* MARK:我的订单列表
   * @LastEditors: 陈胜辉
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  static Future<DataModel> queryOrderList(BuildContext context) async {
    // 参数处理
    var params = {
      "page": "1",
      "status": "99",
      "limit": "10",
    };

    params["sign"] = Request.configSign(params);
    params["token"] = "1fe576fd07df7bab85588eadb8a1a2f4";
    // TODO 这里拼接公共参数

    DataModel dm = await HttpUtil.of(
      context,
      server: ServerType.Type_php,
    ).request(
      Interface.order_index,
      params: params,
    );
    //成功处理解析数据
    if (dm.data != null) {
      OrderList data = OrderList.fromJson(dm.data);
      dm.data = data;
    }

    return dm;
  }

  // MARK 配置验签
  static String configSign(Map params) {
    List<String> temp = [];

    String sign = '';

    //参数拼接
    params.forEach((key, value) {
      temp.add(key + '=' + value);
    });

    //数组排序
    temp.sort((a, b) {
      return a.compareTo(b);
    });
    sign = temp.join('&') + '1fe576fd07df7bab85588eadb8a1a2f4';

    //MD5加密
    return sign.getMD5();
  }
}
