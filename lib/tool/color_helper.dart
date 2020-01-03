//  @Description: 颜色帮助类
//  @Author: 陈胜辉
//  @Date: 2019-12-19 10:44:57
//  @Version: 版本号, YYYY-MM-DD
//  @LastEditors: 陈胜辉
//  @LastEditTime: 2019-12-19 10:45:29
//  @Deprecated: 否
//  备注
import 'dart:math';
import 'dart:ui';

/// 随机颜色
Color randomColor() {
  return Color.fromRGBO(
    Random().nextInt(255),
    Random().nextInt(255),
    Random().nextInt(255),
    1,
  );
}
