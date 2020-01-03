import 'package:flutter/material.dart';

class PasswordLogin extends StatelessWidget {
  PasswordLogin({this.onClick});

  final Function onClick;

  void _passwordClick() {
    onClick();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(left: 20, top: 20),
      child: GestureDetector(
        child: Text(
          "密码登录",
          style: TextStyle(
            fontSize: 14.0,
            color: const Color(0xFF666666),
          ),
        ),
        onTap: () {
          print("点击了密码登录");
          _passwordClick();
        },
      ),
    );
  }
}
