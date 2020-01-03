import 'package:flutter/material.dart';
import 'dart:math' as math;

class ContainerTransformView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContainerTransformViewState();
  }
}

class _ContainerTransformViewState extends State<ContainerTransformView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('transform'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('''
Transform可以在其子组件绘制时对其应用一些矩阵变换来实现一些特效。Matrix4是一个4D矩阵，通过它我们可以实现各种矩阵操作
Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的。
'''),
              Padding(padding: EdgeInsets.only(top: 40)),
              Container(
                color: Colors.black,
                child: new Transform(
                  alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                  transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                  child: new Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.deepOrange,
                    child: const Text('Apartment for rent!'),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text('平移'),
              Padding(padding: EdgeInsets.only(top: 5)),
              DecoratedBox(
                decoration:BoxDecoration(color: Colors.red),
                //默认原点为左上角，左移20像素，向上平移5像素
                child: Transform.translate(
                  offset: Offset(-20.0, -5.0),
                  child: Text("Hello world"),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text('旋转'),
              Padding(padding: EdgeInsets.only(top: 5)),
              DecoratedBox(
                decoration:BoxDecoration(color: Colors.red),
                child: Transform.rotate(
                  //旋转90度
                  angle:math.pi/2 ,
                  child: Text("Hello world"),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Text('缩放'),
              Padding(padding: EdgeInsets.only(top: 5)),
              DecoratedBox(
                  decoration:BoxDecoration(color: Colors.red),
                  child: Transform.scale(
                      scale: 1.5, //放大到1.5倍
                      child: Text("Hello world")
                  )
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
            ],
          ),
        ),
      ),
    );
  }
}
