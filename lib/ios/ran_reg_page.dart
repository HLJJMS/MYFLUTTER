import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/routerUtil.dart';

class RangRegPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RanGePage();
  }
}

class _RanGePage extends State<RangRegPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("123"),
      ),
      body: hhhDate(),
    );
  }
}

class hhhDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: newtest(context),
    );
  }

  Widget newtest(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
      // margin: EdgeInsets.fromLTRB(100, 40, 0, 0),
      height: double.maxFinite,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.white,
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              "欢迎登陆银多网",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          newText1(),
          textField(),
          newText2(),
          textField1(),
          dengLuBtn(context),
          imageView(),
          dianHua(),
        ],
      ),
    );
  }

  Widget newText1() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 40,
      // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      margin: EdgeInsets.fromLTRB(20, 00, 0, 0),
      // transform: Matrix4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              "手机号/用户名",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textField() {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "请输入姓名",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget newText2() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 40,
      // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
      // transform: Matrix4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              "登陆密码",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textField1() {
    return Container(
      width: double.infinity,
      height: 100,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "请输入登陆密码",
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          twoBtn(),
        ],
      ),
    );
  }

  Widget twoBtn() {
    return Container(
      width: double.maxFinite,
      height: 50,
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 100,
            height: 50,
            padding: EdgeInsets.all(0),
            color: Colors.white,
            alignment: Alignment.center,
            child: FlatButton(
              child: Text(
                "验证码登录",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              onPressed: () {
                print("点击了");
              },
            ),
            // child: Text(
            //   "验证码登录"
            // ),
          ),
          Container(
            width: 100,
            height: 50,
            padding: EdgeInsets.only(right: 0),
            color: Colors.white,
            alignment: Alignment.center,
            child: FlatButton(
              child: Text(
                "忘记密码",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              onPressed: () {
                print("忘记密码");
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget dengLuBtn(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(30, 30, 30, 10),
      color: Colors.white,
      child: FlatButton(
        color: Colors.orange,
        child: Text("登陆"),
        onPressed: () {
          print("登陆");
          // Navigator.pushNamed(context, "ranGeSecond");
          // RouterUtil.navigateTo(context, "lc/ranran/second/:",transType: TransitionType.nativeModal);
          Navigator.of(context).pushNamed("ranran/second/${"张龙江是傻逼"}");
        },
      ),
    );
  }

  Widget imageView() {
    return Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
      color: Colors.white,
      child: Image.asset(
        "assets/image/renlian.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget dianHua() {
    return Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      alignment: Alignment.center,
      color: Colors.white,
      child: FlatButton(
        color: Colors.white,
        child: Text(
          "拨打电话",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
        onPressed: () {
          print("拨打电话");
        },
      ),
    );
  }
}

// class huanYing extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       color: Colors.white,
//       padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
//       // margin: EdgeInsets.fromLTRB(100, 40, 0, 0),
//       height: 100,
//       width: double.infinity,
//       child: Text(
//         "欢迎登陆银多网",
//         style: TextStyle(
//           fontSize: 25,
//           color: Colors.black,
//         ),

//       ),
//     );
//   }

// }

/* MARK: 初始化个容器
 * @LastEditors: 赵翌然
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
// class hhhData extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//       color: Color.fromRGBO(200, 16, 94, 1),
//       child: Column(
//         children: <Widget>[
//           Container(
//         padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//         color: Colors.red,
//         width: double.infinity,
//         height: 200,
//         child: Image.asset("assets/image/renlian.png",fit: BoxFit.cover,),
//       ),
//         newtest(),
//         ],
//       )
//     );
//   }

//   Widget newtest(){
//     return Container(
//       height: 100,
//       width: double.infinity,
//       color: Colors.white,
//       padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
//       child: Row(
//         children: <Widget>[
//           Container(
//             height: 100,
//             width: 100,
//             color: Colors.yellow,
//           )
//           newtest1(),
//         ],
//       ),
//     );
//   }
// Widget newtest1(){
//     return Container(
//       height: 100,
//       width: double.infinity,
//       color: Colors.white,
//       padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
//       child: Row(
//         children: <Widget>[
//           Container(
//             height: 100,
//             width: 100,
//             color: Colors.red,
//           )

//         ],
//       ),
//     );
//   }

// }
