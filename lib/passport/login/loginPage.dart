import 'package:flutter/material.dart';
import 'package:flutter_app/android/yk/login/LoginButton.dart';
import 'package:flutter_app/android/yk/login/MyTextField.dart';
import 'package:flutter_app/android/yk/login/PasswordLogin.dart';
import 'package:flutter_app/android/yk/login/SmsLogin.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  bool smsTextField = false;
  bool smsText = true;
  bool passwordTextField = true;
  bool passwordText = false;
  String inputStr = "";

  final GlobalKey<MyTextFieldState> phoneTextFieldKey =
      GlobalKey<MyTextFieldState>();
  final GlobalKey<MyTextFieldState> smsTextFieldKey =
      GlobalKey<MyTextFieldState>();
  final GlobalKey<MyTextFieldState> passwordTextFieldKey =
      GlobalKey<MyTextFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/image/arrow_back.png'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          Container(
            height: double.infinity,
            padding: EdgeInsets.only(right: 15, left: 15),
            alignment: Alignment.center,
            child: GestureDetector(
              child: Text(
                "注册",
                style: TextStyle(
                  fontSize: 15.0,
                  color: const Color(0xff365AF7),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, "dingReg");
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 标题
            Container(
                padding: EdgeInsets.only(top: 15, left: 20, bottom: 47),
                child: Text(
                  "欢迎登录小银号",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: const Color(0xFF333333),
                    fontWeight: FontWeight.w700,
                  ),
                )),
            // 手机号输入框
            MyTextField(
              key: phoneTextFieldKey,
              title: "手机号码",
              hintText: "请输入有效11位手机号",
              textInputType: TextInputType.number,
              maxLength: 11,
              startUsingClear: true,
              startUsingEye: false,
              startUsingRightText: false,
            ),
            Container(
              padding: EdgeInsets.only(top: 11),
            ),
            Divider(
              height: 0.5,
              indent: 20.0,
              endIndent: 20.0,
              color: const Color(0xFFEAEAEA),
            ),
            // 短信验证码输入框
            Offstage(
              offstage: smsTextField,
              child: Container(
                margin: EdgeInsets.only(top: 18),
                child: MyTextField(
                  key: smsTextFieldKey,
                  title: "验证码",
                  hintText: "请输入短信验证码",
                  textInputType: TextInputType.number,
                  maxLength: 6,
                  startUsingClear: false,
                  startUsingEye: false,
                  startUsingRightText: true,
                ),
              ),
            ),
            // 密码输入框
            Offstage(
              offstage: passwordTextField,
              child: Container(
                margin: EdgeInsets.only(top: 18),
                child: MyTextField(
                  key: passwordTextFieldKey,
                  title: "登录密码",
                  hintText: "请输入登录密码",
                  textInputType: TextInputType.visiblePassword,
                  maxLength: 18,
                  startUsingClear: true,
                  startUsingEye: true,
                  startUsingRightText: false,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 11),
            ),
            Divider(
              height: 0.5,
              indent: 20.0,
              endIndent: 20.0,
              color: const Color(0xFFEAEAEA),
            ),
            // 密码登录
            Offstage(
              offstage: passwordText,
              child: PasswordLogin(onClick: passwordLoginClick),
            ),
            // 验证码登录 忘记密码
            Offstage(
              offstage: smsText,
              child: SmsLogin(onClick: smsLoginClick),
            ),
            // 登录按钮
            LoginButton(onClick: loginBtnClick),
            Container(
              padding: EdgeInsets.only(top: 22),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "登录遇到问题？点击",
                  style: TextStyle(
                    fontSize: 13.5,
                    color: const Color(0xFF9A9A9A),
                  ),
                ),
                GestureDetector(
                  child: Text(
                    "联系客服",
                    style: TextStyle(
                      fontSize: 13.5,
                      color: const Color(0xFF365AF7),
                    ),
                  ),
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "点击了联系客服",
                        toastLength: Toast.LENGTH_SHORT,
                        backgroundColor: Colors.red,
                        textColor: Colors.white);
                  },
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 100),
            ),
            Text(inputStr),
          ],
        ),
      ),
    );
  }

  void smsLoginClick() {
    setState(() {
      smsTextField = false;
      smsText = true;
      passwordTextField = true;
      passwordText = false;
    });
  }

  void passwordLoginClick() {
    setState(() {
      smsTextField = true;
      smsText = false;
      passwordTextField = false;
      passwordText = true;
    });
  }

  void loginBtnClick() {
    var phoneText = "手机号：" + phoneTextFieldKey.currentState.getText();
    var twoText = "";
    // 登录方式为 密码登录时
    if (smsTextField) {
      twoText = "密码：" + passwordTextFieldKey.currentState.getText();
    } else {
      twoText = "验证码：" + smsTextFieldKey.currentState.getText();
    }
    setState(() {
      inputStr = phoneText + "\n" + twoText;
    });
  }
}
