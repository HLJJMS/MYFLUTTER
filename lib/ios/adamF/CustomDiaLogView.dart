import 'package:flutter/material.dart';

/* MARK:  自定义弹窗
 * @LastEditors: 张龙江
 * @Version: 版本号, 2018-12-02
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
class CustomOutView extends Dialog {
  bool isHiddenTitle; //是否隐藏 主标题 默认 不隐藏
  bool isYinYing; // 默认是 true（无阴影），  false  添加阴影
  bool isTextField; // 是否是对话弹窗   默认是true（不是） false

  String title; //主标题
  double titleFont; //主标题 文字大小
  int titleColor; //主标题 文字颜色

  String subTitle; //副标题
  double subTitleFont; //副标题 文字大小
  int subTitleColor; //副标题 文字颜色
  int subTitleMaxLines; //副标题 最大行数

  String cancelTitle; // 左边取消按钮
  double leftButtonFont; //左边按钮 字号
  FontWeight leftButtonstyle; //左边按钮 样式
  int leftTextColor; //左边按钮文字颜色

  String sureTitle; // 右边确定按钮
  double rightButtonFont; //右边按钮 字号
  FontWeight rightButtonstyle; //右边按钮 样式
  int rightTextColor; //右边按钮文字颜色

  Function onCloseEvent; // 右边小× 点击事件
  Function cancelButtonClick; // 取消 点击事件
  Function sureButtonClick; // 确定 点击事件

  String textStr; // 输入框文字

  bool isShowOneButton; //是否展示一个按钮  默认 true（展示两个按钮的类型） 反之亦然

  String singleButtonTitle; // 单个按钮
  double singleButtonFont; //单个按钮 字号
  FontWeight singleButtonstyle; //单个按钮 样式
  int singleTextColor; //单个按钮文字颜色
  Function singleButtonClick; // 单个按钮 点击事件

  CustomOutView({
    Key key,
    @required this.title,
    @required this.subTitle,
    @required this.isHiddenTitle = false,
    this.textStr = "",
    this.isTextField = true,
    this.subTitleMaxLines = 2,
    this.titleFont = 19.0,
    this.subTitleFont = 16.0,
    this.titleColor = 0xFF333333,
    this.subTitleColor = 0xFF333333,
    this.cancelTitle = "取消",
    this.leftButtonFont = 16,
    this.leftButtonstyle = FontWeight.normal,
    this.leftTextColor = 0xff9a9a9a,
    this.sureTitle = "确定",
    this.rightButtonFont = 16,
    this.rightButtonstyle = FontWeight.normal,
    this.rightTextColor = 0xff365AF7,
    this.isYinYing = true,
    this.cancelButtonClick,
    this.sureButtonClick,
    this.onCloseEvent,
    this.isShowOneButton = true,
    this.singleButtonTitle = "确定",
    this.singleButtonFont = 16,
    this.singleButtonstyle = FontWeight.normal,
    this.singleTextColor = 0xff365AF7,
    this.singleButtonClick,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(0), //fromLTRB(52, 15, 52, 15),
      child: Material(
//创建透明层
        type: MaterialType.transparency, //透明类型

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              ///  isYinYing ? 不带阴影 的 :   阴影效果
              decoration: isYinYing
                  ? ShapeDecoration(
                      color: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ))
                  : BoxDecoration(
                      border: new Border.all(
                          color: Colors.black, width: 0.5), // 边色与边宽度
                      color: Colors.white, // 底色
                      //        borderRadius: new BorderRadius.circular((20.0)), // 圆角度
                      borderRadius: new BorderRadius.vertical(
                          top: Radius.elliptical(8, 8)),
                      // 生成俩层阴影，一层绿，一层黄， 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x99FFFF00),
                            offset: Offset(5.0, 5.0),
                            blurRadius: 10.0,
                            spreadRadius: 2.0),
                        BoxShadow(
                            color: Color(0x9900FF00), offset: Offset(1.0, 1.0)),
                        BoxShadow(color: Color(0xFF0000FF))
                      ],

                      // 也可控件一边圆角大小
                    ),

              // height: 145,
              width: 275,
              child: IntrinsicHeight(
                child: Container(
                  child: new Column(
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                        child: new Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: <Widget>[
                            ///主标题
                            _titleUI(context, isHiddenTitle, title, titleFont,
                                titleColor),

                            // new Offstage(
                            //   offstage: false,
                            //   child: new GestureDetector(
                            //     onTap: this.onCloseEvent,
                            //     child: new Padding(
                            //       padding:
                            //           const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            //       child: new Icon(
                            //         Icons.close,
                            //         color: Color(0xffe0e0e0),
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                      ),

                      ///副标题
                      _subTitleUI(
                          context,
                          subTitle,
                          subTitleFont,
                          subTitleColor,
                          subTitleMaxLines,
                          isTextField,
                          textStr),

                      ///线
                      _lineUI(context),

                      /// 竖线， 两个按钮
                      ///

                      new Container(
                        height: 45,
                        child: isShowOneButton
                            ? Row(
                                children: <Widget>[
                                  new Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Container(
                                      width: 270,
                                      child: Stack(
                                        children: <Widget>[
                                          ///左边 按钮
                                          _cancelLeftButtonUI(
                                              context,
                                              cancelTitle,
                                              leftButtonFont,
                                              leftButtonstyle,
                                              leftTextColor),

                                          ///中间线
                                          _centerLineUI(context),

                                          ///右边按钮
                                          _sureRightButtonUI(
                                              context,
                                              sureTitle,
                                              sureButtonClick,
                                              rightButtonFont,
                                              rightButtonstyle,
                                              rightTextColor)
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : new GestureDetector(
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Colors.transparent,
                                  width: 135,
                                  child: Text(
                                    singleButtonTitle,
                                    style: TextStyle(
                                        fontSize: singleButtonFont,
                                        fontWeight: singleButtonstyle,
                                        color: Color(singleTextColor)),
                                  ),
                                ),
                                onTap: singleButtonClick,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///控件抽离
///主标题
Widget _titleUI(BuildContext context, bool isHiddenTitle, String title,
    double titleFont, int titleColor) {
  return Offstage(
    offstage: isHiddenTitle ? true : false,
    child: new Container(
      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: new Text(
        title,
        style: new TextStyle(
          fontSize: titleFont,
          color: Color(titleColor),
        ),
        maxLines: 1,
      ),
    ),
  );
}

///控件抽离
///������������������������������������������标题
Widget _subTitleUI(BuildContext context, String subTitle, double subTitleFont,
    int subTitleColor, int subTitleMaxLines, bool isTextField, String textStr) {
  return Container(
    // constraints: BoxConstraints(minHeight: 60.0),
    child: new Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 5),
      child: new IntrinsicHeight(
        child: isTextField
            ? new Text(
                subTitle,
                style: TextStyle(
                  fontSize: subTitleFont,
                  color: Color(subTitleColor),
                ),
                maxLines: subTitleMaxLines,
                textAlign: TextAlign.center,
              )
            : TextField(
                textAlign: TextAlign.left, //文本对齐方式
                keyboardType: TextInputType.text,
                autofocus: false, //是否自动对焦
                decoration: InputDecoration(
                    hintText: '请输入身份证号',
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(208, 208, 208, 1),
                      fontSize: 14,
                    ),
                    border: InputBorder.none),
                // controller: TextEditingController.fromValue(TextEditingValue(
                //     text: textStr,
                //     selection: TextSelection.fromPosition(TextPosition(
                //         affinity: TextAffinity.downstream,
                //         offset: textStr.length)))),
                // onChanged: (text) {
                //   // if (text.length > 16) {
                //   //   setState(() {
                //   //     pwdText = text.substring(0, 16);
                //   //   });
                //   // } else {
                //   //   pwdText = text;
                //   // }
                //   print(text);
                // },
              ),
      ),
    ),
  );
}

///控件抽离
///横线
Widget _lineUI(BuildContext context) {
  return new Container(
    color: Color(0xffe0e0e0),
    height: 0.5,
  );
}

///控件抽离
///左边按钮
Widget _cancelLeftButtonUI(BuildContext context, String cancelTitle,
    double leftButtonFont, FontWeight leftButtonstyle, int leftTextColor) {
  return new GestureDetector(
    child: Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      width: 135,
      child: Text(
        cancelTitle,
        style: TextStyle(
            fontSize: leftButtonFont,
            fontWeight: leftButtonstyle,
            color: Color(leftTextColor)),
      ),
    ),
    onTap: () {
      Navigator.of(context).pop();
    },
  );
}

///控件抽离
///中间线
Widget _centerLineUI(BuildContext context) {
  return new Align(
    alignment: Alignment.topCenter,
    child: new Container(
      alignment: Alignment.center,
      color: Color(0xffe0e0e0),
      width: 0.5,
      height: 50,
    ),
  );
}

///控件抽离
///右边按钮
Widget _sureRightButtonUI(
    BuildContext context,
    String sureTitle,
    Function sureButtonClick,
    double rightButtonFont,
    FontWeight rightButtonstyle,
    int rightTextColor) {
  return new Align(
    alignment: Alignment.topRight,
    child: new GestureDetector(
      child: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        width: 135,
        child: Text(
          sureTitle,
          style: TextStyle(
              fontSize: rightButtonFont,
              fontWeight: rightButtonstyle,
              color: Color(rightTextColor)),
        ),
      ),
      onTap: sureButtonClick,
    ),
  );
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/* MARK: loading 圈
 * @LastEditors: 张龙江
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
class CustomLoadingView extends Dialog {
  String text;

  Function cancelButtonClick;
  // CustomLoadingView({Key key, this.text = "加载中", this.cancelButtonClick})
  //     : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child: new Center(
        //保证控件居中效果
        child: new SizedBox(
          width: 120.0,
          height: 120.0,
          child: new Container(
            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new CircularProgressIndicator(),
                new Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: new Text(
                    text,
                    style: new TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/* MARK:  活动弹窗
 * @LastEditors: 张龙江
 * @Version: 版本号, 2018-12-02
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
class CustomActivityView extends Dialog {
  Function imageClick;
  Function sureButtonClick;

  CustomActivityView({Key key, @required this.imageClick}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.transparent,
      width: double.infinity,
      padding: EdgeInsets.all(0),
      child: new Material(
//创建透明层
        type: MaterialType.transparency, //透明类型
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              ///圆角
              decoration: ShapeDecoration(
                  color: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  )),
              height: 300,
              width: 300,
              child: Stack(
                children: <Widget>[
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: GestureDetector(
                        child: Image.asset("assets/image/shenfezhengfan.png",
                            fit: BoxFit.fill),
                        onTap: imageClick,
                      ),
                    ),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: GestureDetector(
                        child: Container(
                          ///圆角
                          decoration: ShapeDecoration(
                              color: Color(0xff365AF7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              )),
                          width: 150,
                          height: 45,

                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "确定",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
