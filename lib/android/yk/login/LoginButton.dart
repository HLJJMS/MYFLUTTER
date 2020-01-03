import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {

  LoginButton({this.onClick});

  final Function onClick;

  void _smsClick() {
    onClick();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 68,
        ),
        new Container(
          height: 45,
          width: double.infinity,
          margin: EdgeInsets.only(left: 20.0, right: 20.0),
          child: FlatButton(
            color: const Color(0xFF365AF7),
            highlightColor: const Color(0xFFB6C3FF),
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("登录"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22.5)),
            onPressed: () {
              _smsClick();
            },
          ),
        ),
      ],
    );
  }
}
