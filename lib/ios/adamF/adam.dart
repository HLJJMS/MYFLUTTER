import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/ios/adamF/CustomDownListView.dart';
import 'package:flutter_app/ios/adamF/SettingPasswordPopView.dart';
import 'package:flutter_app/ios/adamF/UpDatePopView.dart';
import 'package:flutter_app/tool/time_helper.dart';
import 'package:flutter_app/util/routerUtil.dart';
import 'package:flutter_app/ios/adamF/CustomDiaLogView.dart';
import 'package:flutter_app/util/toastUtil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_app/ios/adamF/CustomLoadingView.dart';
import 'package:flutter_app/ios/adamF/CustomDownListView.dart';
import 'package:flutter/foundation.dart';

// import 'package:flutter_location_picker/flutter_location_picker.dart';
// import 'dart:async';

class AdamPage extends StatefulWidget {
  // const AdamPage(first, {Key key, this.name}) : super(key: key);
  final String name;
  AdamPage(this.name);

  @override
  State<StatefulWidget> createState() {
    return _AdamState(name);
  }
}

class _AdamState extends State<AdamPage> {
  final String name;
  _AdamState(this.name);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("$name"),
      ),
      body: TextAdamPage(),
    );
  }
}

class TextAdamPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextAdamPage();
  }
}

class _TextAdamPage extends State<TextAdamPage> {
  String _address = '';
  String pwdText = "";

  var fanHuiShangYiYe;

  // BuildContext get context => null;
  /* MARK: 1231321313
   * @LastEditors: 张龙江
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  @override
  Widget build(BuildContext context) {
    fanHuiShangYiYe = context;
    return GestureDetector(
      onTap: () {
        hiddenKeyboard();
      },
      child: SingleChildScrollView(
        // controller: controller,
        //滑动的方向 Axis.vertical为垂直方向滑动，Axis.horizontal 为水平方向
        scrollDirection: Axis.vertical,
        //true 滑动到底部
        reverse: false,
        padding: EdgeInsets.all(0),
////滑动到底部回弹效果
        physics: BouncingScrollPhysics(),

        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                height: 30,
                width: double.infinity,
                color: Color.fromRGBO(255, 114, 19, 0.05),
                padding: EdgeInsets.fromLTRB(17, 6, 0, 0),
                child: Text(
                  '身份证信息保存后将无法修改，请务必保证正确',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(255, 114, 19, 1)),
                ),
              ),
              Container(
                height: 54,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                        child: Text(
                          "身份证照(左边点击效果： 弹出view， 右边点击效果:底部弹出alert)",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(51, 51, 51, 1)),
                        ),
                      ),
                    ),

                    ///MAKR: 身份證正面
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                        height: 26,
                        width: 42,
                        child: GestureDetector(
                          child:
                              Image.asset('assets/image/shenFenZhengZheng.png'),
                          onTap: () {
                            shenFenZhengZheng(context);
                          },
                        ),
                      ),
                    ),

                    ///MAKR: 身份證反面
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                        child: GestureDetector(
                          child: Image.asset('assets/image/shenfezhengfan.png',
                              width: 42, height: 26),
                          onTap: () {
                            shenFenZhengFan(context);
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Container(
                        child: Image.asset('assets/image/Smallarrow.png',
                            width: 10, height: 7),
                      ),
                    ),
                  ],
                ),
              ),

              ///MAKR: 底边线
              Padding(
                padding: EdgeInsets.only(right: 17, left: 17, top: 0),
                child: Container(
                  height: 1,
                  color: Color.fromRGBO(234, 234, 234, 1),
                ),
              ),

              renLianView(context),
              nameView(),
              idCardView(),
              xueLiiew(context),
              xianJuDiZhiView(context),
              detailAddressView(),
              juZhuTimeView(context),
              hunYinStatusView(context),
              saveButton(context),
              bottomTitleButton(),
            ],
          ),
        ),
      ),
    );
  }

  /* MARK: 人脸识别
   * @LastEditors: 张龙江
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */

  Widget renLianView(BuildContext context) {
    return Container(
      // controller: controller,
      padding: EdgeInsets.only(top: 0),
      width: double.infinity,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 54,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                      child: Text(
                        "人脸识别(点击效果， 列表弹出view)",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(51, 51, 51, 1)),
                      ),
                    ),
                  ),

                  ///MAKR: 身份證人脸识别
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Container(
                      child: GestureDetector(
                        child: Image.asset('assets/image/renlian.png',
                            width: 42, height: 26),
                        onTap: () {
                          shenFenZhengRenLian(context);
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Container(
                      child: Image.asset('assets/image/Smallarrow.png',
                          width: 10, height: 7),
                    ),
                  ),
                ],
              ),
            ),

            ///MAKR: 底边线
            Padding(
              padding: EdgeInsets.only(right: 17, left: 17, top: 0),
              child: Container(
                height: 1,
                color: Color.fromRGBO(234, 234, 234, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /* MARK: 姓名
   * @LastEditors: 张龙江
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget nameView() {
    return Container(
      // controller: controller,
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 54,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Expanded(
                  Container(
                    padding: EdgeInsets.fromLTRB(17, 0, 15, 0),
                    child: Text(
                      "姓名",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    ),
                  ),
                  // ),

                  ///MAKR: 身份證人脸识别
                  ///
                  ///
                  Expanded(
                    // child: Container(
                    // height: 54,
                    // width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(right: 32),
                      child: TextField(
                        // behavior: HitTestBehavior.translucent,
                        // onTap: () {
                        //   // 触摸收起键盘
                        //   FocusScope.of(context).requestFocus(FocusNode());
                        // },

                        textAlign: TextAlign.right, //文本对齐方式
                        keyboardType: TextInputType.text,
                        autofocus: false, //是否自动对焦
                        decoration: InputDecoration(
                            hintText: '请输入姓名',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(208, 208, 208, 1),
                              fontSize: 14,
                            ),
                            border: InputBorder.none),
                        controller: TextEditingController.fromValue(
                            TextEditingValue(
                                text: pwdText,
                                selection: TextSelection.fromPosition(
                                    TextPosition(
                                        affinity: TextAffinity.downstream,
                                        offset: pwdText.length)))),
                        onChanged: (text) {
                          // if (text.length > 16) {
                          //   setState(() {
                          //     pwdText = text.substring(0, 16);
                          //   });
                          // } else {
                          //   pwdText = text;
                          // }
                          print(text);
                        },
                      ),
                    ),
                    //child:
                    // ),
                  )
                ],
              ),
            ),

            ///MAKR: 底边线
            Padding(
              padding: EdgeInsets.only(right: 17, left: 17, top: 0),
              child: Container(
                height: 1,
                color: Color.fromRGBO(234, 234, 234, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

/* MARK: 身份证号
 * @LastEditors: 张龙江
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
  Widget idCardView() {
    return Container(
      // controller: controller,
      padding: EdgeInsets.only(top: 0),
      width: double.infinity,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 54,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Expanded(
                  Container(
                    padding: EdgeInsets.fromLTRB(17, 0, 15, 0),
                    child: Text(
                      "身份证",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    ),
                  ),
                  // ),

                  ///MAKR: 身份證人脸识别
                  ///
                  ///
                  Expanded(
                    // child: Container(
                    // height: 54,
                    // width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(right: 32),
                      child: TextField(
                        textAlign: TextAlign.right, //文本对齐方式
                        keyboardType: TextInputType.text,
                        autofocus: false, //是否自动对焦
                        decoration: InputDecoration(
                            hintText: '请输入身份证号',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(208, 208, 208, 1),
                              fontSize: 14,
                            ),
                            border: InputBorder.none),
                        controller: TextEditingController.fromValue(
                            TextEditingValue(
                                text: pwdText,
                                selection: TextSelection.fromPosition(
                                    TextPosition(
                                        affinity: TextAffinity.downstream,
                                        offset: pwdText.length)))),
                        onChanged: (text) {
                          // if (text.length > 16) {
                          //   setState(() {
                          //     pwdText = text.substring(0, 16);
                          //   });
                          // } else {
                          //   pwdText = text;
                          // }
                          print(text);
                        },
                      ),
                    ),
                    //child:
                    // ),
                  )
                ],
              ),
            ),

            ///MAKR: 底边线
            Padding(
              padding: EdgeInsets.only(right: 17, left: 17, top: 0),
              child: Container(
                height: 1,
                color: Color.fromRGBO(234, 234, 234, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /* MARK: 学历
   * @LastEditors: 张龙江
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget xueLiiew(BuildContext context) {
    return Container(
      // controller: controller,
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 54,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Expanded(
                  // Expanded(
                  Container(
                    padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                    width: 100,
                    child: Text(
                      "学历",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    ),
                  ),
                  // ),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(17, 0, 10, 0),
                      child: GestureDetector(
                        // padding: EdgeInsets.fromLTRB(17, 0, 10, 0),
                        child: Text(
                          "请选择",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(208, 208, 208, 1)),
                          textAlign: TextAlign.right,
                        ),
                        onTap: () {
                          _xueLickick(context);
                        },
                      ),
                    ),
                  ),

                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Container(
                        child: Image.asset('assets/image/Smallarrow.png',
                            width: 10, height: 7),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///MAKR: 底边线
            Padding(
              padding: EdgeInsets.only(right: 17, left: 17, top: 0),
              child: Container(
                height: 1,
                color: Color.fromRGBO(234, 234, 234, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /* MARK: 现居地址
   * @LastEditors: 张龙江
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget xianJuDiZhiView(BuildContext context) {
    return Container(
      // controller: controller,
      padding: EdgeInsets.only(top: 0),
      width: double.infinity,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 54,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Expanded(
                  // Expanded(
                  Container(
                    padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                    width: 100,
                    child: Text(
                      "现居地址",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    ),
                  ),
                  // ),

                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(17, 0, 10, 0),
                        child: _address == ""
                            ? Text(
                                "请选择",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromRGBO(208, 208, 208, 1)),
                                textAlign: TextAlign.right,
                              )
                            : Text(
                                _address,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Color.fromRGBO(51, 51, 51, 1)),
                                textAlign: TextAlign.right,
                              ),
                      ),
                      onTap: () {
                        _xianJuAddressClick(context);
                      },
                    ),
                  ),

                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Container(
                        child: Image.asset('assets/image/Smallarrow.png',
                            width: 10, height: 7),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///MAKR: 底边线
            Padding(
              padding: EdgeInsets.only(right: 17, left: 17, top: 0),
              child: Container(
                height: 1,
                color: Color.fromRGBO(234, 234, 234, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

/* MARK: 详细地址
 * @LastEditors: 张龙江
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
  Widget detailAddressView() {
    return Container(
      // controller: controller,
      padding: EdgeInsets.only(top: 0),
      width: double.infinity,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 54,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Expanded(
                  Container(
                    padding: EdgeInsets.fromLTRB(17, 0, 15, 0),
                    child: Text(
                      "详细地址",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    ),
                  ),
                  // ),

                  ///MAKR: 身份證人脸识别
                  ///
                  ///
                  Expanded(
                    // child: Container(
                    // height: 54,
                    // width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(right: 32),
                      child: TextField(
                        textAlign: TextAlign.right, //文本对齐方式
                        keyboardType: TextInputType.text,
                        autofocus: false, //是否自动对焦
                        decoration: InputDecoration(
                            hintText: '请填写详细街道和门牌号',
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(208, 208, 208, 1),
                              fontSize: 14,
                            ),
                            border: InputBorder.none),
                        controller: TextEditingController.fromValue(
                            TextEditingValue(
                                text: pwdText,
                                selection: TextSelection.fromPosition(
                                    TextPosition(
                                        affinity: TextAffinity.downstream,
                                        offset: pwdText.length)))),
                        onChanged: (text) {
                          // if (text.length > 16) {
                          //   setState(() {
                          //     pwdText = text.substring(0, 16);
                          //   });
                          // } else {
                          //   pwdText = text;
                          // }
                          print(text);
                        },
                      ),
                    ),
                    //child:
                    // ),
                  )
                ],
              ),
            ),

            ///MAKR: 底边线
            Padding(
              padding: EdgeInsets.only(right: 17, left: 17, top: 0),
              child: Container(
                height: 1,
                color: Color.fromRGBO(234, 234, 234, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

/* MARK: 居住时长
 * @LastEditors: 张龙江
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
  Widget juZhuTimeView(BuildContext context) {
    return Container(
      // controller: controller,
      padding: EdgeInsets.only(top: 0),
      width: double.infinity,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 54,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Expanded(
                  // Expanded(
                  Container(
                    padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                    width: 150,
                    // color: Colors.green,
                    child: Text(
                      "居住时长（选填）",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    ),
                  ),
                  // ),

                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(17, 0, 10, 0),
                        child: Text(
                          "请选择",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(208, 208, 208, 1)),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      onTap: () {
                        _juZhuTime(context);
                      },
                    ),
                  ),

                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Container(
                        child: Image.asset('assets/image/Smallarrow.png',
                            width: 10, height: 7),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///MAKR: 底边线
            Padding(
              padding: EdgeInsets.only(right: 17, left: 17, top: 0),
              child: Container(
                height: 1,
                color: Color.fromRGBO(234, 234, 234, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

/* MARK: 婚姻状况（选填）
 * @LastEditors: 张龙江
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
  Widget hunYinStatusView(BuildContext context) {
    return Container(
      // controller: controller,
      padding: EdgeInsets.only(top: 0),
      width: double.infinity,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 54,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  // Expanded(
                  // Expanded(
                  Container(
                    padding: EdgeInsets.fromLTRB(17, 0, 0, 0),
                    width: 150,
                    // color: Colors.green,
                    child: Text(
                      "婚姻状况（选填）",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    ),
                  ),
                  // ),

                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(17, 0, 10, 0),
                        child: Text(
                          "请选择",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color.fromRGBO(208, 208, 208, 1)),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      onTap: () {
                        _hunYinStatus(context);
                      },
                    ),
                  ),

                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Container(
                        child: Image.asset('assets/image/Smallarrow.png',
                            width: 10, height: 7),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ///MAKR: 底边线
            Padding(
              padding: EdgeInsets.only(right: 17, left: 17, top: 0),
              child: Container(
                height: 1,
                color: Color.fromRGBO(234, 234, 234, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

/* MARK:   保存按钮
 * @LastEditors: 张龙江
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
  Widget saveButton(BuildContext context) {
    return Container(
      height: 45,
      // padding: EdgeInsets.only(top: 30, left: 20, right: 20),
      margin: EdgeInsets.only(left: 20, right: 20, top: 15),
      width: double.infinity,
      child: FlatButton(
        //child按钮中的内容
        color: Color.fromRGBO(182, 195, 255, 1),
        textColor: Colors.white,
        //文字颜色
        disabledTextColor: Colors.white,

        ///圆角
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(22.5)),
        ),

        child: Container(
          alignment: Alignment.center,
          child: Text(
            "保存",
            style: TextStyle(fontSize: 16),
          ),
        ),

        onPressed: () {
          // Navigator.pop(context);
          _showLoadingView(context);
        },
      ),
    );
  }

  Widget bottomTitleButton() {
    return Container(
      height: 17,
      // padding: EdgeInsets.only(top: 16, left: 0, right: 0, bottom: 39),
      margin: EdgeInsets.only(top: 16, left: 0, right: 0, bottom: 39),
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 125),
            color: Colors.green,
            height: 15,
            width: 12,
            child: Container(
              child:
                  Image.asset('assets/image/xiaoDun.png', width: 10, height: 7),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text(
              "银行级数据加密服务",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Color.fromRGBO(173, 173, 173, 1)),
            ),
          ),
        ],
      ),
    );
  }

  Widget ceshiView() {
    return Container(
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 20 / 9,
            child: Image.asset(
              'assets/image/xiaoDun.png',
              width: 10,
              height: 7,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }

  /* MARK: 自定义弹出view
     * @LastEditors: 张龙江
     * @Version: 版本号, YYYY-MM-DD
     * @param {type} 
     * @return: 
     * @Deprecated: 否
     */

  ///MAKR: 点击事件
  void shenFenZhengFan(BuildContext context) {
    print("====身份證反面======");
    _showAlert(context);
  }

  void shenFenZhengZheng(BuildContext context) {
    print("======身份證正面====");
    _showDialog(context);
  }

  //   ///MAKR: 点击事件
  void shenFenZhengRenLian(BuildContext context) {
    print("====身份證人脸======");
    _listSimpleDialog(context);
  }

  /// 现居地址
  void _xianJuAddressClick(BuildContext context) {
    _downListView(context);
  }

  ///居住时长
  void _juZhuTime(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WithdrawalPasswordSettingDialog();
        });
  }

  ///婚姻状态
  void _hunYinStatus(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return UpdateDialog();
        });
  }

  ///MAKR: /关闭键盘
  void hiddenKeyboard() {
    FocusScope.of(fanHuiShangYiYe).requestFocus(FocusNode());
  }

  /* MARK:  alert弹窗
     * @LastEditors: 张龙江
     * @Version: 版本号, YYYY-MM-DD
     * @param {type} 
     * @return: 
     * @Deprecated: 否
     */
  void _showAlert(BuildContext cxt) {
    showCupertinoModalPopup<int>(
        context: cxt,
        builder: (cxt) {
          return CupertinoActionSheet(
            // title: Text("标题"),
            // message: Text("副标题"),
            cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(cxt, 0);
                },
                child: Text("取消")),
            actions: <Widget>[
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(cxt, 1);
                  },
                  child: Text("��认证")),
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(cxt, 2);
                  },
                  child: Text("查看大图")),
            ],
          );
        });
  }

/* MARK: dialog 弹窗
 * @LastEditors: 张龙江
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
  void _showDialog(BuildContext cxt) {
    showDialog(
        context: cxt,
        builder: (cxt) {
          return AlertDialog(
            //CupertinoAlertDialog
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(22.5)),
            ),
            title: Text("标题"),
            content: Text("副标题"),
            actions: <Widget>[
              FlatButton(
                child: Text("取消"),
                onPressed: () {
                  Navigator.pop(cxt, "取消");
                },
              ),
              FlatButton(
                child: Text("确定"),
                onPressed: () {
                  Navigator.pop(cxt, "确定");
                },
              ),
            ],
          );
        }).then<String>((returlval) {
      if (returlval != null) {
        Scaffold.of(cxt).showSnackBar(SnackBar(
          content: Text("大欠儿登点击了： $returlval"),
          action: SnackBarAction(
            label: "OK",
            onPressed: () {},
          ),
        ));
      }
    });
  }

/* MARK:  列表 弹窗
 * @LastEditors: 张龙江
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
  void _listSimpleDialog(BuildContext cxt) {
    List listData = [
      {"title": "第一行"},
      {"title": "第二行"},
      {"title": "第三行"},
    ];

    showDialog(
        context: cxt,
        builder: (cxt) {
          return Container(
            child: SimpleDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(22.5)),
              ),
              title: Text("标题"),
              children: listData.map((value) {
                return ListTile(
                  leading: Icon(Icons.movie),
                  title: Text(value["title"]),
                  onTap: () {
                    Navigator.pop(cxt, value["title"]);
                  },
                );
              }).toList(),
            ),
          );
        }).then<String>((returlval) {
      if (returlval != null) {
        Scaffold.of(cxt).showSnackBar(SnackBar(
          content: Text("大欠儿登点击了： $returlval"),
          action: SnackBarAction(
            label: "OK",
            onPressed: () {},
          ),
        ));
      }
    });
  }

/* MARK:  另一种弹窗
 * @LastEditors: 张龙江
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
  void _xueLickick(BuildContext context) {
    // showCupertinoModalPopup<int>(
    //     context: context,
    //     builder: (context) {
    //       return CupertinoAlertDialog(
    //         title: Text('我是标题'),
    //         content: Text('我是content'),
    //         actions: <Widget>[
    //           CupertinoDialogAction(
    //             child: Text('确定'),
    //             onPressed: () {
    //               print('yes...');
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //           CupertinoDialogAction(
    //             child: Text('取消'),
    //             onPressed: () {
    //               print('no...');
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       );
    //     });
    RouterUtil.navigateTo(context, "zlj/adamNextPage/:id${"下一页"}");
  }

  void _showLoadingView(BuildContext cxt) {
    showCupertinoModalPopup<int>(
        context: cxt,
        builder: (cxt) {
          //自定义 类    loading 框
          // return CustomLoadingView();

//===============================================================================
          //自定义弹窗

          return CustomOutView(
            title: "温馨提示",
            subTitle: "为了保障您的账户安全\n 请设置支付密码",
            sureTitle: "立即设置",
            sureButtonClick: () {
              Navigator.of(cxt).pop();
            },
            singleButtonClick: () {
              Navigator.of(cxt).pop();
            },
            isHiddenTitle: false,
            isTextField: true,
            // isYinYing: false,
            // isShowOneButton: false,
          );
//===============================================================================
          /// 活动弹窗
          // return CustomActivityView(
          //   imageClick: () {
          //     Navigator.of(cxt).pop();
          //   },
          // );
        });

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    ///loading 圈  协助 三方库使用
    /* MARK: RotatingPlain, 
    DoubleBounce,
    Wave, 
    WanderingCubes,
    FadingFour, 
    FadingCube, 
    Pulse, 
    ChasingDots,
    ThreeBounce, 
    Circle,
    CubeGrid,
    FadingCircle,
    RotatingCircle,
    FoldingCube,
    PumpingHeart,
    DualRing,	 
    HourGlass,	 
    PouringHourGlass,
    FadingGrid,	 
    Ring,	 
    Ripple,	 
    SpinningCircle	, 
    SquareCircle,
     * @LastEditors: 张龙江
     * @Version: ��本号, YYYY-MM-DD
     * @param {type} 
     * @return: 
     * @Deprecated: 否
     */
//===============================================================================
    // ProgressDialog.showProgress(cxt, child: SpinKitFadingCircle(
    //   itemBuilder: (_, int index) {
    //     return DecoratedBox(
    //       decoration: BoxDecoration(
    //         color: index.isEven ? Colors.red : Colors.green,
    //       ),
    //     );
    //   },
    // ));
//===============================================================================
    // ProgressDialog.showProgress(cxt,
    //     child: SpinKitSquareCircle(
    //       color: Colors.red,
    //       size: 50.0,
    //     ));
//===============================================================================
    // ProgressDialog.showProgress(cxt,
    //     child: SpinKitPouringHourglass(
    //       color: Colors.green,
    //       size: 50.0,
    //     ));
//===============================================================================
    // ProgressDialog.showProgress(cxt,
    //     child: SpinKitDualRing(
    //       color: Colors.green,
    //       size: 50.0,
    //     ));
//===============================================================================
    // ProgressDialog.showProgress(cxt,
    //     child: SpinKitRing(
    //       color: Colors.green,
    //       size: 50.0,
    //     ));

//===============================================================================
    // ProgressDialog.showProgress(cxt);

    // var timer = startCountdown(5, (obj, time) {
    //   (time == 0 ? ProgressDialog.dismiss(cxt) : print("=========$time"));
    // });
  }

  /* MARK: 省市区选择
   * @LastEditors: 张龙江
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  void _downListView(BuildContext context) {
    String _province = '';

    String _city = '';

    String _area = '';
    CityPicker.showCityPicker(
      context,
      selectProvince: (province, city, area) {
        _province = province['name'];
        _city = city['name'];
        _area = area['name'];

        setState(() {
          _address = _province + "  " + _city + "  " + _area;
        });
      },
    );
  }
}
