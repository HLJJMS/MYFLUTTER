import 'package:flutter/material.dart';
import 'dart:async';
typedef _CallBack = void Function();
class TimeButton extends StatefulWidget {

  //倒计时数值
  int countdownTime = 0;
  String timeStr;
  String normalStr;
  _CallBack callBack;
  TimeButton({this.countdownTime,this.timeStr,this.normalStr,this.callBack});

  @override
  _TimeButtonState createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  //倒计时数值
  int _countdownTime = 0;
  //定义变量
  Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
          padding: EdgeInsets.all(0.0),
          //文字颜色
          textColor: Color.fromRGBO(255, 114, 19, 1),
          //按钮禁用时的文字颜色
          disabledTextColor:
          Color.fromRGBO(173, 173, 173, 1),
          //背景颜色
          color: Color.fromRGBO(255, 114, 19, 0),
          //按钮禁用时
          disabledColor: Color.fromRGBO(255, 114, 19, 0),
          //按钮按下时的背景颜色
          highlightColor: Color.fromRGBO(255, 114, 19, 0),
          //按钮按下时的水波纹颜色
          splashColor: Color.fromRGBO(255, 114, 19, 0),
          onPressed:(_countdownTime != 0) ? null:(){
            _startCountdown();
            widget.callBack();
          },
          child: Container(
//                              color: Colors.black54,
            padding: EdgeInsets.all(0.0),
            margin: EdgeInsets.all(0.0),
            alignment: Alignment.center,
            child: _getYzmButton(),
          )),
    );
  }

  //根据倒计时获取响应的widget
  Widget _getYzmButton() {
    if (_countdownTime == 0) {
      return Text(
        widget.normalStr,
        style: TextStyle(fontSize: 15),
      );
    } else {
      return Text(
        _getTimeStr(),
        style: TextStyle(fontSize: 15),
      );
    }
  }
  String _getTimeStr(){
    if (widget.timeStr.contains('#')){
      return widget.timeStr.replaceAll('#', _countdownTime.toString());
    }else{
      return widget.timeStr + _countdownTime.toString();
    }
  }
  //倒计时方法
  _startCountdown() {
    print('_startCountdown');
    _countdownTime = widget.countdownTime;
    final call = (timer) {
      setState(() {
        if (_countdownTime < 1) {
          _timer.cancel();
        } else {
          _countdownTime -= 1;
        }
      });
      print(_countdownTime);
    };
    _timer = Timer.periodic(Duration(seconds: 1), call);
  }
}