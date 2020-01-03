import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter/material.dart' as prefix0;
// import 'package:flutter/scheduler.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/widgets.dart';

/// 经典Footer
class ZQCClassicalFooter extends Footer {
  /// Key
  final Key key;

  /// 方位
  final AlignmentGeometry alignment;

  /// 提示加载文字
  final String loadText;

  /// 准备加载文字
  final String loadReadyText;

  /// 正在加载文字
  final String loadingText;

  /// 加载完成文字
  final String loadedText;

  /// 加载失败文字
  final String loadFailedText;

  /// 没有更多文字
  final String noMoreText;

  /// 显示额外信息(默认为时间)
  final bool showInfo;

  /// 更多信息
  final String infoText;

  /// 背景颜色
  final Color bgColor;

  /// 字体颜色
  final Color textColor;

  /// 更多信息文字颜色
  final Color infoColor;

  /// Header的高度
  final double extent;

  /// 触发刷新的距离
  final double triggerDistance;

  /// Header背景图片
  final String backImageUrlStr;

  /* MARK: 自定义footer
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  ZQCClassicalFooter({
    this.backImageUrlStr:
        'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1246190829,2813517358&fm=11&gp=0.jpg',
    this.extent = 200.0,
    this.triggerDistance = 200.0,
    float = false, //是否浮动
    completeDuration = const Duration(seconds: 1), //完成延时
    enableInfiniteLoad = true, //是否开启无限刷新
    enableHapticFeedback = true, //是否开启震动反馈
    this.key,
    this.alignment,
    this.loadText: "请下拉加载",
    this.loadReadyText: "松开加载",
    this.loadingText: "加载中",
    this.loadedText: "加载完成",
    this.loadFailedText: "加载失败",
    this.noMoreText: "没有更多内容",
    this.showInfo: true,
    this.infoText: "于%T加载",
    this.bgColor: Colors.transparent, // 背景色
    this.textColor: Colors.white, // 提示文字箭头颜色
    this.infoColor: Colors.white, // 副标题颜色
  }) : super(
          extent: extent,
          triggerDistance: triggerDistance,
          float: float,
          completeDuration: completeDuration,
          enableInfiniteLoad: enableInfiniteLoad,
          enableHapticFeedback: enableHapticFeedback,
        );

  @override
  Widget contentBuilder(
      BuildContext context,
      LoadMode loadState,
      double pulledExtent,
      double loadTriggerPullDistance,
      double loadIndicatorExtent,
      AxisDirection axisDirection,
      bool float,
      Duration completeDuration,
      bool enableInfiniteLoad,
      bool success,
      bool noMore) {
    return ZQCClassicalFooterWidget(
      key: key,
      zqcClassicalFooter: this,
      loadState: loadState,
      pulledExtent: pulledExtent,
      loadTriggerPullDistance: loadTriggerPullDistance,
      loadIndicatorExtent: loadIndicatorExtent,
      axisDirection: axisDirection,
      float: float,
      completeDuration: completeDuration,
      enableInfiniteLoad: enableInfiniteLoad,
      success: success,
      noMore: noMore,
    );
  }
}

/* MARK: 自定义footer组件
 * @LastEditors: 郑群昌
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */

class ZQCClassicalFooterWidget extends StatefulWidget {
  final ZQCClassicalFooter zqcClassicalFooter;
  final LoadMode loadState;
  final double pulledExtent;
  final double loadTriggerPullDistance;
  final double loadIndicatorExtent;
  final AxisDirection axisDirection;
  final bool float;
  final Duration completeDuration;
  final bool enableInfiniteLoad;
  final bool success;
  final bool noMore;

  ZQCClassicalFooterWidget(
      {Key key,
      this.loadState,
      this.zqcClassicalFooter,
      this.pulledExtent,
      this.loadTriggerPullDistance,
      this.loadIndicatorExtent,
      this.axisDirection,
      this.float,
      this.completeDuration,
      this.enableInfiniteLoad,
      this.success,
      this.noMore})
      : super(key: key);

  @override
  ZQCClassicalFooterWidgetState createState() =>
      ZQCClassicalFooterWidgetState();
}

class ZQCClassicalFooterWidgetState extends State<ZQCClassicalFooterWidget>
    with TickerProviderStateMixin<ZQCClassicalFooterWidget> {
  // 是否到达触发加载距离
  bool _overTriggerDistance = false;
  bool get overTriggerDistance => _overTriggerDistance;
  set overTriggerDistance(bool over) {
    if (_overTriggerDistance != over) {
      _overTriggerDistance
          ? _readyController.forward()
          : _restoreController.forward();
    }
    _overTriggerDistance = over;
  }

  // 动画
  AnimationController _readyController;
  Animation<double> _readyAnimation;
  AnimationController _restoreController;
  Animation<double> _restoreAnimation;

  // Icon旋转度
  double _iconRotationValue = 1.0;

  // 显示文字
  String get _showText {
    if (widget.noMore) return widget.zqcClassicalFooter.noMoreText;
    if (widget.enableInfiniteLoad) {
      if (widget.loadState == LoadMode.loaded ||
          widget.loadState == LoadMode.inactive ||
          widget.loadState == LoadMode.drag) {
        return widget.zqcClassicalFooter.loadedText;
      } else {
        return widget.zqcClassicalFooter.loadingText;
      }
    }
    switch (widget.loadState) {
      case LoadMode.load:
        return widget.zqcClassicalFooter.loadingText;
      case LoadMode.armed:
        return widget.zqcClassicalFooter.loadingText;
      case LoadMode.loaded:
        return _finishedText;
      case LoadMode.done:
        return _finishedText;
      default:
        if (overTriggerDistance) {
          return widget.zqcClassicalFooter.loadReadyText;
        } else {
          return widget.zqcClassicalFooter.loadText;
        }
    }
  }

  // 加载结束文字
  String get _finishedText {
    if (!widget.success) return widget.zqcClassicalFooter.loadFailedText;
    if (widget.noMore) return widget.zqcClassicalFooter.noMoreText;
    return widget.zqcClassicalFooter.loadedText;
  }

  // 加载结束图标
  IconData get _finishedIcon {
    if (!widget.success) return Icons.error_outline;
    if (widget.noMore) return Icons.hourglass_empty;
    return Icons.done;
  }

  // 更新时间
  DateTime _dateTime;
  // 获取更多信息
  String get _infoText {
    if (widget.loadState == LoadMode.loaded) {
      _dateTime = DateTime.now();
    }
    String fillChar = _dateTime.minute < 10 ? "0" : "";
    return widget.zqcClassicalFooter.infoText
        .replaceAll("%T", "${_dateTime.hour}:$fillChar${_dateTime.minute}");
  }

  @override
  void initState() {
    super.initState();
    // 初始化时间
    _dateTime = DateTime.now();
    // 初始化动画
    _readyController = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _readyAnimation = new Tween(begin: 0.5, end: 1.0).animate(_readyController)
      ..addListener(() {
        setState(() {
          if (_readyAnimation.status != AnimationStatus.dismissed) {
            _iconRotationValue = _readyAnimation.value;
          }
        });
      });
    _readyAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _readyController.reset();
      }
    });
    _restoreController = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _restoreAnimation =
        new Tween(begin: 1.0, end: 0.5).animate(_restoreController)
          ..addListener(() {
            setState(() {
              if (_restoreAnimation.status != AnimationStatus.dismissed) {
                _iconRotationValue = _restoreAnimation.value;
              }
            });
          });
    _restoreAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _restoreController.reset();
      }
    });
  }

  @override
  void dispose() {
    _readyController.dispose();
    _restoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 是否为垂直方向
    bool isVertical = widget.axisDirection == AxisDirection.down ||
        widget.axisDirection == AxisDirection.up;
    // 是否反向
    bool isReverse = widget.axisDirection == AxisDirection.up ||
        widget.axisDirection == AxisDirection.left;
    // 是否到达触发加���距离
    overTriggerDistance = widget.loadState != LoadMode.inactive &&
        widget.pulledExtent >= widget.loadTriggerPullDistance;
    return Stack(
      children: <Widget>[
        Positioned(
          top: !isVertical ? 0.0 : !isReverse ? 0.0 : null,
          bottom: !isVertical ? 0.0 : isReverse ? 0.0 : null,
          left: isVertical ? 0.0 : !isReverse ? 0.0 : null,
          right: isVertical ? 0.0 : isReverse ? 0.0 : null,
          child: Container(
            alignment: widget.zqcClassicalFooter.alignment ?? isVertical
                ? !isReverse ? Alignment.topCenter : Alignment.bottomCenter
                : isReverse ? Alignment.centerRight : Alignment.centerLeft,
            width: !isVertical
                ? widget.loadIndicatorExtent > widget.pulledExtent
                    ? widget.loadIndicatorExtent
                    : widget.pulledExtent
                : double.infinity,
            height: isVertical
                ? widget.loadIndicatorExtent > widget.pulledExtent
                    ? widget.loadIndicatorExtent
                    : widget.pulledExtent
                : double.infinity,
            color: widget.zqcClassicalFooter.bgColor,
            child: SizedBox(
              height: isVertical ? widget.loadIndicatorExtent : double.infinity,
              width: !isVertical ? widget.loadIndicatorExtent : double.infinity,
              child: isVertical
                  ? _buildRowContentWithBack(isVertical, isReverse)
                  : _buildColumnContentWithBack(isVertical, isReverse),
            ),
          ),
        ),
      ],
    );
  }

  //行视图增加背景
  Widget _buildRowContentWithBack(bool isVertical, bool isReverse) {
    return Stack(
      children: <Widget>[
        Image.network(
          widget.zqcClassicalFooter.backImageUrlStr,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildContent(isVertical, isReverse),
        )
      ],
    );
  }

  //列视图增加背景
  Widget _buildColumnContentWithBack(bool isVertical, bool isReverse) {
    return Stack(
      children: <Widget>[
        Image.network(
          widget.zqcClassicalFooter.backImageUrlStr,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildContent(isVertical, isReverse),
        ),
      ],
    );
  }

  // 构建显示内容
  List<Widget> _buildContent(bool isVertical, bool isReverse) {
    return isVertical
        ? <Widget>[
            Expanded(
              flex: 2,
              child: SizedBox(),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(
                  right: 10.0,
                  top: 100,
                ),
                child: (widget.loadState == LoadMode.load ||
                            widget.loadState == LoadMode.armed) &&
                        !widget.noMore
                    ? Container(
                        width: 20.0,
                        height: 20.0,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor: AlwaysStoppedAnimation(
                            widget.zqcClassicalFooter.textColor,
                          ),
                        ),
                      )
                    : widget.loadState == LoadMode.loaded ||
                            widget.loadState == LoadMode.done ||
                            (widget.enableInfiniteLoad &&
                                widget.loadState != LoadMode.loaded) ||
                            widget.noMore
                        ? Icon(
                            _finishedIcon,
                            color: widget.zqcClassicalFooter.textColor,
                          )
                        : Transform.rotate(
                            child: Icon(
                              !isReverse
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              color: widget.zqcClassicalFooter.textColor,
                            ),
                            angle: 2 * pi * _iconRotationValue,
                          ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                  ),
                  Text(
                    _showText,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: widget.zqcClassicalFooter.textColor,
                    ),
                  ),
                  widget.zqcClassicalFooter.showInfo
                      ? Container(
                          margin: EdgeInsets.only(
                            top: 2.0,
                          ),
                          child: Text(
                            _infoText,
                            style: TextStyle(
                              fontSize: 10.0,
                              color: widget.zqcClassicalFooter.infoColor,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ]
        : <Widget>[
            Container(
              child: widget.loadState == LoadMode.load ||
                      widget.loadState == LoadMode.armed
                  ? Container(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor: AlwaysStoppedAnimation(
                          widget.zqcClassicalFooter.textColor,
                        ),
                      ),
                    )
                  : widget.loadState == LoadMode.loaded ||
                          widget.loadState == LoadMode.done ||
                          (widget.enableInfiniteLoad &&
                              widget.loadState != LoadMode.loaded) ||
                          widget.noMore
                      ? Icon(
                          _finishedIcon,
                          color: widget.zqcClassicalFooter.textColor,
                        )
                      : Transform.rotate(
                          child: Icon(
                            !isReverse ? Icons.arrow_back : Icons.arrow_forward,
                            color: widget.zqcClassicalFooter.textColor,
                          ),
                          angle: 2 * pi * _iconRotationValue,
                        ),
            ),
          ];
  }
}
