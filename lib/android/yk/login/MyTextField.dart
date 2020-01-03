import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  MyTextField({
    Key key,
    this.title,
    this.hintText,
    this.textInputType,
    this.maxLength,
    this.startUsingClear,
    this.startUsingEye,
    this.startUsingRightText,
  }) : super(key: key);

  final String title;
  final String hintText;
  final TextInputType textInputType;
  final int maxLength;
  final bool startUsingClear;
  final bool startUsingEye;
  final bool startUsingRightText;

  @override
  State<StatefulWidget> createState() {
    return MyTextFieldState(
      title,
      hintText,
      textInputType,
      maxLength,
      startUsingClear,
      startUsingEye,
      startUsingRightText,
    );
  }
}

class MyTextFieldState extends State<MyTextField> {
  MyTextFieldState(
      this.title,
      this.hintText,
      this.textInputType,
      this.maxLength,
      this.startUsingClear,
      this.startUsingEye,
      this.startUsingRightText);

  // 输入框标题
  final String title;

  // 输入框默认显示内容
  final String hintText;

  // 输入框 输入类型
  final TextInputType textInputType;

  // 输入内容最大数量
  final int maxLength;

  // 是否启用清除按钮
  final bool startUsingClear;

  // 是否启用查看密码按钮
  final bool startUsingEye;

  // 是否启用右侧文字按钮
  final bool startUsingRightText;

  // 查看密码图标
  var eyeIcon = Icons.visibility_off;

  // 输入框输入内容
  var inputText = "";

  // 清除按钮是否显示 默认不显示
  var hideClear = true;

  // 清除按钮边距
  var clearPaddingLeft = 0.0;
  var clearPaddingRight = 0.0;

  // 查看密码按钮边距
  var eyePaddingLeft = 0.0;
  var eyePaddingRight = 0.0;

  // 右侧文字按钮边距
  var rightTextPaddingLeft = 0.0;
  var rightTextPaddingRight = 0.0;

  // 是否显示输入内容 默认为显示
  var obscureText = false;

  // 计时器
  Timer time;

  // 右侧按钮文本
  String rightText = '获取验证码';

  // 倒计时数字
  int num = 59;

  FocusNode _focusNode = FocusNode();

  String getText() {
    return inputText;
  }

  @override
  void initState() {
    // 输入框 焦点监听
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        if (inputText.length > 0) {
          _isShowClear(false);
        } else {
          _isShowClear(true);
        }
      } else {
        _isShowClear(true);
      }
    });
    if (startUsingClear && !startUsingEye && !startUsingRightText) {
      // 只显示清除按钮 初始化
      clearPaddingLeft = 28.0;
      clearPaddingRight = 28.0;
    } else if (startUsingClear && startUsingEye && !startUsingRightText) {
      // 显示清除按钮和查看密码按钮
      clearPaddingLeft = 8.5;
      clearPaddingRight = 8.5;
      eyePaddingLeft = 8.5;
      eyePaddingRight = 20.0;
      obscureText = true;
    } else if (!startUsingClear && !startUsingEye && startUsingRightText) {
      // 显示右侧文字按钮
      rightTextPaddingLeft = 20.0;
      rightTextPaddingRight = 20.0;
    }
    super.initState();
  }

  void _isShowClear(bool show) {
    setState(() {
      hideClear = show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, bottom: 2),
          child: new Text(
            title,
            style: TextStyle(fontSize: 12.0, color: const Color(0xFFADADAD)),
          ),
        ),
        Row(
          children: <Widget>[
            Container(
              width: 20,
            ),
            Expanded(
              child: TextField(
                maxLength: maxLength,
                controller: TextEditingController.fromValue(
                  TextEditingValue(
                    text: inputText,
                    selection: TextSelection.fromPosition(
                      TextPosition(
                          affinity: TextAffinity.downstream,
                          offset: inputText.length),
                    ),
                  ),
                ),
                focusNode: _focusNode,
                keyboardType: textInputType,
                obscureText: obscureText,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: const Color(0xFFD0D0D0),
                    fontSize: 17.0,
                  ),
                  border: InputBorder.none,
                  counterText: "",
                  contentPadding: EdgeInsets.all(0),
                ),
                onChanged: (text) {
                  inputText = text;
                  if (inputText.length > 0) {
                    _isShowClear(false);
                  } else {
                    _isShowClear(true);
                  }
                  print(text);
                },
              ),
            ),
            Offstage(
              offstage: !startUsingClear ?? true,
              child: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(
                  left: clearPaddingLeft,
                  right: clearPaddingRight,
                ),
                child: Offstage(
                  child: GestureDetector(
                    child: new Icon(
                      Icons.cancel,
                      color: const Color(0xFFD0D0D0),
                      size: 15,
                    ),
                    onTap: () {
                      setState(() {
                        hideClear = true;
                        inputText = "";
                      });
                    },
                  ),
                  offstage: hideClear,
                ),
              ),
            ),
            Offstage(
              offstage: !startUsingEye ?? true,
              child: Container(
                margin: EdgeInsets.only(
                  left: eyePaddingLeft,
                  right: eyePaddingRight,
                ),
                child: GestureDetector(
                  child: new Icon(
                    eyeIcon,
                    color: const Color(0xFFD0D0D0),
                    size: 20,
                  ),
                  onTap: () {
                    setState(() {
                      if (eyeIcon == Icons.visibility) {
                        eyeIcon = Icons.visibility_off;
                        obscureText = true;
                      } else {
                        eyeIcon = Icons.visibility;
                        obscureText = false;
                      }
                    });
                  },
                ),
              ),
            ),
            Offstage(
              offstage: !startUsingRightText ?? true,
              child: Container(
                margin: EdgeInsets.only(
                  left: rightTextPaddingLeft,
                  right: rightTextPaddingRight,
                ),
                child: GestureDetector(
                  child: Text(
                    rightText,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: const Color(0xFFFF7213),
                    ),
                  ),
                  onTap: () {
                    reGetCountdown();
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void reGetCountdown() {
    setState(() {
      if (time != null) {
        return;
      }
      rightText = '${num--}重新获取';
      time = new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          if (num > 0) {
            rightText = '${num--}重新获取';
          } else {
            rightText = '获取验证码';
            num = 59;
            time.cancel();
            time = null;
          }
        });
      });
    });
  }

  // 不要忘记在这里释放掉Timer
  @override
  void dispose() {
    time?.cancel();
    time = null;
    super.dispose();
  }
}
