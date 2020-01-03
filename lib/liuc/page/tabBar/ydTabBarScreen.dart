import 'package:flutter/material.dart';
import 'package:flutter_app/util/mediaUtil.dart';

class YdTabBarScreen extends StatefulWidget {
  YdTabBarScreen({Key key}) : super(key: key);

  @override
  _YdTabBarScreenState createState() => _YdTabBarScreenState();
}

class _YdTabBarScreenState extends State<YdTabBarScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Duration _duration;
  Tween<double> _line = Tween<double>(begin: 0, end: 0);
  Animation<double> _lineAnimation;
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _duration = Duration(milliseconds: 200);
    _controller = AnimationController(duration: _duration, vsync: this);
    _lineAnimation = _line.animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });
    // _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('tabBar'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTabBtns(context),
            _buildLine(context),
            _buildPages(context),
          ],
        ));
  }

  Widget _buildTabBtns(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              color: Colors.black,
              child: Container(
                child: Text('首页',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              onPressed: () {
                debugPrint('首页按钮点击！');
                //_line.begin = 0;
                _currentIndex = 0;
                _line.end =
                    (MediaUtil.screenWidth(context) / 4) * _currentIndex;
                _controller.forward(from: 0);
                _controller.addStatusListener((status) {
                  _line.begin = _line.end;
                });
              },
            ),
          ),
          Expanded(
            child: FlatButton(
              color: Colors.black,
              child: Container(
                child: Text('投资',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              onPressed: () {
                debugPrint('投资按钮点击！');

                _currentIndex = 1;
                _line.end =
                    (MediaUtil.screenWidth(context) / 4) * _currentIndex;
                _controller.forward(from: 0);
                _controller.addStatusListener((status) {
                  _line.begin = _line.end;
                });
              },
            ),
          ),
          Expanded(
            child: FlatButton(
              color: Colors.black,
              child: Container(
                child: Text('发现',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              onPressed: () {
                debugPrint('发现按钮点击！');
                _currentIndex = 2;
                _line.end =
                    (MediaUtil.screenWidth(context) / 4) * _currentIndex;
                _controller.forward(from: 0);
                _controller.addStatusListener((status) {
                  _line.begin = _line.end;
                });
              },
            ),
          ),
          Expanded(
            child: FlatButton(
              color: Colors.black,
              child: Container(
                child: Text('我的',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              onPressed: () {
                debugPrint('我的按钮点击！');
                _currentIndex = 3;
                _line.end =
                    (MediaUtil.screenWidth(context) / 4) * _currentIndex;
                debugPrint('begin:${_line.begin}, end:${_line.end}');
                _controller.forward(from: 0);
                _controller.addStatusListener((status) {
                  if (status == AnimationStatus.completed) {
                    _line.begin = _line.end;
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLine(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 4,
      margin: EdgeInsets.only(left: _lineAnimation.value),
      width: MediaUtil.screenWidth(context) / 4,
    );
  }

  Widget _buildPages(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}
