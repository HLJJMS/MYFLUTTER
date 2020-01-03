//  @Description: 公共数据
//  @Author: 陈胜辉
//  @Date: 2019-12-04 11:14:30
//  @Version: 版本号, YYYY-MM-DD
//  @LastEditors: 陈胜辉
//  @LastEditTime: 2019-12-04 11:21:24
//  @Deprecated: 否
//  方法结束
import 'dart:ui';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class CommonData {
  /// 数据
  static MediaQueryData queryData = (MediaQueryData.fromWindow(window));

  /// 获取屏幕size
  static final Size size = (CommonData.queryData.size);

  /// 屏幕高
  static final double screenH = (CommonData.size.height);

  /// 屏幕宽
  static final double screenW = (CommonData.size.width);

  /// 状态栏高度
  static final double statusH = (CommonData.queryData.padding.top);

  /// 底部安全高度
  static final double bottomH = (CommonData.queryData.padding.bottom);

  /// 视图安全高度
  static final double viewSafeH =
      (CommonData.size.height - CommonData.bottomH - CommonData.navAndStatusH);

  /// 视图高度
  static final double viewH =
      (CommonData.size.height - CommonData.navAndStatusH);

  /// 导航栏高度
  static final double navH = 44.0;

  /// 导航栏与状态栏高度
  static final double navAndStatusH = (CommonData.navH + CommonData.statusH);

  /// 是否是iOS平台
  static final bool isIOS = (Platform.isIOS);

  /// 是否是安卓平台
  static final bool isAndroid = (Platform.isAndroid);
}
