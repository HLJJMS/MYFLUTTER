/* @Description: 类描述
 * @Author: 郑群昌
 * @Date: 2019-11-18 13:28:45
 * @Version: 版本号, YYYY-MM-DD
 * @LastEditors: 郑群昌
 * @LastEditTime: 2019-11-20 14:20:47
 * @Deprecated: 否
 */
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';
import 'testSqflite.dart';

class RegisterZQCView extends StatefulWidget {
  // This class is the configuration for the state. It holds the
  // values (in this nothing) provided by the parent and used by the build
  // method of the State. Fields in a Widget subclass are always marked "final".

  @override
  RegisterZQCState createState() => new RegisterZQCState();
}

class RegisterZQCState extends State<RegisterZQCView> {
  var windWidth;
  var windHeight;
  var bodyHeight;
  var isPhoneLabelVisible = true;
  var isCodeVisible = true;
  var ispasswordVisible = true;
  var ispasswordSecret = false;
  var isAgree = false;
  var isEnable = false;
  var secretImage = Image.asset(
    'assets/image/pwd_un_look.png',
  );
  var agreementImage = Image.asset(
    'assets/image/icon_un_select.png',
  );
  TextEditingController _phoneTextEditingController =
      new TextEditingController();
  FocusNode _phoneFocusNode = new FocusNode();

  TextEditingController _codeTextEditingController =
      new TextEditingController();
  FocusNode _codeFocusNode = new FocusNode();

  var _codeButtonColor = Color.fromRGBO(255, 114, 19, 1);
  Timer _countdownTimer;
  int _countdownNum = 60;
  String _codeCountdownStr = '获取验证码';

  TextEditingController _passwordTextEditingController =
      new TextEditingController();
  FocusNode _passwordFocusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    _phoneFocusNode.addListener(_focusNodeLisener);
    _codeFocusNode.addListener(_focusNodeLisener);
    _passwordFocusNode.addListener(_focusNodeLisener);
  }

  /* MARK: 焦点监听
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: void
   * @Deprecated: 否
   */
  Future<Null> _focusNodeLisener() async {
    if (_phoneFocusNode.hasFocus) {
      if (!mounted) return;
      setState(() {
        isPhoneLabelVisible = false;
      });
    } else {
      if (!mounted) return;
      setState(() {
        isPhoneLabelVisible = true;
      });
    }
    if (_codeFocusNode.hasFocus) {
      if (!mounted) return;
      setState(() {
        isCodeVisible = false;
      });
    } else {
      if (!mounted) return;
      setState(() {
        isCodeVisible = true;
      });
    }
    if (_passwordFocusNode.hasFocus) {
      if (!mounted) return;
      setState(() {
        ispasswordVisible = false;
      });
    } else {
      if (!mounted) return;
      setState(() {
        ispasswordVisible = true;
      });
    }
  }

  @override
  void dispose() {
    _phoneFocusNode.removeListener(_focusNodeLisener);
    _phoneFocusNode.dispose();
    _codeFocusNode.removeListener(_focusNodeLisener);
    _codeFocusNode.dispose();
    _passwordFocusNode.removeListener(_focusNodeLisener);
    _passwordFocusNode.dispose();
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    windWidth = size.width;
    windHeight = size.height;
    bodyHeight = windHeight -
        MediaQueryData.fromWindow(window).padding.top -
        kToolbarHeight; //body的高度（屏幕高度减去状态栏高度减去导航栏高度）

    //状态栏高度
    //final double statusH = MediaQueryData.fromWindow(window).padding.top;
    //底部安全区域
    //final double bottomH = MediaQueryData.fromWindow(window).padding.bottom;

    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.white),
      home: new Scaffold(
          appBar: new AppBar(
            elevation: 0, //去掉appbar底部线和阴影
            leading: IconButton(
                icon: ImageIcon(new AssetImage('assets/image/nav_back.png')),
                onPressed: () {
                  Navigator.pop(context);
                }),
            actions: <Widget>[
              FlatButton(
                child: new Text(
                  '登录',
                  style: new TextStyle(
                    fontSize: 14.5,
                    color: Color.fromRGBO(54, 90, 247, 1),
                  ),
                ),
                onPressed: _pushToLogin,
              )
            ],
          ),
          body: _mainBackView()),
    );
  }

  //主视图
  // Widget _mainBackView() {
  //   return new Container(
  //     constraints: new BoxConstraints.expand(
  //         width: double.infinity, height: double.infinity),
  //     color: Colors.white,
  //     child: new Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       //crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         // Padding(
  //         //   padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
  //         //   child: _mainScrollView(),
  //         // ),
  //         //_mainScrollView(),
  //         Expanded(
  //             child: new GestureDetector(
  //           child: _mainScrollView(),
  //           onTap: _keybordDown,
  //         )),

  //         Padding(
  //           padding: EdgeInsets.only(bottom: 30, top: 0.0),
  //           child: new Container(
  //             height: 18,
  //             //color: Colors.red,
  //             child: _versionLabel(),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  /* MARK: 主视图
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _mainBackView() {
    return new Container(
      constraints: new BoxConstraints.expand(
          width: double.infinity, height: double.infinity),
      color: Colors.white,
      child: new GestureDetector(
        child: Listener(
          child: _mainScrollView(),
          onPointerMove: (movePointEvent) {
            _keybordDown();
          },
        ),
        onTap: _keybordDown,
      ),
    );
  }

  /* MARK: 主scrollview
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _mainScrollView() {
    final versionHeight = 18.0; //当前版本号的高度
    final versionButtom = 30.0; //当前版本号距下的距离
    return new SingleChildScrollView(
        child: Column(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          // constraints: BoxConstraints.expand(
          //     width: double.infinity, height: double.infinity),
          width: double.infinity,
          height: bodyHeight - versionHeight - versionButtom,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 13, left: 20),
                child: new Text(
                  '注册',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(51, 51, 51, 1),
                  ),
                ),
              ),
              _phoneContainer(),
              _codeContainer(),
              _passwordContainer(),
              _registerButton(),
              _agreementView(),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: versionButtom, top: 0.0),
          child: new Container(
            height: versionHeight,
            //color: Colors.red,
            child: _versionLabel(),
          ),
        )
      ],
    ));
  }

  /* MARK: 输入手机号视图
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _phoneContainer() {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 47, right: 20),
      child: new Container(
        height: 55.0,
        width: double.infinity,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              height: 17,
              child: Offstage(
                offstage: isPhoneLabelVisible,
                child: new Text(
                  '手机号',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(173, 173, 173, 1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: new Container(
                height: 24,
                child: new TextField(
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromRGBO(51, 51, 51, 1),
                  ),
                  focusNode: _phoneFocusNode,
                  keyboardType: TextInputType.number,
                  controller: _phoneTextEditingController,
                  decoration: InputDecoration(
                    hintText: '请输入有效11位手机号',
                    hintStyle: TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(208, 208, 208, 1),
                    ),
                    border: InputBorder.none,
                    suffix: new GestureDetector(
                      child: new Container(
                        width: 15,
                        height: 15,
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.only(bottom: 0.0),
                        child: Center(
                          child: new Image.asset(
                            'assets/image/ic_clear.png',
                            width: 10,
                            height: 10,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      onTap: _clearPhoneTextField,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                  ),
                  onChanged: (text) {
                    _cheking();
                  },
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 11),
              child: new Container(
                height: 1,
                width: double.infinity,
                color: Color.fromRGBO(234, 234, 234, 1),
              ),
            )
          ],
        ),
      ),
    );
  }

  /* MARK: 清空手机号
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  void _clearPhoneTextField() {
    print(_phoneTextEditingController.text);
    _phoneTextEditingController.clear();
    _cheking();
  }

  /* MARK: 验证码视图
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _codeContainer() {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 18, right: 20),
      child: new Container(
        height: 55.0,
        width: double.infinity,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              height: 17,
              child: Offstage(
                offstage: isCodeVisible,
                child: new Text(
                  '验证码',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(173, 173, 173, 1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: new Container(
                  width: double.infinity,
                  height: 24,
                  constraints: BoxConstraints.expand(
                      width: double.infinity, height: 24.0),
                  //color: Colors.yellow,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Expanded(
                        child: new TextField(
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromRGBO(51, 51, 51, 1),
                          ),
                          focusNode: _codeFocusNode,
                          keyboardType: TextInputType.number,
                          controller: _codeTextEditingController,
                          decoration: InputDecoration(
                            hintText: '请输入短信验证码',
                            hintStyle: TextStyle(
                              fontSize: 17,
                              color: Color.fromRGBO(208, 208, 208, 1),
                            ),
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0.0),
                          ),
                          onChanged: (text) {
                            _cheking();
                          },
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(6),
                          ],
                        ),
                      ),
                      new GestureDetector(
                        child: Text(
                          _codeCountdownStr,
                          style: TextStyle(
                              fontSize: 15.0,
                              color: _codeButtonColor,
                              fontFamily: 'Helvetica Neue'),
                        ),
                        onTap: _runTimer,
                      )
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 11),
              child: new Container(
                height: 1,
                width: double.infinity,
                color: Color.fromRGBO(234, 234, 234, 1),
              ),
            )
          ],
        ),
      ),
    );
  }

  /* MARK: 倒计时
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  void _runTimer() {
    setState(() {
      if (_countdownTimer != null) {
        return;
      }
      // Timer的第一秒倒计时是有一点延迟的，为了立刻显示效果可以添加下一行。
      _codeCountdownStr = '重新发送(${_countdownNum--})';
      _countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          if (_countdownNum > 0) {
            _codeCountdownStr = '重新发送(${_countdownNum--})';
          } else {
            _codeCountdownStr = '获取验证码';
            _countdownNum = 60;
            _countdownTimer.cancel();
            _countdownTimer = null;
          }
        });
      });
    });
  }

  /* MARK: 密码视图
   * @LastEditors: 郑����昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _passwordContainer() {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 18, right: 20),
      child: new Container(
        height: 55.0,
        width: double.infinity,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              height: 17,
              child: Offstage(
                offstage: ispasswordVisible,
                child: new Text(
                  '登录密码',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(173, 173, 173, 1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.0),
              child: new Container(
                  height: 24,
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Expanded(
                          child: new TextField(
                            style: TextStyle(
                              fontSize: 17,
                              color: Color.fromRGBO(51, 51, 51, 1),
                            ),
                            obscureText: ispasswordSecret,
                            focusNode: _passwordFocusNode,
                            //keyboardType: TextInputType.number,
                            controller: _passwordTextEditingController,
                            decoration: InputDecoration(
                              hintText: '请设置6-16位字母与数字的组合密码',
                              hintStyle: TextStyle(
                                fontSize: 17,
                                color: Color.fromRGBO(208, 208, 208, 1),
                              ),
                              border: InputBorder.none,
                              suffix: new GestureDetector(
                                child: new Container(
                                  width: 15,
                                  height: 15,
                                  margin: EdgeInsets.only(right: 10),
                                  padding: EdgeInsets.only(bottom: 0.0),
                                  child: Center(
                                    child: new Image.asset(
                                      'assets/image/ic_clear.png',
                                      width: 10,
                                      height: 10,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                onTap: _clearpasswordTextField,
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 0.0),
                            ),
                            onChanged: (text) {
                              _cheking();
                            },
                            inputFormatters: <TextInputFormatter>[
                              //WhitelistingTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(16),
                            ],
                          ),
                        ),
                        new IconButton(
                          icon: secretImage,
                          onPressed: () {
                            if (!mounted) return;
                            setState(() {
                              ispasswordSecret = !ispasswordSecret;
                              if (ispasswordSecret == true) {
                                secretImage =
                                    Image.asset('assets/image/pwd_look.png');
                              } else {
                                secretImage =
                                    Image.asset('assets/image/pwd_un_look.png');
                              }
                            });
                          },
                        ),
                      ])),
            ),
            Padding(
              padding: EdgeInsets.only(top: 11),
              child: new Container(
                height: 1,
                width: double.infinity,
                color: Color.fromRGBO(234, 234, 234, 1),
              ),
            )
          ],
        ),
      ),
    );
  }

  /* MARK: 清理密码
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  void _clearpasswordTextField() {
    print(_passwordTextEditingController.text);
    _passwordTextEditingController.clear();
    _cheking();
  }

  /* MARK: 注册按钮视图
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _registerButton() {
    return Padding(
      padding: EdgeInsets.only(top: 36, left: 20, right: 20),
      child: new Container(
        width: double.infinity,
        height: 45,
        decoration: new BoxDecoration(
          //border: new Border.all(color: Colors.yellow, width: 0.0),
          borderRadius: new BorderRadius.all(new Radius.circular(22.5)),
          color: isEnable
              ? Color.fromRGBO(54, 90, 247, 1)
              : Color.fromRGBO(182, 195, 255, 1),
        ),
        child: FlatButton(
          child: new Text(
            '注册',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          onPressed: isEnable
              ? () {
                  _showSomeDailog('去注册');
                }
              : null,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22.5) //设置圆角
              ),
        ),
      ),
    );
  }

  /* MARK: 协议模块视图
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _agreementView() {
    return Padding(
      padding: EdgeInsets.only(top: 17, left: 20, right: 20),
      child: new Container(
          width: double.infinity,
          height: 17,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Container(
                    height: double.infinity,
                    width: 20,
                    child: new GestureDetector(
                      child: agreementImage,
                      onTap: () {
                        if (!mounted) return;
                        setState(() {
                          isAgree = !isAgree;
                          if (isAgree == true) {
                            agreementImage =
                                Image.asset('assets/image/icon_select.png');
                          } else {
                            agreementImage =
                                Image.asset('assets/image/icon_un_select.png');
                          }
                          _cheking();
                        });
                      },
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: new Text.rich(
                  new TextSpan(
                    text: '点击注册，即表示您同意',
                    style: new TextStyle(
                      color: Color.fromRGBO(154, 154, 154, 1),
                      fontSize: 12.0,
                      decoration: TextDecoration.none,
                    ),
                    children: <TextSpan>[
                      new TextSpan(
                        text: '《银多网服务协议》',
                        style: new TextStyle(
                          color: Color.fromRGBO(54, 90, 247, 1),
                          fontSize: 12.0,
                          decoration: TextDecoration.none,
                        ),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () {
                            _showSomeDailog('跳去看协议');
                          },
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  /* MARK: 版本号视图
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _versionLabel() {
    return Text(
      '当前版本:1.0',
      style: TextStyle(fontSize: 13.0, color: Color.fromRGBO(199, 199, 199, 1)),
    );
  }

  /* MARK: 回收键盘
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  void _keybordDown() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /* MARK: 跳到登录页，暂时为弹alert
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  void _pushToLogin() {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new TestSqfliteView(
                //title: '第二个页面',
                )));
    _showSomeDailog('跳到登录页');
  }

  /* MARK: 弹alert
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  void _showSomeDailog(String text) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('这是个弹窗'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[new Text('假装'), new Text(text)],
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text(
                  '确定',
                  style: new TextStyle(
                    fontSize: 14.5,
                    color: Color.fromRGBO(54, 90, 247, 1),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  /* MARK: 检查输入和赞同协议
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  void _cheking() {
    var cheking = false;
    if (_phoneTextEditingController.text.length <= 0) {
      cheking = false;
      _resetRegisterButton(cheking);
      return;
    }
    if (_codeTextEditingController.text.length <= 0) {
      cheking = false;
      _resetRegisterButton(cheking);
      return;
    }
    if (_passwordTextEditingController.text.length <= 0) {
      cheking = false;
      _resetRegisterButton(cheking);
      return;
    }
    if (isAgree == false) {
      cheking = false;
      _resetRegisterButton(cheking);
      return;
    }

    cheking = true;
    _resetRegisterButton(cheking);
  }

  /* MARK: 改变注册按钮样式
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  void _resetRegisterButton(bool cheking) {
    if (!mounted) return;
    setState(() {
      this.isEnable = cheking;
    });
  }
}
