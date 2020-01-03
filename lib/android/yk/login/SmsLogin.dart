import 'package:flutter/material.dart';

class SmsLogin extends StatelessWidget {
  SmsLogin({this.onClick});

  final Function onClick;

  void _smsClick() {
    onClick();
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20, top: 20),
          child: GestureDetector(
            child: Text(
              "验证码登录",
              style: TextStyle(
                fontSize: 14.0,
                color: const Color(0xFF666666),
              ),
            ),
            onTap: () {
              print("点击了验证码登录");
              _smsClick();
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 20, top: 20),
          child: Text(
            "忘记密码",
            style: TextStyle(
              fontSize: 14.0,
              color: const Color(0xFF666666),
            ),
          ),
        ),
      ],
    );
  }
}
