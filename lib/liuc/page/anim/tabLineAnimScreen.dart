import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/page/tabBar/myTabController.dart';
import 'package:flutter_app/liuc/page/tabBar/tabFhirdScreen.dart';
import 'package:flutter_app/liuc/page/tabBar/tabFirstScreen.dart';
import 'package:flutter_app/liuc/page/tabBar/tabFourthScreen.dart';
import 'package:flutter_app/liuc/page/tabBar/tabScondScreen.dart';
import 'package:flutter_app/util/mediaUtil.dart';
import 'package:flutter_app/liuc/page/tabBar/myTabScreen.dart';

// 导航动画方向
enum LineAnimDirection { left, right }

class TabLineAnimScreen extends StatefulWidget {
  TabLineAnimScreen({Key key}) : super(key: key);

  @override
  _TabLineAnimScreenState createState() => _TabLineAnimScreenState();
}

class _TabLineAnimScreenState extends State<TabLineAnimScreen>
    with SingleTickerProviderStateMixin {
  // tabBar右移动动画控制器
  AnimationController _animController;
  // 导航线动画Animation
  Animation<double> _lineAnimation;
  // 导航线动画Tween
  Tween<double> _lineTween = new Tween<double>(begin: 30.0, end: 0.0);
  // 动画执行时长
  Duration _duration = Duration(milliseconds: 400);
  // 当前页面索引
  int _currentIndex = 0;
  // 导航线head结束位置
  double _leftEnd = 0;
  // 导航线foot结束位置
  double _rightEnd = 0;
  // 导航线head结束位置
  double _leftDragEnd = 0;
  // 导航线foot结束位置
  double _rightDragEnd = 0;

  // 线宽
  double _lineWidth = 40;
  // tabbar宽度
  double _tabBarWidth = 300;
  // tabs文字列表
  List<String> tabs = ['首页', '投资', '发现', '我的'];

  Animation<double> _lineLeftAnimation;
  Animation<double> _lineRightAnimation;

  Tween<double> _lineLeftTween;
  Tween<double> _lineRightTween;

  double _firstTime = 0;
  double _sceondTime = 0.3;
  // 导航线动画方向
  // LineAnimDirection _direction = LineAnimDirection.right;
  // 页面控制器
  PageController _pageController;
  // tabbar拖拽控制器
  MyTabController _myTabController = MyTabController();
  // tabbar关联的页面
  List<Widget> _pages = [];
  // 上一个选中索引
  int _prevIndex = 0;
  // 两个tab导航线之间的距离
  double _distance = 0;
  int animStatus = 0;

  @override
  void initState() {
    debugPrint('initState.....');
    super.initState();
    _pageController = PageController();
    _myTabController = MyTabController();
    // pageView页面
    _pages = [
      // 首页
      TabFirstScreen(myTabController: _myTabController),
      // 投资
      TabScondScreen(myTabController: _myTabController),
      // 发现
      TabFhirdScreen(myTabController: _myTabController),
      // 我的
      TabFourthScreen(myTabController: _myTabController)
    ];
    _animController = AnimationController(
      duration: _duration,
      vsync: this,
    );
    getMarginLeftRight(0);
    _lineLeftTween = Tween(begin: _leftEnd, end: 0);
    _lineRightTween = Tween(begin: _rightEnd, end: 0);

    _distance = ((_tabBarWidth / tabs.length) * 0 +
            ((_tabBarWidth / tabs.length) - _lineWidth) / 2) -
        ((_tabBarWidth / tabs.length) * 1 +
            ((_tabBarWidth / tabs.length) - _lineWidth) / 2);

    debugPrint("距离 _distance: $_distance");

    _lineLeftAnimation = _lineLeftTween.animate(CurvedAnimation(
      parent: _animController,
      curve: Interval(_sceondTime, 1, curve: Curves.easeInOut),
    ))
      ..addListener(() {
        setState(() {});
      });

    _lineRightAnimation = _lineRightTween.animate(CurvedAnimation(
      parent: _animController,
      curve: Interval(_firstTime, 1, curve: Curves.easeInOut),
    ))
      ..addListener(() {
        setState(() {});
      });

    _lineAnimation = _lineTween.animate(
        CurvedAnimation(parent: _animController, curve: Curves.easeInOutCirc))
      ..addListener(() {
        setState(() {});
      });

    _animController.addStatusListener((res) {
      print("动画res:$res");
      if (res == AnimationStatus.completed) {
        // 导航线动画执行完成后把lineTween的开始位置修改为前一个动画的结束位置
        _lineLeftTween.begin = _lineLeftTween.end;
        _lineRightTween.begin = _lineRightTween.end;
      }
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    _pageController.dispose();
    _myTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('build.....');
    return Scaffold(
        appBar: AppBar(
          title: Text('导航线动画'),
        ),
        body: Column(
          children: <Widget>[
            _tabBarView(context),
            _buildPageView(context),
          ],
        ));
  }

  Widget _tabBarView(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 44,
      child: Container(
        width: _tabBarWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
              child: _buildTabButtons(context),
            ),
            _buildLine(context),
          ],
        ),
      ),
    );
  }

  double start = 0;
  double dragFx = 0;
  double rightSx = 0;
  double leftSx = 0;
//_buildPageView(context)
  /* MARK: 创建tabBar页面
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  _buildPageView(BuildContext context) {
    return Expanded(
      // 滚动监听
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          // 开始滚动时监听
          if (notification is ScrollStartNotification) {
            print("notification start metrics: ${notification.dragDetails}");
            start = (notification.metrics as PageMetrics).page;
            // 正在滚动监听
          } else if (notification is ScrollUpdateNotification) {
            // 获取滚动信息
            final PageMetrics metrics = notification.metrics;
            //print(
            //    "notification update drag: ${notification.dragDetails}, page: ${metrics.page.toStringAsFixed(0)}, currentIndex:$_currentIndex, prevIndex: $_prevIndex");
            if (start > metrics.page) {
              dragFx = -1; // 左滑动
            } else {
              dragFx = 1; // 右滑动
            }
            // 判断是否拖动
            if (notification.dragDetails == null) {
              // 拖动结束
              _myTabController.tabDragStatus = TabDragStatus.end;
              print(
                  "notification update drag: ${notification.dragDetails}, page: ${metrics.page.toStringAsFixed(0)}, currentIndex:$_currentIndex, prevIndex: $_prevIndex");
              _lineLeftTween.begin = _leftDragEnd;
              _lineRightTween.begin = _rightDragEnd;
              if (animStatus == 0) {
                animStatus = 1;
                debugPrint('执行导航线动画.....');
                _resetAnim(_currentIndex,
                    direction: _leftDragEnd - _leftEnd >= 0
                        ? LineAnimDirection.left
                        : LineAnimDirection.right);
                _playAnim();
              }
              // 判断是否允许执行动画
              // if (_prevIndex != _currentIndex &&
              //     metrics.page.toStringAsFixed(0) == _currentIndex.toString()) {
              //   _playAnim();
              //   _prevIndex = _currentIndex;
              //   _myTabController.changePage(_currentIndex, TabDragStatus.end);
              // }

              setState(() {});
            } else {
              animStatus = 0;
              // 拖动开始
              _myTabController.tabDragStatus = TabDragStatus.draging;
              if (_leftDragEnd == 0) _leftDragEnd = _leftEnd;
              if (_rightDragEnd == 0) _rightDragEnd = _rightEnd;
              // if (_prevIndex != _currentIndex) {
              //   _myTabController.changePage(_currentIndex, TabDragStatus.start);
              // }

              var page = (metrics.page - metrics.page.toInt()).abs();
              if (dragFx == 1) {
                // 右滑动
                if (page < 0.5) {
                  _rightDragEnd = _rightEnd + (_distance - _lineWidth) * page;
                  _leftDragEnd = _leftEnd + _lineWidth * page;
                  rightSx = _rightDragEnd - (_rightEnd + _distance);
                  leftSx = _leftEnd - _distance - _leftDragEnd;
                } else {
                  // debugPrint('page 大于 0.5 rightSx: $rightSx');
                  _rightDragEnd = (_rightEnd + _distance) +
                      rightSx -
                      2 * (page - 0.5) * rightSx;
                  _leftDragEnd = (_leftEnd - _distance) -
                      leftSx +
                      2 * (page - 0.5) * leftSx;
                }
              } else {
                debugPrint("左滑动....");
                if (page > 0.5) {
                  _leftDragEnd =
                      _leftEnd + (_distance - _lineWidth) * (1 - page);
                  _rightDragEnd = _rightEnd + _lineWidth * (1 - page);
                  leftSx = _leftDragEnd - (_leftEnd + _distance);
                  rightSx = _rightDragEnd - (_rightEnd + _distance);
                } else {
                  _leftDragEnd =
                      _leftEnd + _distance + leftSx - 2 * (0.5 - page) * leftSx;
                  _rightDragEnd = _rightEnd +
                      _distance +
                      rightSx +
                      2 * (0.5 - page) * rightSx;
                }
              }

              debugPrint(
                  "_currentIndex: $_currentIndex, page: $page, metrics.page: ${metrics.page}, _rightEnd: $_rightEnd, _leftEnd: $_leftEnd, _rightDragEnd: $_rightDragEnd, _leftDragEnd: $_leftDragEnd， rightSx： $rightSx, leftSx: $leftSx");
              setState(() {});
            }
            // 滚动结束
          } else if (notification is ScrollEndNotification) {
            print("notification end metrics: ${notification.dragDetails}");
            // final PageMetrics metrics = notification.metrics;
            print("notification end.....");
            _myTabController.tabDragStatus = TabDragStatus.end;
            // if (_index != _currentIndex && metrics.page == _currentIndex) {
            //   _animPlay();
            //   _index = _currentIndex;
            // }
          }
        },
        child: PageView(
          dragStartBehavior: DragStartBehavior.start,
          pageSnapping: true,
          controller: _pageController,
          // 禁止两侧弹性动画（有弹性动��时会报超��边缘bug）
          physics: ClampingScrollPhysics(),
          children: _pages.map((v) => v).toList(),
          // 页面拖动切换事件
          onPageChanged: (index) {
            //_currentIndex = index;
            // tabBar切换导航线重新定位
            _tabBarChange(context, index);
            // _animPlay();
          },
        ),
      ),
    );
  }

  /* MARK: tabBar切���导航线重新定位
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  _tabBarChange(BuildContext context, int index) {
    // 导航线动画结束位置
    // _end = (MediaUtil.screenWidth(context) / tabs.length) * index;
    // _lineTween.end = _end;
    //print("teen begin:${_lineTween.begin}, end:${_lineTween.end}");
    debugPrint(
        '_tabBarChange index: $index, TabDragStatus: ${_myTabController.tabDragStatus}');
    _currentIndex = index;
    if (_myTabController.tabDragStatus != TabDragStatus.draging) {
      _resetAnim(index);
    }
  }

  void getMarginLeftRight(int index) {
    _leftEnd = (_tabBarWidth / tabs.length) * index +
        ((_tabBarWidth / tabs.length) - _lineWidth) / 2;
    _rightEnd = _tabBarWidth - _leftEnd - _lineWidth;
  }

  void _resetAnim(int index, {LineAnimDirection direction}) {
    debugPrint("_resetAnim......index: $index");
    if (direction == null) {
      if (_currentIndex > index) {
        direction = LineAnimDirection.left;
      } else {
        direction = LineAnimDirection.right;
      }
    }

    debugPrint("currentIndex: $_currentIndex, index: $index, 方向：$direction");
    _currentIndex = index;
    getMarginLeftRight(index);
    _lineLeftTween.end = _leftEnd;
    _lineRightTween.end = _rightEnd;
    _lineLeftAnimation.removeListener(() {});
    _lineRightAnimation.removeListener(() {});

    _lineLeftAnimation = _lineLeftTween.animate(CurvedAnimation(
      parent: _animController,
      curve: Interval(
          direction == LineAnimDirection.right ? _sceondTime : _firstTime, 1,
          curve: Curves.easeInOut),
    ))
      ..addListener(() {
        setState(() {});
      });

    _lineRightAnimation = _lineRightTween.animate(CurvedAnimation(
      parent: _animController,
      curve: Interval(
          direction == LineAnimDirection.right ? _firstTime : _sceondTime, 1,
          curve: Curves.easeInOut),
    ))
      ..addListener(() {
        setState(() {});
      });

    debugPrint('head begin:${_lineLeftTween.begin}, end:${_lineLeftTween.end}');
    debugPrint(
        'foot begin:${_lineRightTween.begin}, end:${_lineRightTween.end}');
  }

  void _playAnim() {
    if (!_animController.isAnimating) {
      _animController.forward(from: 0);
    }
  }

  Widget _buildTabButtons(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.all(0),
            child: Container(
              child: Text(
                '首页',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            onPressed: () {
              debugPrint('首页点击！');
              // _resetAnim(0);
              // 页面切换动画
              _pageController.animateToPage(0,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.bounceInOut)
                ..whenComplete(() {
                  debugPrint("首页滑动动画执行完成！");
                });
            },
          ),
        ),
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.all(0),
            child: Container(
              child: Text(
                '投资',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            onPressed: () {
              debugPrint('投资点击！');

              // _resetAnim(1);
              // 页面切换动画
              _pageController.animateToPage(1,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.bounceInOut)
                ..whenComplete(() {
                  debugPrint("投资滑动动画执行完成！");
                });
            },
          ),
        ),
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.all(0),
            child: Container(
              child: Text(
                '发现',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            onPressed: () {
              debugPrint('发现点击！');
              // _resetAnim(2);
              // 页面切换动画
              _pageController.animateToPage(2,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.bounceInOut)
                ..whenComplete(() {
                  debugPrint("发现滑动动画执行完成！");
                });
            },
          ),
        ),
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.all(0),
            child: Container(
              child: Text(
                '我的',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            onPressed: () {
              debugPrint('我的点击！');

              // _resetAnim(3);
              // _playAnim();
              // 页面切换动画
              _pageController.animateToPage(3,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.bounceInOut)
                ..whenComplete(() {
                  debugPrint("我的滑动动画执行完成！");
                });
            },
          ),
        )
      ],
    );
  }

  Widget _buildLine(BuildContext context) {
    return Container(
      height: 4,
      margin: EdgeInsets.only(
          left: _myTabController.tabDragStatus == TabDragStatus.draging
              ? _leftDragEnd
              : _lineLeftAnimation.value,
          right: _myTabController.tabDragStatus == TabDragStatus.draging
              ? _rightDragEnd
              : _lineRightAnimation.value),
      color: Colors.red,
    );
  }
}
