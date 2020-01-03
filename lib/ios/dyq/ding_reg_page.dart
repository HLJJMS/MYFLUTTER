import 'package:flutter/material.dart';
import 'dart:async';

class DingRegPage extends StatefulWidget {
  DingRegPage({Key key}) : super(key: key);

  @override
  _DingRegPageState createState() => _DingRegPageState();
}

class _DingRegPageState extends State<DingRegPage> {
  String phoneText = "";
  String smsText = "";
  String pwdText = "";
  bool _isEyeClosed = true;
  bool _isXieYiChosed = true;
  bool _isShowClear = false;//是否显示输入框尾部的清除按钮

  //定义变量
  Timer _timer;

  //倒计时数值
  var _countdownTime = 0;

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
    return GestureDetector(
      onTap: () {
        hiddenKeyboard();
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: GestureDetector(
              child: Image.asset('images/loginBack.png'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            actions: <Widget>[
              Container(
//              width: 22,
                padding: EdgeInsets.only(right: 15),
                alignment: Alignment.center,
//              color: Colors.black54,
                child: GestureDetector(
                  child: Text(
                    '登录',
                    style: TextStyle(
                        fontSize: 14.5, color: Color.fromRGBO(54, 90, 247, 1)),
                  ),
                  onTap: () {
                    hiddenKeyboard();
                  },
                ),
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    height: 36,
//                color: Colors.purple,
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      '注册',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  //请输入有效11位手机号
                  Container(
                    height: 46,
                    foregroundDecoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromRGBO(234, 234, 234, 1)))),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: '请输入有效11位手机号',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(208, 208, 208, 1),
                            fontSize: 17,
                          ),
                          border: InputBorder.none,
                        suffixIcon: _isShowClear ? Container(
                          width: 24,
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                phoneText = "";
                                _isShowClear = false;
                              });
                            },
                            child: Icon(Icons.clear),
                          ),
                        ):null,
//                        filled: true,
//                        fillColor: Colors.red
                      ),
                      controller: TextEditingController.fromValue(
                          TextEditingValue(
                              text: phoneText,
                              selection: TextSelection.fromPosition(
                                  TextPosition(
                                      affinity: TextAffinity.downstream,
                                      offset: phoneText.length)))),
                      onChanged: (text) {
                        if (text.length > 0) {
                          setState(() {
                            _isShowClear = true;
                          });
                        }else{
                          setState(() {
                            _isShowClear = false;
                          });
                        }
                        if (text.length > 11) {
                          setState(() {
                            phoneText = text.substring(0, 11);
                          });
                        } else {
                          phoneText = text;
                        }
                        print(text);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  //请输入短信验证码
                  Container(
                    height: 46,
                    foregroundDecoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromRGBO(234, 234, 234, 1)))),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: '请输入短信验证码',
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(208, 208, 208, 1),
                                  fontSize: 17,
                                ),
                                border: InputBorder.none),
                            controller: TextEditingController.fromValue(
                                TextEditingValue(
                                    text: smsText,
                                    selection: TextSelection.fromPosition(
                                        TextPosition(
                                            affinity: TextAffinity.downstream,
                                            offset: smsText.length)))),
                            onChanged: (text) {
                              if (text.length > 6) {
                                setState(() {
                                  smsText = text.substring(0, 6);
                                });
                              } else {
                                smsText = text;
                              }
                              print(text);
                            },
                          ),
                        ),
                        Container(
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
                              onPressed:
                                  _countdownTime == 0 ? _startCountdown : null,
                              child: Container(
//                              color: Colors.black54,
                                padding: EdgeInsets.all(0.0),
                                margin: EdgeInsets.all(0.0),
                                alignment: Alignment.centerRight,
                                child: _getYzmButton(),
                              )),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  //请设置6-16位字母与数字的组合密码
                  Container(
                    height: 46,
                    foregroundDecoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromRGBO(234, 234, 234, 1)))),
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                              obscureText: _isEyeClosed,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                hintText: '请设置6-16位字母与数字的组合密码',
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(208, 208, 208, 1),
                                  fontSize: 17,
                                ),
                                border: InputBorder.none,
                                suffixIcon: _isEyeClosed ? Container(
                                  width: 24,
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        _isEyeClosed = !_isEyeClosed;
                                      });
                                    },
                                    child: Image.asset('images/loginYanjing.png'),
                                  ),
                                ):Container(
                                  width: 24,
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        _isEyeClosed = !_isEyeClosed;
                                      });
                                    },
                                    child: Image.asset('images/loginYanjingico.png'),
                                  ),
                                ),
                              ),
                              controller: TextEditingController.fromValue(
                                  TextEditingValue(
                                      text: pwdText,
                                      selection: TextSelection.fromPosition(
                                          TextPosition(
                                              affinity: TextAffinity.downstream,
                                              offset: pwdText.length)))),
                              onChanged: (text) {
                                if (text.length > 16) {
                                  setState(() {
                                    pwdText = text.substring(0, 16);
                                  });
                                } else {
                                  pwdText = text;
                                }
                                print(text);
                              },
                            ),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  // 注册
                  Container(
                    height: 45,
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: FlatButton(
                        //child按钮中的内容
                        textColor: Colors.white,
                        //文字颜色
                        disabledTextColor: Colors.white,
                        //按钮禁用时的文字颜色
                        color: Color.fromRGBO(54, 90, 247, 1),
                        //背景颜色
                        disabledColor: Color.fromRGBO(182, 195, 255, 1),
                        //按钮禁用时的背景颜色
                        highlightColor: Color.fromRGBO(54, 90, 247, 1),
                        //按钮按下时的背景颜色
                        splashColor: Color.fromRGBO(54, 90, 247, 0),
                        ////按钮主题，默认是浅色主题
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.5)),
                        onPressed: () {
                          hiddenKeyboard();
//                    Navigator.push(context, MaterialPageRoute(builder: (context) => DingRegPage()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "注册",
                            style: TextStyle(fontSize: 16),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  // 协议
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 19,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        //协议点击
                        Container(
                          padding: EdgeInsets.only(right: 3),
//                      width: 17,
//                      height: 17,
                          child: GestureDetector(
                            child: _isXieYiChosed
                                ? Image.asset(
                                    'images/loginAgree.png',
                                  )
                                : Image.asset(
                                    'images/loginDissAgree.png',
                                  ),
                            onTap: () {
                              print('协议点击');
                              hiddenKeyboard();
                              setState(() {
                                _isXieYiChosed = !_isXieYiChosed;
                              });
                            },
                          ),
                        ),
                        Text(
                          '登录遇到问题？点击',
                          style: TextStyle(
                            color: Color.fromRGBO(154, 154, 154, 1),
                            fontSize: 13.5,
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            "联系客服",
                            style: TextStyle(
                                fontSize: 13.5,
                                color: Color.fromRGBO(54, 90, 247, 1)),
                          ),
                          onTap: () {
                            print('联系客服');
                            hiddenKeyboard();
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

//关闭键盘
  void hiddenKeyboard() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

//根据倒计时获取响应的widget
  Widget _getYzmButton() {
    if (_countdownTime == 0) {
      return Text(
        "   获取验证码",
        style: TextStyle(fontSize: 15),
      );
    } else {
      return Text(
        "   重新发送(" + _countdownTime.toString() + ")",
        style: TextStyle(fontSize: 15),
      );
    }
  }

  //倒计时方法
  _startCountdown() {
    _countdownTime = 60;
    final call = (timer) {
      setState(() {
        if (_countdownTime < 1) {
          _timer.cancel();
        } else {
          _countdownTime -= 1;
        }
      });
    };
    _timer = Timer.periodic(Duration(seconds: 1), call);
  }
}
