import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SomeContainerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContainerWidget();
  }
}

class ContainerWidget extends State<SomeContainerWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("容器嵌套"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                Wrap(
                  direction: Axis.horizontal,
                  //主轴方向
                  spacing: 8.0, // 间距
                  runSpacing: 4.0, // 新的行 或者列的间距
                  children: <Widget>[
                    //未做限制
                    ConstrainedBox(
                      constraints: BoxConstraints(),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            //阴影
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black, offset: Offset(2.0, 2.0))
                            ],
                            //圆角
                            borderRadius: BorderRadius.circular(5.0),
                            //背景渐变
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.red])),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Container(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      //里边比外边大外层限制内层
                      constraints: BoxConstraints(maxHeight: 80),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            //阴影
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black, offset: Offset(2.0, 2.0))
                            ],
                            //圆角
                            borderRadius: BorderRadius.circular(5.0),
                            //背景渐变
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.red])),
                        child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Container(
                              color: Colors.red,
                            )),
                      ),
                    ),
                    ConstrainedBox(
                      //里边比外边大外层限制内层
                      constraints: BoxConstraints(minHeight: 150),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            //阴影
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black, offset: Offset(2.0, 2.0))
                            ],
                            //圆角
                            borderRadius: BorderRadius.circular(5.0),
                            //背景渐变
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.red])),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Container(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            //阴影
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black, offset: Offset(2.0, 2.0))
                            ],
                            //圆角
                            borderRadius: BorderRadius.circular(5.0),
                            //背景渐变
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.red])),
                        child: Transform.rotate(
                          angle: 20,
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Container(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}

class MyClipper extends CustomClipper<RRect> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    return RRect.fromLTRBR(10, 10, 70, 70, Radius.circular(2));
  }

  //判断是否从新剪裁 如果此区域不发生变化则返回false 不会进行再次剪裁 变化则true
  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
