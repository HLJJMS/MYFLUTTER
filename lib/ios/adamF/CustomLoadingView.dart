import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///加载弹框
class ProgressDialog {
  static bool _isShowing = false;

  ///展示
  static void showProgress(BuildContext context,
      {Widget child = const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.red),
      )}) {
    if (!_isShowing) {
      _isShowing = true;
      Navigator.push(
        context,
        _PopRoute(
          child: _Progress(
            child: child,
          ),
        ),
      );
    }
  }

  ///隐藏
  static void dismiss(BuildContext context) {
    if (_isShowing) {
      Navigator.of(context).pop();
      _isShowing = false;
    }
  }
}

///Widget
class _Progress extends StatelessWidget {
  final Widget child;
  final String loadingTitle; //等待文字
  final double titleFont; //字体大小
  final FontWeight titlestyle; // 字体样式
  final int titleTextColor; // 字体颜色
  final bool ishiddenTitle; //是否隐藏   loading 文字  默认 false  不隐藏

  _Progress({
    Key key,
    @required this.child,
    this.loadingTitle = "加载中",
    this.titleFont = 16,
    this.titlestyle = FontWeight.normal,
    this.titleTextColor = 0xff333333,
    this.ishiddenTitle = false,
  })  : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color.fromRGBO(0, 0, 0, 0.3),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: child,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  loadingTitle,
                  style: TextStyle(
                      fontSize: titleFont,
                      fontWeight: titlestyle,
                      color: Color(titleTextColor)),
                ),
              ),
            ],
          ),
        ));
  }
}

///Route
class _PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  _PopRoute({@required this.child});

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
