import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/android/zlc/color.dart';
import 'package:convert/convert.dart';
import 'package:flutter_app/android/zlc/constant/api.dart';
import 'package:flutter_app/ios/dyq/ding_reg_page.dart';
import 'package:flutter_app/util/httpUtil.dart';
class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginWidget();
  }

}

class LoginWidget extends State<StatefulWidget> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _currentCountString = "获取验证码";
  int _currentCount = 60;
  String loginType = "密码登录";
  String pswTop = "验证码";
  Timer _timer;
  var phoneTopVisible = false;
  var passWprdVisible = false;
  var icPhoneClear = true;
  var icPasswordClear = true;
  var phoneEyeOpen =false;
  var passwordEyeOpen =true;
  var verfiyCode=false;
  var passwordEyeAndClear=true;
  var verfiyHint="请输入验证码";
  var verfiyLimit=[WhitelistingTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(6)];
  var passwordLimit=[ WhitelistingTextInputFormatter(RegExp("[a-z,A-Z,0-9]")),LengthLimitingTextInputFormatter(16)];
   FocusNode phoneFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();
  @override
  void initState() {
    //监听验证码输入则隐藏等上方标题
    phoneFocusNode.addListener((){
      if(!phoneFocusNode.hasFocus||_phoneController.text.length==0){
          icPhoneClear=true;
      }else{
         icPhoneClear=false;
      }
      setState(() {
      });
      });
    passwordFocusNode.addListener((){
      if(!passwordEyeAndClear){
        if(!passwordFocusNode.hasFocus||_passwordController.text.length==0){
          icPasswordClear=true;
        }else{
          icPasswordClear=false;
        }
      }
     setState(() {
     });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext mContext) {
    final size =MediaQuery.of(context).size;
    //状态栏高度
    final statusH = MediaQueryData.fromWindow(window).padding.top;
    print("屏幕高度${size.height} 状态栏高度${
    statusH
    }");
    return Theme(
      data: ThemeData(
       splashColor: Colors.transparent
      ),
        child: Scaffold(
          //上方的bar
          appBar:getAppBar(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(

            child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: size.height-statusH-56,
            child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Column(
                    children: <Widget>[
                    //标题
                    getTitle(),
                    //手机号按钮
                    getPhoneTop(),
                    //获取手机号
                    getPhoneRow(),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 1,
                      color: MyColor.color_EAEAEA,
                    ),
                    //验证码
                    getPassWordTop(),
                    getRow(),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 1,
                      color: MyColor.color_EAEAEA,
                    ),
                    //密码登录类型
                    getRowPassWordType(),
                    getLoginButton(),
                    //联系客服文字
                    Padding(padding: EdgeInsets.only(top: 22),),
                    getTel(),
                  ],),
                //版本号
                getVersion(),
              ],
            ),
          ),
          ),
        )
    );
  }

  AppBar getAppBar(){
    return  AppBar(
      leading: IconButton(
        icon: Image.asset('assets/image/arrow_back.png'),
        onPressed: onPageBack,)
      ,
      actions: <Widget>[IconButton(onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DingRegPage()));
      },
        icon: Text(
          '注册',
          style: TextStyle(color: MyColor.color_365AF7, fontSize: 15),),
        padding: EdgeInsets.only(right: 15),)
      ],
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }
  onPageBack() {
    Navigator.pop(this.context);
  }

  void onLogin()  {
    if (_phoneController.text == "") {
      return null;
    }
    if (_passwordController.text == "") {
      return null;
    }
    var phone=_phoneController.text.toString().trim();
    var password=_passwordController.text.toString().trim();

    var map={"mobile" :phone,
            "password":password,"":"","":"","":"",
    };
    FormData data=FormData.fromMap(map);
    var  resopne=  HttpUtil.of(context).post(Api.PASSWORD_LOGIN,params: map);
    print(resopne.toString());
  }
  //标题
  Widget getTitle() {
    return   Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 20),
      child: Text('欢迎登录小银号',
        style: TextStyle(fontSize: 25,
            fontWeight: FontWeight.bold,
            color: MyColor.color_333333),
      ),);
  }
  //上边电话
  Widget getPhoneTop(){
    return      Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 47),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: phoneTopVisible ? 1.0 : 0.0,
        child: Text("手机号码", style: TextStyle(
            color: MyColor.color_ADADAD, fontSize: 12),),),);
  }
  //密码上边的
  Widget getPassWordTop(){
    return   Container(
      margin: EdgeInsets.only(top: 15),
      alignment: Alignment.centerLeft,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: passWprdVisible ? 1.0 : 0.0,
        child: Text(pswTop, style: TextStyle(
            color: MyColor.color_ADADAD, fontSize: 12),),),);
  }
//输入电话号码组件
  Widget getPhoneRow() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 2),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: TextField(
              focusNode: phoneFocusNode,
              style: TextStyle(color: MyColor.color_333333, fontSize: 17),
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(11)] ,
              maxLengthEnforced: true,
              onChanged: (text) {
                setState(() {
                  if(text.length>11){
                    _phoneController.text= text.substring(0,11);
                  }
                  if (text.length > 0) {
                    phoneTopVisible = true;
                    icPhoneClear = false;
                  } else {
                    icPhoneClear = true;
                    phoneTopVisible = false;
                  }
                });
              },
              decoration: InputDecoration(
                  hintText: "请输入注册手机号",
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontSize: 17, color: MyColor.color_D0D0D0)
              ),
              controller: _phoneController,
              keyboardType: TextInputType.number,),
          ),
          Offstage(offstage: icPhoneClear, child: IconButton(
            icon: Image.asset(
              "assets/image/ic_clear.png", width: 15, height: 15,),
            onPressed: () {
              _phoneController.clear();
              setState(() {
                  phoneTopVisible = false;
                   icPhoneClear = true;
              });
            },),)
        ],

      ),
    );
  }

  var paswordLogin = "";

//获取输入密码和验证码
  Widget getRow() {
    return Container(
      padding: EdgeInsets.only(top: 2,),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: TextField(
                focusNode: passwordFocusNode,
                onChanged: (text) {
                  setState(() {
                  if (text.length > 0) {
                      passWprdVisible = true;
                  } else {
                      passWprdVisible = false;
                  }
                  if(!passwordEyeAndClear){
                    if (text.length > 0) {
                      icPasswordClear = false;
                    }else{
                      icPasswordClear = true;
                    }
                  }
                  });
                },
                controller: _passwordController,
                style: TextStyle(color: MyColor.color_333333, fontSize: 17),
                inputFormatters: passwordEyeAndClear? verfiyLimit: passwordLimit ,
                keyboardType:passwordEyeAndClear? TextInputType.number :TextInputType.visiblePassword ,
                obscureText: phoneEyeOpen,
                decoration: InputDecoration(
                  hintText: verfiyHint,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      fontSize: 17, color: MyColor.color_D0D0D0),
                )),
          ),
          //获取验证码
          Container(alignment: Alignment.centerRight,
            child: Offstage(
              offstage: verfiyCode,
              child: MaterialButton(
                padding: EdgeInsets.all(0),
                minWidth: 0,
                highlightColor: Colors.white,
                child: Text(_currentCountString,
                  style: TextStyle(color: MyColor.color_ADADAD, fontSize: 15),),
                onPressed: startCounts,),
            ),),
          //清除图标
          Container(
              alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: passwordEyeAndClear?0:17),
            child:Offstage(
              offstage:icPasswordClear ,
              child:
              GestureDetector(

                child: Image.asset(
              "assets/image/ic_clear.png", width: 15, height: 15,),
              onTap: (){
              setState(() {
                icPasswordClear = true;
                 passWprdVisible = false;
              });
                _passwordController.clear();
              },),)
          ),
          //眼睛图片
          Container(
            alignment: Alignment.centerRight,
            child: Offstage(
              offstage: passwordEyeAndClear,child: GestureDetector(
              child: phoneEyeOpen ? Image.asset(
                'assets/image/loginYanjing.png', width: 15, height: 15,) :Image
              .asset('assets/image/loginYanjingico.png', width: 15, height: 15,) ,
              onTap: (){
                setState(() {
                  if(phoneEyeOpen){
                    phoneEyeOpen=false;
                  }else{
                    phoneEyeOpen=true;
                  }
                });
              },
            ),),
          ),
        ],
      ),

    );
  }

//输入密码方式
  Widget getRowPassWordType() {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: MaterialButton(
                highlightColor: Colors.white,
                minWidth: 0,
                padding: EdgeInsets.only(top: 5, bottom: 5, left: 0, right: 0),
                child: Text(loginType,
                  style: TextStyle(color: MyColor.color_666666, fontSize: 14),),
                onPressed: onClickPass),
          ),
          Container(alignment: Alignment.centerRight,
            child: MaterialButton(
              minWidth: 0,
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 0, right: 0),
              child: Text("忘记密码",
                style: TextStyle(color: MyColor.color_666666, fontSize: 15),),
              onPressed: () {},),)
        ],
      ),

    );
  }
  Widget getLoginButton(){
    return Container(
      padding: EdgeInsets.only(left: 20, top: 68, right: 20),
      alignment: Alignment.center,
      child: MaterialButton(
        child: Text(
          "登录",
          style: TextStyle(color: Colors.white, fontSize: 16),),
        color: MyColor.color_365AF7,
        onPressed: onLogin,
        height: 45,
        minWidth: 335,
        disabledColor: MyColor.color_B6C3FF,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(23))),
      ),
    );
  }
  //下方密码点击时文字切换方法
  onClickPass() {
    _passwordController.clear();
    //验证码输入时
    setState(() {
    if (loginType == "密码登录") {
        verfiyCode=true;
        verfiyHint="请输入密码";
        passwordEyeAndClear=false;
        loginType = "验证码登录";
        pswTop="登录密码";
        phoneEyeOpen=true;
    } else {
        verfiyCode=false;
        passwordEyeAndClear=true;
        verfiyHint="请输入验证码";
        loginType = "密码登录";
        pswTop="验证码";
        phoneEyeOpen=false;
    }
    if(!passwordEyeAndClear&&_passwordController.text.length>0){
      icPasswordClear=false;
    }else{
      icPasswordClear=true;
    }
    });
  }
  //开始定时器
  startCounts() {
    if (_timer != null) {
      return;
    }
    _timer = Timer.periodic(Duration(seconds: 1), (time) {
      if (mounted) {
        setState(() {
          if (_currentCount > 0) {
            _currentCount--;
            _currentCountString = "重新发送(${_currentCount})";
          } else {
            _currentCountString = "获取验证码";
            _currentCount = 60;
            _timer.cancel();
            _timer == null;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    if(_timer!=null) {
      _timer.cancel();
      _timer == null;
    }
    phoneFocusNode=null;
    passwordFocusNode=null;
    super.dispose();
  }

 Widget getTel() {
    return    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("登录遇到问题？点击",style: TextStyle(color: MyColor.color_9A9A9A,fontSize: 13.5),),
        Text("联系客服",style: TextStyle(color: MyColor.color_365AF7,fontSize: 13.5),)
      ],);
 }

  getVersion() {
   return Container(
     alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 30),
      child: Text("当前版本:1.0",style: TextStyle(color: MyColor.color_C7C7C7,fontSize: 13),),);
  }
}