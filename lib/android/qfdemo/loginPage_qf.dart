import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// @Description: 登录页面

/// @Author: 齐峰

/// @Date:2019-11-14 10:12:58

/// @Version: 1.0

/// @LastEditors:齐峰

/// @LastEditTime:2019-11-14 10:13:19

/// @Deprecated: false

class LoginPage_qf extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage_qfState();
  }
}

class _LoginPage_qfState extends State<LoginPage_qf> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
//      onTap: hiddenKeyboard(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("登录"),
        ),
        body: new EditTextWidget(),
      ),
    );
  }

}

class EditTextWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _EditTextWidget();
  }
}

class _EditTextWidget extends State<EditTextWidget> {
  TextEditingController _zhController = new TextEditingController();
  TextEditingController _mmController = new TextEditingController();
  TextEditingController _smsController = new TextEditingController();

  //倒計時時間
  var _countdownTime = 0;
  Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              labelText: '请输入账号', prefixIcon: Icon(Icons.account_box)),
          keyboardType: TextInputType.number,
          onChanged: (String str) {
            print(str);
          },
          controller: _zhController,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    labelText: '请输入短信验证码', prefixIcon: Icon(Icons.list)),
                controller: _smsController,
              ),
            ),
            FlatButton(
                child: _getYzmButton(),
                onPressed: () {
//                  if (_countdownTime == 0) {
                  _getSMS();
//                  }
                })
          ],
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
              labelText: '请输入密码', prefixIcon: Icon(Icons.keyboard_return)),
          controller: _mmController,
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          height: 50,
          width: 240,
          child: FlatButton(
            textColor: Colors.white,
            color: Colors.blueAccent,
            shape: RoundedRectangleBorder(
                //圆角
                borderRadius: BorderRadius.circular(12.5)),
            onPressed: () {
              print('点击了登录按钮'); //去登录
              hiddenKeyboard();
              setState(() {
                _zhController.text;
              });
            },
            child: Text(
              '登录',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  hiddenKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  _getSMS() {
    if (_timer != null) {
      return;
    }
    _countdownTime = 5;
    _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdownTime < 1) {
          _timer.cancel();
          _timer = null;
        } else {
          _countdownTime -= 1;
        }
      });
    });
  }

  //根据倒计时获取响应的widget
  Widget _getYzmButton() {
    if (_countdownTime == 0) {
      return Text(
        "获取验证码",
        style: TextStyle(color: Colors.orange, fontSize: 15),
      );
    } else {
      return Text(
        "重新发送($_countdownTime)",
        style: TextStyle(color: Colors.grey, fontSize: 15),
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }
}
