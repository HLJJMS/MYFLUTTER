/// MARK:
//  @Description: GlobalKey拓展
//  @Author: 陈胜辉
//  @Date: 2019-12-26 15:37:34
//  @Version: 版本号, YYYY-MM-DD
//  @LastEditors: 陈胜辉
//  @LastEditTime: 2019-12-26 16:07:28
//  @Deprecated: 否
//  备注
import 'package:flutter/material.dart';

extension SHExtension on GlobalKey {
  static Offset offset = Offset.zero;

  void setOffset(Offset off) {
    offset = off;
  }

  RenderBox _render() {
    if (this.currentContext != null) {
      return this.currentContext.findRenderObject();
    }
    return null;
  }

  double x() {
    return this.origin().dx;
  }

  double y() {
    return this.origin().dy;
  }

  double width() {
    return this.size().width;
  }

  double height() {
    return this.size().height;
  }

  Offset origin() {
    return this._render().localToGlobal(offset);
  }

  Size size() {
    return this._render().size;
  }

  double maxX() {
    return this.x() + this.width();
  }

  double maxY() {
    return this.y() + this.height();
  }

  double centerX() {
    return this.x() + (this.width() / 2);
  }

  double centerY() {
    return this.y() + (this.height() / 2);
  }
}
