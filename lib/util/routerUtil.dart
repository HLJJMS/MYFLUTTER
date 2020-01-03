import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/application.dart';
import 'package:flutter_app/extension/sh_extension_string.dart';
import 'dart:convert' as convert;

// 路由名字
class RouterName {
  // 主页面 - csh
  static String cshPage = '/csh_page';
  // 注册页面 - csh
  static String cshReg = '/csh_reg';
  // 导航栏页面 - csh
  static String cshNav = '/csh_nav';
  // 布局页面 - csh
  static String cshLayout = '/csh_layout';
  // 动画页面 - csh
  static String cshAnimated = '/csh_animated';
  // 列页面 - csh
  static String cshColumnList = '/csh_column_list';
  // 行页面 - csh
  static String cshRowList = '/csh_row_list';
  // 表格页面 - csh
  static String cshTable = '/csh_table';
  // 分页页面 - csh
  static String cshPaging = '/csh_paging';
}

typedef _CallBack = void Function(dynamic result);

class RouterUtil {
  //路由参数
  static const String _param = 'router_param';

  /* MARK:跳转到指定页面
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {
   *  BuildContext context，
   *  String url 路由路径
   *  TransitionType transType 可选，弹出动画（默认inFromRight）
   * } 
   * @return: 
   * @Deprecated: 否
   */
  static navigateTo(BuildContext context, String url,
      {bool replace = false,
      bool clearStack = false,
      TransitionType transType = TransitionType.inFromRight,
      _CallBack block}) {
    Application.router.navigateTo(
      context,
      url,
      transition: transType,
      replace: replace,
      clearStack: clearStack,
    )..then((value) {
        block(value);
      });
  }

  /// MARK:返回上一个页面
  //  @LastEditors: 陈胜辉
  //  @Version: 版本号, YYYY-MM-DD
  //  @param {param 传递参数}
  //  @return:
  //  @Deprecated: 否
  //  备注
  static pop(BuildContext context, [dynamic param]) {
    Navigator.maybePop(context, param);
  }

  /// MARK:返回到已经存在指定页面
  //  @LastEditors: 陈胜辉
  //  @Version: 版本号, YYYY-MM-DD
  //  @param {url 路由地址(不携带参数)}
  //  @return:
  //  @Deprecated: 否
  //  备注
  static popToRouter(BuildContext context, String url) {
    Navigator.popUntil(context, ModalRoute.withName(url));
  }

  /// MARK:处理入参
  //  @LastEditors: 陈胜辉
  //  @Version: 版本号, YYYY-MM-DD
  //  @param {params 参数（Map、Json）}
  //  @return: String 路由参数
  //  @Deprecated: 否
  //  备注
  static String handleParams(dynamic params) {
    //无参数
    if (null == params) {
      return '';
    }
    if (params is Map) {
      //转json
      params = convert.jsonEncode(params);
    }
    //断言
    assert((params is String), '参数类型不正确 参数格式只能是 Json 或 Map');
    String str = params;
    //编码中文
    str = str.toCoding();
    //拼接参数
    return '?' + _param + '=$str';
  }

  /* MARK:处理出参
   * @LastEditors: 陈胜辉
   * @Version: 版本号, YYYY-MM-DD
   * @param {params 参数} 
   * @return: Map 界面参数
   * @Deprecated: 否
   */
  static Map handleOutParams(Map params) {
    if (null == params || params.length == 0) {
      return {};
    }
    Map temp = {};

    //获取内容
    String value = params[_param].first;
    //解码中文
    value = value.toDeCoding();
    //转map
    temp = convert.jsonDecode(value);

    return temp;
  }
}
