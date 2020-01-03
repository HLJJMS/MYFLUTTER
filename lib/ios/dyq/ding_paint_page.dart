import 'dart:ui';

import 'package:flutter/material.dart';

class DingPaintPage extends StatefulWidget {
  DingPaintPage({Key key}) : super(key: key);

  @override
  _DingPaintPageState createState() => _DingPaintPageState();
}

class _DingPaintPageState extends State<DingPaintPage> {

  //画布（Canvas）
  //画布是一个矩形区域，我们可以控制其每一像素来绘制我们想要的内容
  //Canvas 拥有多种绘制点、线、路径、矩形、圆形、以及添加图像等的方法，
  // 结合这些方法我们可以绘制出千变万化的画面。
  //Canvas中有多个与绘制相关的方法，如drawLine()、drawRect()、drawOval()、drawOval()、等方法。
  //
  //画笔（Paint）
  //虽然，画布可以画点，线，路径，矩形，圆形等，但是决定这些图形颜色、粗细表现的还是画笔
  //Paint非常好理解，就是我们用来画图形的工具，我们可以设置画笔的颜色、粗细、是否抗锯齿、
  // 笔触形状以及作画风格。
  //通过这些属性我们可以很方便的来定制自己的UI效果，当然我们在“作画”的过程中可以定义多个画笔，
  // 这样更方便我们对图形的绘制



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("小画家"),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: CustomPaint(
              size: Size(300, 300),
              painter:MyPainterdrawLine() ,
            ),
          ),
          Center(
            child: CustomPaint(
              size: Size(300, 300),
              painter:MyPainterdrawPoints() ,
            ),
          ),
          Center(
            child: CustomPaint(
              size: Size(300, 300),
              painter:MyPainterdrawCircle() ,
            ),
          ),
          Center(
            child: CustomPaint(
              size: Size(300, 300),
              painter:MyPainterdrawOval() ,
            ),
          ),
          Center(
            child: CustomPaint(
              size: Size(300, 300),
              painter:MyPainterdrawArc() ,
            ),
          ),
          Center(
            child: CustomPaint(
              size: Size(300, 300),
              painter:MyPainterdrawDRRect() ,
            ),
          ),
          Center(
            child: CustomPaint(
              size: Size(300, 300),
              painter:MyPainterdrawRRect() ,
            ),
          ),

        ],
      ),
    );
  }
}

///绘制双圆角矩形drawRRect
class MyPainterdrawRRect extends CustomPainter {

  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round//画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.stroke //绘画风格，默认为填充
    ..strokeWidth = 5.0; //画笔的宽度

  @override
  void paint(Canvas canvas, Size size) {

    //绘制两个矩形
    Rect rect1 = Rect.fromCircle(center: Offset(100.0, 100.0), radius: 60.0);
    Rect rect2 = Rect.fromCircle(center: Offset(100.0, 100.0), radius: 40.0);

    //分别绘制外部圆角矩形和内部的圆角矩形
    RRect outer = RRect.fromRectAndRadius(rect1, Radius.circular(10.0));
    RRect inner = RRect.fromRectAndRadius(rect2, Radius.circular(10.0));
    canvas.drawDRRect(outer, inner, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}


///绘制圆角矩形drawDRRect
class MyPainterdrawDRRect extends CustomPainter {

  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round//画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.stroke //绘画风格，默认为填充
    ..strokeWidth = 5.0; //画笔的宽度

  @override
  void paint(Canvas canvas, Size size) {
    //用Rect构建一个边长50,中心点坐标为100,100的矩形
    Rect rect = Rect.fromCircle(center: Offset(140.0, 50.0), radius: 50.0);
    //根据上面的矩形,构建一个圆角矩形
    RRect rrect = RRect.fromRectAndRadius(rect, Radius.circular(20.0));
    canvas.drawRRect(rrect, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}

///绘制圆弧drawArc
class MyPainterdrawArc extends CustomPainter {

  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round//画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.fill //绘画风格，默认为填充
    ..strokeWidth = 5.0; //画笔的宽度

  @override
  void paint(Canvas canvas, Size size) {
    // Rect来确认圆弧的位置，还需要开始的弧度、结束的弧度、是否使用中心点绘制、以及paint弧度
    Rect rect = Rect.fromCircle(center: Offset(100, 40),radius:80);
    canvas.drawArc(rect,0.0,0.8,false,_paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}

///绘制椭圆drawOval
class MyPainterdrawOval extends CustomPainter {

  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round//画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.fill //绘画风格，默认为填充
    ..strokeWidth = 5.0; //画笔的宽度

  @override
  void paint(Canvas canvas, Size size) {
    //使用左上和右下角坐标来确定矩形的大小和位置,椭圆是在这个矩形之中内切的
    Rect rect = Rect.fromPoints(Offset(100.0, 40.0), Offset(220.0, 100.0));
    canvas.drawOval(rect, _paint..color=Colors.green);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}


///绘制圆drawCircle
class MyPainterdrawCircle extends CustomPainter {

  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round//画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.stroke //绘画风格，默认为填充
    ..strokeWidth = 5.0; //画笔的宽度

  @override
  void paint(Canvas canvas, Size size) {
    //绘制圆 参数(圆心，半径，画笔)
    canvas.drawCircle(Offset(140,80), 80,_paint..color = Colors.green);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}


///绘制直线
class MyPainterdrawLine extends CustomPainter {
  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round//画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.fill //绘画风格，默认为填充
    ..strokeWidth = 5.0; //画笔的宽度

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(20, 20), Offset(100,100), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}

///绘制点
class MyPainterdrawPoints extends CustomPainter {

  ///[定义画笔]
  Paint _paint = Paint()
    ..color = Colors.blueAccent //画笔颜色
    ..strokeCap = StrokeCap.round//画笔笔触类型
    ..isAntiAlias = true //是否启动抗锯齿
    ..style = PaintingStyle.fill //绘画风格，默认为填充
    ..strokeWidth = 5.0; //画笔的宽度

  @override
  void paint(Canvas canvas, Size size) {
    ///PointMode的枚举类型有三个，points（点），lines（线，隔点连接），polygon（线，相邻连接）
    canvas.drawPoints(PointMode.points, [
      Offset(20.0,  40.0),
      Offset(100.0, 120.0),
      Offset(100.0, 220.0),
      Offset(200.0, 220.0),
      Offset(200.0, 120.0),
      Offset(280.0, 40.0),
      Offset(20,    40.0),
    ],
        _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}