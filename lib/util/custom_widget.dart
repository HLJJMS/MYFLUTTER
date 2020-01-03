//  @Description: 自定义组件
//  @Author: 陈胜辉
//  @Date: 2019-12-05 08:37:35
//  @Version: 版本号, YYYY-MM-DD
//  @LastEditors: 陈胜辉
//  @LastEditTime: 2019-12-05 08:38:46
//  @Deprecated: 否
//  备注

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/tool/data_helper.dart';
import 'package:flutter_app/util/routerUtil.dart';

/// MARK:自定义导航栏
//  @LastEditors: 陈胜辉
//  @Version: 版本号, YYYY-MM-DD
//  @param {type}
//  @return:
//  @Deprecated: 否
//  备注
class CustomNav extends StatelessWidget {
  CustomNav({
    Key key,
    this.height,
    this.defaultLeft = true,
    this.opacity = 1.0,
    this.sapce = 5.0,
    this.middleText = '',
    this.middle,
    this.backgroundColor,
    this.background,
    this.actionsMaxW,
    this.leftActions,
    this.rightActions,
  })  : assert(height == null || height >= CommonData.navH,
            '导航栏高度最小为${CommonData.navH}'),
        super(key: key);

  //高度
  final double height;
  //默认左侧按钮
  final bool defaultLeft;
  //屏幕两边空隙
  final double sapce;
  //透明度
  final double opacity;
  //标题文字
  final String middleText;
  //中间视图
  final Widget middle;
  //背景颜色
  final Color backgroundColor;
  //背景视图
  final Widget background;
  //默认 _actionW * count 如果超过需要设置
  final double actionsMaxW;
  //按钮集合
  final List<Widget> leftActions;
  final List<Widget> rightActions;

  @override
  Widget build(BuildContext context) {
    //配置视图
    return _handleWidget(context);
  }

  /// MARK:处理组件
  //  @LastEditors: 陈胜辉
  //  @Version: 版本号, YYYY-MM-DD
  //  @param {type}
  //  @return:
  //  @Deprecated: 否
  //  备注
  Widget _handleWidget(BuildContext context) {
    double _actionW = 48.0;
    //数据处理
    //背景颜色
    Color _backgroundColor = (this.backgroundColor != null)
        ? this.backgroundColor
        : Color.fromRGBO(97, 148, 244, 1);
    //透明度（0 ～ 1）
    double _opacity = max(min(this.opacity, 1), 0);
    //高度
    double _height = (height == null) ? CommonData.navAndStatusH : height;
    _height = max(CommonData.navH, _height);
    //事件宽度
    double _actionsMaxW = this.actionsMaxW;
    //左侧组件集合
    List<Widget> _leftActions = this.leftActions;
    //默认左侧返回按钮
    if (null == _leftActions && defaultLeft) {
      _leftActions = [_getNavBack(context)];
    }

    //取出有多少个按钮
    int count = max((_leftActions != null) ? _leftActions.length : 0,
        (this.rightActions != null) ? this.rightActions.length : 0);

    if (null == _actionsMaxW) {
      //默认
      _actionsMaxW = count * _actionW;
    }

    //中间组件
    Widget _middle = this.middle;
    if (null == _middle) {
      _middle = Container(
        alignment: Alignment.center,
        child: Text(
          middleText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      );
    }

    // 返回组件
    return Opacity(
      opacity: _opacity,
      child: Stack(
        children: <Widget>[
          //底部视图
          Container(
            width: CommonData.screenW,
            height: _height,
            color: backgroundColor,
            child: Stack(
              children: <Widget>[
                //底部背景
                Container(
                  width: CommonData.screenW,
                  height: _height,
                  color: _backgroundColor,
                  child: background,
                ),
                //上方内容
                Container(
                  margin: EdgeInsets.only(top: _height - CommonData.navH),
                  height: CommonData.navH,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //左边
                      Container(
                        width: _actionsMaxW,
                        margin: EdgeInsets.only(left: sapce),
                        child: (null == _leftActions)
                            ? null
                            : Row(
                                children: _leftActions,
                              ),
                      ),

                      //中间视图
                      Expanded(
                        child: _middle,
                      ),

                      //右边
                      Container(
                        width: _actionsMaxW,
                        margin: EdgeInsets.only(right: sapce),
                        child: (null == rightActions)
                            ? null
                            : Row(
                                children: rightActions,
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// MARK:导航栏按钮
  //  @LastEditors: 陈胜辉
  //  @Version: 版本号, YYYY-MM-DD
  //  @param {type}
  //  @return:
  //  @Deprecated: 否
  //  备注
  Widget _getNavBack(BuildContext context) {
    return BackButton(
      color: Colors.white,
      onPressed: () {
        RouterUtil.pop(context);
      },
    );
    // CupertinoButton(
    //   padding: EdgeInsets.only(left: 0),
    //   pressedOpacity: 0.8,
    //   child: Icon(
    //     Icons.arrow_back_ios,
    //     size: 20,
    //     color: Colors.white,
    //   ),
    //   onPressed: () {
    //     RouterUtil.pop(context);
    //   },
    // );
  }
}
