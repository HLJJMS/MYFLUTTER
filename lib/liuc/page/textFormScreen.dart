import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/component/borderButton.dart';
import 'package:flutter_app/liuc/component/iosButton.dart';
import 'package:flutter_app/liuc/component/pwdInputWidget.dart';
import 'package:flutter_app/liuc/component/userNameInputWidget.dart';
import 'package:flutter_app/util/mediaUtil.dart';


class TextFormScreen extends StatefulWidget {
  TextFormScreen({Key key}) : super(key: key);

  @override
  _TextFormScreenState createState() => _TextFormScreenState();
}

class _TextFormScreenState extends State<TextFormScreen> {
  // 用户名输入框TextEditingController
  TextEditingController _userNameEditCtrl = TextEditingController();
  // 密码输入框TextEditingController
  TextEditingController _pwdEditCtrl = TextEditingController();

  // 用户名输入框焦点Node
  final FocusNode _userNameFocusNode = FocusNode();
  // 密码输入框的焦点Node
  final FocusNode _pwdFocusNode = FocusNode();
  // 登录表单的全局Key
  GlobalKey _from3Key = GlobalKey<FormState>();
  // 标题文字
  var _title = "百卓采购网/中国制造网会员登录";
  // 登录按钮状态
  var _loginBtnActivation = false;
  // 登录按钮的点击事件
  var _loginBtnListener = null;

  @override
  void initState() {
    super.initState();
    _userNameEditCtrl.addListener(() => {setState(() => {})});
    _pwdEditCtrl.addListener(() => {setState(() => {})});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _userNameEditCtrl.dispose();
    _pwdEditCtrl.dispose();
    _userNameFocusNode.dispose();
    _pwdFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("textFormScreen build.......");
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('表单组件应用'),
          ),
          body: getForm3(context)),
    );
  }

  /* MARK: 创建顶部图片区域
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Image.asset(
        "assets/image/banner.png",
        fit: BoxFit.cover,
      ),
    );
  }

  /* MARK: 创建标题区域
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Text(
        _title,
        maxLines: 1,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black54,
        ),
      ),
    );
  }

  /* MARK: 创建用户名/密码输入框区域
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildInputArea(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          ///flutter中控件度量的单位是逻辑像素，和iOS中点的概念一样，为了使边框是1px宽，我们必须获取1个逻辑像素代表几个物理像素（px），
          ///MediaQuery.of(context).devicePixelRatio就是我们需要的，MediaQuery.of(context)返回MediaQueryData，
          ///MediaQueryData里包含屏幕大小（逻辑大小），padding等信息。
          width: MediaUtil.onePixelWideLine(context),
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      child: Column(
        children: <Widget>[
          // 用户名输入框
          UserNameInputWidget(
            userNameEditCtrl: _userNameEditCtrl,
            userNameFocusNode: _userNameFocusNode,
            onClick: () {
              print("页面的用户输入框点击事件");
            },
          ),
          Divider(height: 1.0),
          // 密码输入框
          PwdInputWidget(
            pwdEditCtrl: _pwdEditCtrl,
            pwdFocusNode: _pwdFocusNode,
            clearClick: () {
              print("页面的密码输入框的清空点击事件");
            },
            forgetPwdClick: () {
              _userNameFocusNode.unfocus();
              print("页面的密码输入框的忘记密码点击事件");
            },
          )
        ],
      ),
    );
  }

  /* MARK: 创建登录/立即注册按钮区域
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          /*
          Container(
                height: 44,
                child: CupertinoButton(
                  padding: EdgeInsets.all(0),
                  color: Colors.indigo,
                  disabledColor: Colors.grey.withOpacity(0.3),
                  pressedOpacity: 1,
                  child: Text('登录', style: TextStyle(color: Colors.white)),
                  onPressed: _loginBtnListener,
                )),*/
          Expanded(
            child: IosButton(
              buttonText: "登录",
              borderRadius: 8,
              activation: _loginBtnActivation,
              onTapCallback: _loginBtnClick,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: BorderButton(
                buttonText: "立即注册",
                borderRadius: 8,
                borderWidth: 1,
                activation: _loginBtnActivation,
                onTapCallback: () {
                  debugPrint("立即注册");
                }),
          ),
          // Container(
          //   height: 44,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(4),
          //     border: Border.all(width: 1, color: Colors.green),
          //   ),
          //   child: CupertinoButton(
          //     padding: EdgeInsets.all(0),
          //     pressedOpacity: 1,
          //     onPressed: () => print('123'),
          //     child: Text('立即注册',
          //         style: TextStyle(color: Colors.green, fontSize: 14)),
          //   ),
          // ),
          // ),
        ],
      ),
    );
  }

  /* MARK: 登录按钮点击事件
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Function _loginBtnClick() {
    // 用户名
    final username = _userNameEditCtrl.text;
    // 密码
    final pwd = _pwdEditCtrl.text;

    print("登录方法 用户名: $username, 密码： $pwd");

    //TODO: 调用登录接口
  }

  Widget getForm3(BuildContext context) {
    // 弹出键盘界面上推
    return SingleChildScrollView(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // banner
            _buildBanner(context),
            // 标题
            _buildTitle(context),
            // 用户名密码输入框部分
            _buildInputArea(context),
            // 登录注册按钮
            _buildButtons(context),
          ],
        ),
        onChanged: () {
          debugPrint("登录输入框内容：" + _userNameEditCtrl.text);
          debugPrint("密码输入框内容：" + _pwdEditCtrl.text);
          // 判断用户名与密码输入框都大于5位登录按钮变为可点击
          if (_userNameEditCtrl.text.length >= 11 &&
              _pwdEditCtrl.text.length >= 7) {
            // this._loginBtnListener = _loginBtnClick;
            this._loginBtnActivation = true;
          } else {
            this._loginBtnActivation = false;
            // this._loginBtnListener = null;
          }
        },
      ),
    );
  }

  Widget getForm2(BuildContext context) {
    final _usernameCtrl = TextEditingController();
    final _pwdCtrl = TextEditingController();
    GlobalKey _fromKey = GlobalKey<FormState>();
    return Form(
      key: _fromKey,
      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            controller: _usernameCtrl,
            decoration: InputDecoration(
              labelText: '用户名',
              hintText: '用户名或邮箱',
              icon: Icon(Icons.person),
            ),
            // 校验用户名
            validator: (val) {
              return val.trim().length > 0 ? null : '用户��不能为空';
            },
          ),
          TextFormField(
            controller: _pwdCtrl,
            decoration: InputDecoration(
              labelText: '密码',
              hintText: '您的登录密码',
              icon: Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (val) {
              return val.trim().length > 5 ? null : '密码不能少于6位';
            },
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Builder(
                      builder: (context) {
                        return FlatButton(
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          child: Text("登录"),
                          onPressed: () {
                            /**
                             * 在这里不能通过Form.of(context)的方式获取FormState，context不对
                             * 通过_formKey.currentState获取FormState后，
                             * 调用validate()方法校验用户名密码是否合法，校验通过后再提交数据
                             */
                            // if ((_fromKey.currentState as FormState).validate()) {
                            //   print('可以调用接口提交登录信息');
                            // }
                            print(Form.of(context).validate());
                            if (Form.of(context).validate()) {
                              print('可以调用接口提交登录信息');
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getForm1() {
    var controller1 = TextEditingController();
    var controller2 = TextEditingController();
    return Form(
      child: Column(
        children: <Widget>[
          Text("用户名"),
          TextFormField(
            decoration: InputDecoration(labelText: "你的用户名"),
            validator: (str) {
              // if (str.length < 3) {
              //   return "用户���过短";
              // }
              return null;
            },
            controller: controller1,
          ),
          Text('密码'),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText: "请输入密码"),
            controller: controller2,
          ),
        ],
      ),
      autovalidate: false,
      onChanged: () {
        print('输入框文本发生变化:' + controller1.text);
      },
    );
  }
}
