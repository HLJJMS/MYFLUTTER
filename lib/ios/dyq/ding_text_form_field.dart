import 'package:flutter/material.dart';
import '../../util/toastUtil.dart';
class DingTextFormField extends StatefulWidget {
  DingTextFormField({Key key}) : super(key: key);

  @override
  _DingTextFormFieldState createState() => _DingTextFormFieldState();
}

class _DingTextFormFieldState extends State<DingTextFormField> {
  //全局 Key 用来获取 Form 表单组件
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  //用户名
  String userName = "";

  //密码
  String password = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextFormField练习"),
      ),
      body: Container(
        child: Form(
          onChanged: (){
            print("onchange");
          },
          key: loginKey,
          //自动验证输入框内容
//          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: '请输入用户名',
                  hintText: "用户名或邮箱",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
                //校验用户
                validator: (value) {
                  if (value.trim().length <= 0){
                    showToast("用户名不能为空");
                  }
                  return null;
                },
                //当 Form 表单调用保存方法 Save时回调的函数。
                onSaved: (value) {
                  userName = value;
                },
                // 当用户确定已经完成编辑时触发
                onFieldSubmitted: (value) {},
              ),


              TextFormField(
                decoration: InputDecoration(
                  labelText: '请输入密码',
                  hintText: '你的登录密码',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
                //是否是密码
                obscureText: true,
                //校验密码
                validator: (value) {
                  if (value.length < 6){
                    showToast("密码长度不够 6 位");
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value;
                },
              ),

              Container(
                height: 88,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: login,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    padding: EdgeInsets.all(16),
                    child: Text(
                      '登录',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                ),
              ),











            ],
          ),
        ),
      ),
    );
  }


  void login() {
    //读取当前 表单的实例对象
    var loginForm = loginKey.currentState;
    //验证 Form表单
    if (loginForm.validate()) {
      loginForm.save();
      print('userName：' + userName + '，password：' + password);
    }
  }



}