import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class DingTextfield extends StatefulWidget {
  DingTextfield({Key key}) : super(key: key);

  @override
  _DingTextfieldState createState() => _DingTextfieldState();
}

class _DingTextfieldState extends State<DingTextfield> {
  ///手机号默认值 demo15
  String phoneText = "18855555555";

  //手机号的控制器
  TextEditingController phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField练习"),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20
          ),
          child: ListView(
            children: <Widget>[
              Container(color: Colors.amber,height: 10,),
              demo1(),
              Container(color: Colors.amber,height: 10,),
              demo2(),
              Container(color: Colors.amber,height: 10,),
              demo3(),
              Container(color: Colors.amber,height: 10,),
              demo4(),
              Container(color: Colors.amber,height: 10,),
              demo5(),
              Container(color: Colors.amber,height: 10,),
              demo6(),
              Container(color: Colors.amber,height: 10,),
              demo7(),
              Container(color: Colors.amber,height: 10,),
              demo8(),
              Container(color: Colors.amber,height: 10,),
              demo9(),
              Container(color: Colors.amber,height: 10,),

              demo10(),
              Container(color: Colors.amber,height: 10,),
              demo11(),
              Container(color: Colors.amber,height: 10,),
              demo12(),
              Container(color: Colors.amber,height: 10,),
              demo13(),
              Container(color: Colors.amber,height: 10,),
              demo14(),
              Container(color: Colors.amber,height: 10,),
              demo15(),
              Container(color: Colors.amber,height: 10,),
              demo16(),
              Container(color: Colors.amber,height: 10,),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Container(
                  child: Text(
                    "综合注册页",
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
                    "TextFormField",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "dingTextFormfield");
                },
              ),





            ],
          ),
        ),
      ),
    );
  }


  Widget demo1(){
    return TextField(
      decoration: InputDecoration(
        labelText: "demo1-decoration-labelText",
        labelStyle: TextStyle(
          fontSize: 14,
          color: Colors.purple,
          fontWeight: FontWeight.bold
        )
      ),
    );
  }

  Widget demo2(){
    return TextField(
      decoration: InputDecoration(
          hintText: "demo2-decoration-hintText",
          hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.purple,
              fontWeight: FontWeight.bold
          )
      ),
    );
  }

  Widget demo3(){
    return TextField(
      decoration: InputDecoration(
          helperText: "demo3-decoration-helperText",
        helperStyle: TextStyle(
            fontSize: 19,
            color: Colors.red,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }


  Widget demo4(){
    return TextField(
      decoration: InputDecoration(
        hintText: "demo4-decoration-icon",
        hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.purple,
            fontWeight: FontWeight.bold
        ),
        icon: Icon(Icons.contacts),
      ),
    );
  }

  Widget demo5(){
    return TextField(
      decoration: InputDecoration(
        hintText: "demo5-decoration-contentPadding",
        hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.purple,
            fontWeight: FontWeight.bold
        ),
        contentPadding: EdgeInsets.all(0.0),
      ),
    );
  }


  Widget demo6(){
    return TextField(
      decoration: InputDecoration(
        hintText: "demo6-decoration-prefix",
        hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.purple,
            fontWeight: FontWeight.bold
        ),
        prefix: Icon(Icons.accessibility),
      ),
    );
  }


  Widget demo7(){
    return TextField(
      decoration: InputDecoration(
        prefixText: "demo7-decoration-prefixText",
        prefixStyle: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),
      ),
    );
  }

  Widget demo8(){
    return TextField(
      decoration: InputDecoration(
        hintText: "demo8-decoration-suffixIcon",
        hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.purple,
            fontWeight: FontWeight.bold
        ),
        suffixIcon: Icon(Icons.contacts),
      ),
    );
  }


  Widget demo9(){
    return TextField(
      decoration: InputDecoration(
        suffixText: "demo9-decoration-suffixText",
        suffixStyle: TextStyle(
            fontSize: 14,
            color: Colors.purple,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget demo10(){
    return TextField(
      decoration: InputDecoration(
          hintText: "demo10-decoration-border(InputBorder.none)",
          hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.purple,
              fontWeight: FontWeight.bold
          ),
        border: InputBorder.none
      ),
    );
  }

  Widget demo11(){
    return TextField(
      decoration: InputDecoration(
          hintText: "demo11-decoration-border(UnderlineInputBorder)",
          hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.purple,
              fontWeight: FontWeight.bold
          ),
          border: UnderlineInputBorder()
      ),
    );
  }

  Widget demo12(){
    return TextField(
      decoration: InputDecoration(
          hintText: "demo12-decoration-border(OutlineInputBorder)",
          hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.purple,
              fontWeight: FontWeight.bold
          ),
          border: OutlineInputBorder()
      ),
    );
  }



  Widget demo13(){
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: "demo13-keyboardType(TextInputType.number)",
          hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.purple,
              fontWeight: FontWeight.bold
          ),
      ),
    );
  }

  Widget demo14(){
    return Column(
      children: <Widget>[
        TextField(
          controller:phoneController,
          decoration: InputDecoration(
            hintText: "demo14-controller",
            hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.purple,
                fontWeight: FontWeight.bold
            ),
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
              "打印输入框内容",
              style: TextStyle(fontSize: 18),
            ),
          ),
          onPressed: () {
            print(phoneController.text);
          },
        ),
      ],
    );
  }

  Widget demo15(){
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "手机号",
          hintText: '请输入有效11位手机号',
          hintStyle: TextStyle(
            color: Color.fromRGBO(208, 208, 208, 1),
            fontSize: 17,
          ),
          border: InputBorder.none,
        filled: true,
        fillColor: Colors.white,
        helperText: "小综合练习"
      ),
      controller: TextEditingController.fromValue(
          TextEditingValue(
              text: phoneText,
              selection: TextSelection.fromPosition(
                  TextPosition(
                      affinity: TextAffinity.downstream,
                      offset: phoneText.length)))),
      onChanged: (text) {
        if (text.length > 11) {
          setState(() {
            phoneText = text.substring(0, 11);
          });
        } else {
          phoneText = text;
        }
        print(text);
      },
    );
  }


  Widget demo16(){
    return TextField(
      //键盘类型
      keyboardType: TextInputType.text,

      decoration: InputDecoration(
        hintText: "demo16-属性综合",
        hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.purple,
            fontWeight: FontWeight.bold
        ),
      ),

      //控制键盘的功能键 指enter键
      textInputAction: TextInputAction.done,

      //键盘大小写的显示 Only supports text keyboards  但是好像不起作用？
      //characters 默认为每个字符使用大写键盘
      //sentence 默认为每个句子的第一个字母使用大写键盘
      //word 默认为每个单词的第一个字母使用大写键盘。
      //none 默认使用小写
      textCapitalization: TextCapitalization.none,

      //是否是密码
      obscureText: false,

      //文本对齐方式(即光标初始位置)
      textAlign: TextAlign.center,

      //输入文本的样式
      style: TextStyle(fontSize: 30.0, color: Colors.blue),

      //最大行数
      maxLines: 1,

      //最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
      //这种情况一般是不符合我们设计的要求的，但是有需要限制其输入的位数
      // 这时候我们可以使用下方的属性来限制
      maxLength: 11,

      // 跟最大长度限制对应，如果此属性设置为false,当输入超过最大长度
      // 限制时，依然会显示输入的内容，为true不会（默认为 true）
      maxLengthEnforced: false,

      inputFormatters: [
        //白名单校验，也就是只允许输入符合规则的字符
        WhitelistingTextInputFormatter(RegExp("[a-z]")),
        //黑名单校验，除了规定的字符其他的都可以输入
//        BlacklistingTextInputFormatter(RegExp("[a-z]")),
        //长度限制，跟maxLength作用类似()
        LengthLimitingTextInputFormatter(15)
      ],


      //控制此小部件是否具有键盘焦点。
//      focusNode: FocusNode(),

      //是否自动更正
      autocorrect:false,

      //是否自动获得焦点
      autofocus: false,

      //是否禁用textfield:如果为false, textfield将被“禁用”
      enabled: true,

      //光标颜色
      cursorColor: Colors.red,

      //光标宽度
      cursorWidth: 5.0,

      //光标圆角弧度
      cursorRadius: Radius.circular(5.0),

      //内容改变的回调
      onChanged: (text) {
        print('change $text');
      },

      //内容提交(按回车)的回调
      onSubmitted: (text) {
        print('submit $text');
      },

      //按回车时调用
      onEditingComplete: (){
        print('onEditingComplete');
      },

    );
  }



}