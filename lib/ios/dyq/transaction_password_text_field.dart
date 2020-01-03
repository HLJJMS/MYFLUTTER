import 'package:flutter/material.dart';
import 'dart:math';

typedef InputCallback = void Function(String pwdStrin);

class TransactionPasswordTextField extends StatefulWidget {

  EdgeInsetsGeometry margin;
  EdgeInsetsGeometry padding;
  double height;
  InputCallback callback;
  TextInputType keyboardType;

  TransactionPasswordTextField(this.height,{this.margin = EdgeInsets.zero,this.padding = EdgeInsets.zero,this.keyboardType = TextInputType.number,this.callback});

  @override
  _TransactionPasswordTextFieldState createState() =>
      _TransactionPasswordTextFieldState();
}

class _TransactionPasswordTextFieldState
    extends State<TransactionPasswordTextField> {

  String _pwdStr = "";
  FocusNode _commentFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      margin: widget.margin,
      height: widget.height,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand, //未定位widget占满Stack整个空间
        children: <Widget>[
          TextField(
            //光标宽度
            cursorWidth: 0.0,
            //光标颜色
            cursorColor: Color.fromRGBO(0, 0, 0, 0.0),
            //是否自动获得焦点
            autofocus: false,
            //控制此小部件是否具有键盘焦点。
            focusNode: _commentFocus,
            //输入文本的样式
            style: TextStyle(fontSize: 10.0, color:  Color.fromRGBO(0, 0, 0, 0)),
            //最大行数
            maxLines: 1,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(border: InputBorder.none),
            controller: TextEditingController.fromValue(
                TextEditingValue(
                    text: _pwdStr,
                    selection: TextSelection.fromPosition(
                        TextPosition(
                            affinity: TextAffinity.downstream,
                            offset: _pwdStr.length)))),
            onChanged: (text) {
              setState(() {
                if (text.length >= 6) {
                  _pwdStr = text.substring(0, 6);
                  _commentFocus.unfocus();    // 失去焦点
                } else {
                  _pwdStr = text;
                }
              });
              widget.callback(_pwdStr);
//              print(text);
            },
          ),
          GestureDetector(
            child: CustomPaint(
              painter: MyCustom(_pwdStr),
            ),
            onTap: (){
              FocusScope.of(context).requestFocus(_commentFocus);     // 获取焦点
            },
          ),

        ],
      ),
    );
  }
}


///  继承CustomPainter ，来实现自定义图形绘制
class MyCustom extends CustomPainter {

  ///  传入的密码，通过其长度来绘制圆点
  String pwdLength;
  MyCustom(this.pwdLength);

  ///  此处Sizes是指使用该类的父布局大小
  @override
  void paint(Canvas canvas, Size size) {

    // 密码画笔
    Paint mPwdPaint;
    Paint mRectPaint;

    // 初始化密码画笔
    mPwdPaint = new Paint();
    mPwdPaint..color = Colors.black;

//   mPwdPaint.setAntiAlias(true);
    // 初始化密码框
    mRectPaint = new Paint();
    mRectPaint..color = Color(0xff707070);

    ///  圆角矩形的绘制 前四个参数用来绘制矩形位置，最后一个参数绘制 Radius 弧度(整体圆角矩形)
    RRect r = new RRect.fromLTRBR(
        0.0, 0.0, size.width, size.height, new Radius.circular(size.height / 12));
    ///  画笔的风格
    mRectPaint.style = PaintingStyle.stroke;
    canvas.drawRRect(r, mRectPaint);

    ///  将其分成六个 格子（六位支付密码）(分割线)
    var per = size.width / 6.0;
    var offsetX = per;
    while (offsetX < size.width) {
      canvas.drawLine(
          new Offset(offsetX, 0.0), new Offset(offsetX, size.height), mRectPaint);
      offsetX += per;
    }



    ///  画实心圆
    var half = per/2;
    var radio = per/8;
    mPwdPaint.style = PaintingStyle.fill;
    ///  当前有几位密码，画几个实心圆
    for(int i =0; i< pwdLength.length && i< 6; i++){
      canvas.drawArc(new Rect.fromLTRB(i*per+half-radio, size.height/2-radio, i*per+half+radio, size.height/2+radio), 0.0, 2*pi, true, mPwdPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}