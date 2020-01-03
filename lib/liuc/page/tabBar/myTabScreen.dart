import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/page/tabBar/myTabController.dart';
import 'package:flutter_app/liuc/page/tabBar/tabFhirdScreen.dart';
import 'package:flutter_app/liuc/page/tabBar/tabFirstScreen.dart';
import 'package:flutter_app/liuc/page/tabBar/tabFourthScreen.dart';
import 'package:flutter_app/liuc/page/tabBar/tabScondScreen.dart';
import 'package:flutter_app/util/mediaUtil.dart';

// tab拖拽事件
enum TabDragStatus { start, end, cannel, draging }

class MyTabScreen extends StatefulWidget {
  MyTabScreen({Key key}) : super(key: key);

  @override
  _MyTabScreenState createState() => _MyTabScreenState();
}

class _MyTabScreenState extends State<MyTabScreen>
    with SingleTickerProviderStateMixin {
  final tablist = ['首页', '投资', '发现', '我的'];
  // tabBar动画控制器
  AnimationController _controller;
  // 导航线动画Animation
  Animation<double> _lineAnimation;
  // 导航文字动画Animation
  Animation<double> _fontSizeAnimation;
  // 导航线结束停留位置
  double _end = 0.0;
  // 导航线动画Tween
  Tween<double> _lineTween = new Tween<double>(begin: 0.0, end: 0.0);
  // 导航文字动画Tween
  Tween<double> _fontSizeTween = new Tween<double>(begin: 1, end: 1.25);
  // 动画执行时长
  Duration _duration = Duration(milliseconds: 200);
  // 页面控制器
  PageController _pageController;
  // tabbar拖拽控制器
  MyTabController _myTabController = MyTabController();

  // 当前页面索引
  int _currentIndex = 0;
  // 上一个选中索引
  int _prevIndex = 0;
  // tabbar关联的页面
  List<Widget> _pages = [];

  @override
  void initState() {
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
    _pageController.addListener(() {
      // debugPrint('page: ${_pageController.page}, currentIndex: $_currentIndex, _index: $_index');

      // if (_index != _currentIndex && _pageController.page == _currentIndex) {
      //   _animPlay();
      //   _index = _currentIndex;
      // }
    });
    _controller = AnimationController(
      duration: _duration,
      vsync: this,
    );

    _lineAnimation = _lineTween.animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc))
      ..addListener(() {
        setState(() {});
      });

    _fontSizeAnimation = _fontSizeTween
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear))
          ..addListener(() {
            setState(() {});
          });

    _controller.addStatusListener((res) {
      print("动画res:$res");
      if (res == AnimationStatus.completed) {
        // 导航线动画执行完成后把lineTween的开始位置修改为前一个动画的结束位置
        _lineTween.begin = _end;
      }
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageController.dispose();
    _myTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定tabbar页面'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // tabBar按钮
            _buildTabButtons(context),
            // 导航线
            _buildLine(context),
            // tabBar页面
            _buildPageView(context),
          ],
        ),
      ),
    );
  }

  /* MARK: 执行动画
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  void _animPlay() {
    if (!_controller.isAnimating) {
      _controller.reset();
      _controller.forward();
    }
  }

  /* MARK: tabBar切换导航线重新定位
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  _tabBarChange(BuildContext context, int index) {
    // 导航线动画结束位置
    _end = (MediaUtil.screenWidth(context) / tablist.length) * index;
    _lineTween.end = _end;
    print("teen begin:${_lineTween.begin}, end:${_lineTween.end}");
  }

  /* MARK: 创建tabBar页面
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: =
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
            // 正在滚动监听
          } else if (notification is ScrollUpdateNotification) {
            // 获取滚动信息
            final PageMetrics metrics = notification.metrics;
            //print(
            //    "notification update drag: ${notification.dragDetails}, page: ${metrics.page.toStringAsFixed(0)}, currentIndex:$_currentIndex, prevIndex: $_prevIndex");
            // 判断是否拖动
            if (notification.dragDetails == null) {
              // 拖动结束
              //print(
              //    "notification update drag: ${notification.dragDetails}, page: ${metrics.page.toStringAsFixed(0)}, currentIndex:$_currentIndex, prevIndex: $_prevIndex");
              // 判断是否允许执行动画
              if (_prevIndex != _currentIndex &&
                  metrics.page.toStringAsFixed(0) == _currentIndex.toString()) {
                _animPlay();
                _prevIndex = _currentIndex;
                _myTabController.changePage(_currentIndex, TabDragStatus.end);
              }
            } else {
              // 拖动开始
              if (_prevIndex != _currentIndex) {
                _myTabController.changePage(_currentIndex, TabDragStatus.start);
              }
            }
            // 滚动结束
          } else if (notification is ScrollEndNotification) {
            print("notification end metrics: ${notification.dragDetails}");
            // final PageMetrics metrics = notification.metrics;
            print("notification end.....");
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
          // 禁止两侧弹性动画（有弹性动画时会报超出边缘bug）
          physics: ClampingScrollPhysics(),
          children: _pages.map((v) => v).toList(),
          // 页面拖动切换事件
          onPageChanged: (index) {
            _currentIndex = index;
            debugPrint("pagechanged: $index");
            // tabBar切换导航线重新定位
            _tabBarChange(context, index);
            // _animPlay();
          },
        ),
      ),
    );
  }

  /// 创建TabBar下划跟随线
  _buildLine(BuildContext context) {
    return Container(
      height: 4,
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(left: _lineAnimation.value),
      width: MediaUtil.screenWidth(context) / tablist.length,
      color: Colors.blue,
    );
  }

  /// 创建tabBar按钮
  _buildTabButtons(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              textColor: Colors.white,
              child: Transform(
                alignment: Alignment.center,
                // 通过变形动画解决纯字体放大出现的文字抖动问题
                transform: _currentIndex == 0
                    ? Matrix4.diagonal3Values(_fontSizeAnimation.value,
                        _fontSizeAnimation.value, _fontSizeAnimation.value)
                    : Matrix4.diagonal3Values(1, 1, 1),
                child: Text(
                  '首页',
                  style: TextStyle(
                      fontSize: 18,
                      color:
                          _currentIndex == 0 ? Colors.black : Colors.black54),
                ),
              ),
              onPressed: () {
                print('首页按钮点击');
                _currentIndex = 0;
                // 页面切换动画
                _pageController.animateToPage(_currentIndex,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.bounceInOut)
                  ..whenComplete(() {
                    debugPrint("首页滑动动画执行完成成！");
                  });
              },
            ),
          ),
          Expanded(
            child: FlatButton(
              textColor: Colors.white,
              child: Transform(
                alignment: Alignment.center,
                // 通过变形动画解决纯字体放大出现的文字抖动问题
                transform: _currentIndex == 1
                    ? Matrix4.diagonal3Values(_fontSizeAnimation.value,
                        _fontSizeAnimation.value, _fontSizeAnimation.value)
                    : Matrix4.diagonal3Values(1, 1, 1),
                child: Text(
                  '投资',
                  style: TextStyle(
                    fontSize: 18,
                    color: _currentIndex == 1 ? Colors.black : Colors.black54,
                  ),
                ),
              ),
              onPressed: () {
                print('投资按钮点击');
                _currentIndex = 1;
                // 页面切换动画
                _pageController.animateToPage(_currentIndex,
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
              textColor: Colors.white,
              child: Transform(
                alignment: Alignment.center,
                // 通过变形动画解决纯字体放大出现的文字抖动问题
                transform: _currentIndex == 2
                    ? Matrix4.diagonal3Values(_fontSizeAnimation.value,
                        _fontSizeAnimation.value, _fontSizeAnimation.value)
                    : Matrix4.diagonal3Values(1, 1, 1),
                child: Text(
                  '发现',
                  style: TextStyle(
                    fontSize: 18,
                    color: _currentIndex == 2 ? Colors.black : Colors.black54,
                  ),
                ),
              ),
              onPressed: () {
                print('发现按钮点击');
                _currentIndex = 2;
                // 页面切换动画
                _pageController.animateToPage(_currentIndex,
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
              textColor: Colors.white,
              child: Transform(
                alignment: Alignment.center,
                // 通过变形动画解决纯字体放大出现的文字抖动问题
                transform: _currentIndex == 3
                    ? Matrix4.diagonal3Values(_fontSizeAnimation.value,
                        _fontSizeAnimation.value, _fontSizeAnimation.value)
                    : Matrix4.diagonal3Values(1, 1, 1),
                child: Text(
                  '我的',
                  style: TextStyle(
                    fontSize: 18,
                    color: _currentIndex == 3 ? Colors.black : Colors.black54,
                  ),
                ),
              ),
              onPressed: () {
                print('我的按钮点击');
                _currentIndex = 3;
                // 页面切换动画
                _pageController.animateToPage(_currentIndex,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.bounceInOut)
                  ..whenComplete(() {
                    debugPrint("我的滑动动画执行完成！");
                  });
              },
            ),
          ),
        ],
      ),
    );
  }
}
