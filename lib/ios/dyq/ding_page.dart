import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../util/routerUtil.dart';
class DingPage extends StatefulWidget {
  DingPage({Key key}) : super(key: key);

  @override
  _DingPageState createState() => _DingPageState();
}

class _DingPageState extends State<DingPage> {

  File _image;

  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("demo"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Container(
              child: Text(
                "注册页",
                style: TextStyle(fontSize: 18),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "dingReg");
            },
          ),

          Padding(
            padding: EdgeInsets.all(10),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Container(
              child: Text(
                "电话权限",
                style: TextStyle(fontSize: 18),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "telPage");
            },
          ),

          Padding(
            padding: EdgeInsets.all(10),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Container(
              child: Text(
                "TextField",
                style: TextStyle(fontSize: 18),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "dingTextfield");
            },
          ),



          Padding(
            padding: EdgeInsets.all(10),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Container(
              child: Text(
                "TextFormField",
                style: TextStyle(fontSize: 18),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "dingTextFormfield");
            },
          ),


          Container(
            height: 60,
//              color: Colors.amber,
            foregroundDecoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(234, 234, 234, 1)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text('头像'),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    child: _image != null ? ClipOval(
                      child: Image.file(
                        _image,
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ):ClipOval(
                      child: Icon(Icons.camera,
                        size: 40,),
                    ),
                    onTap: (){
                      getImage();
                    },
                  ),
                )
              ],
            ),
          ),


          Padding(
            padding: EdgeInsets.all(10),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Container(
              child: Text(
                "交易密码",
                style: TextStyle(fontSize: 18),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "dingPwdPage");
            },
          ),


          Padding(
            padding: EdgeInsets.all(10),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Container(
              child: Text(
                "按钮之类的",
                style: TextStyle(fontSize: 18),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "dingOtherPage");
            },
          ),

          Padding(
            padding: EdgeInsets.all(10),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Container(
              child: Text(
                "绘画",
                style: TextStyle(fontSize: 18),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "dingPaintPage");
            },
          ),

          Padding(
            padding: EdgeInsets.all(10),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Container(
              child: Text(
                "高斯模糊",
                style: TextStyle(fontSize: 18),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, "dingGaosiPage");
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Container(
              child: Text(
                "仿appstore",
                style: TextStyle(fontSize: 18),
              ),
            ),
            onPressed: () {
//                Navigator.pushNamed(context, "dingAppstorePage");
              RouterUtil.navigateTo(
                context,
                "dingAppstorePage",
              );
            },
          ),


          Padding(
            padding: EdgeInsets.all(10),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Container(
              child: Text(
                "带banner的listview",
                style: TextStyle(fontSize: 18),
              ),
            ),
            onPressed: () {
//                Navigator.pushNamed(context, "dingAppstorePage");
              RouterUtil.navigateTo(
                context,
                "dingBannerListPage",
              );
            },
          ),


          Padding(
            padding: EdgeInsets.all(10),
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Container(
              child: Text(
                "测试自定义tableview",
                style: TextStyle(fontSize: 18),
              ),
            ),
            onPressed: () {
//                Navigator.pushNamed(context, "dingAppstorePage");
              RouterUtil.navigateTo(
                context,
                "dingTestTableViewPage",
              );
            },
          ),


        ],
      ),

    );
  }






  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(image);
    if (image != null){
      setState(() {
        _image = image;
      });
    }
  }
  
  
  
  
}