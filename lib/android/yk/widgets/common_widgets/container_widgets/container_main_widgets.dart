import 'package:flutter/material.dart';

import '../../../ykRouter.dart';

class ContainerMainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContainerMainViewState();
  }
}

class _ContainerMainViewState extends State {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Container'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text(
                  '集装箱类',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                padding: EdgeInsets.all(20),
              ),
              Container(
                child: Text('''
一种结合常见绘图、定位和大小调整小部件的方便小部件。
容器首先用填充物(由装饰)，然后应用额外的约束在填充物的范围内(包括width和height作为约束，如果两者都是非空的)。然后，容器被来自保证金.
在绘制过程中，容器首先应用给定的变换，然后绘制装饰若要填充填充范围，则绘制子区域，最后绘制前期装饰，也填充了填充物的范围。
没有子容器的容器尽量大，除非传入的约束是无限的，在这种情况下，它们尽量小。有孩子的容器对他们的孩子来说是合适的。这个width, height，和约束构造函数的参数覆盖此值。
            '''),
                padding: EdgeInsets.only(left: 20, right: 20),
              ),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Text('子容器 child'),
                  color: Colors.red[50],
                ),
                onTap: () {
                  Navigator.pushNamed(
                      context, ROUTES_COMMON_WIDGETS_CONTAINER_CHILD_VIEW);
                },
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Text('对齐 alignment'),
                  color: Colors.red[100],
                ),
                onTap: () {
                  Navigator.pushNamed(
                      context, ROUTES_COMMON_WIDGETS_CONTAINER_ALIGNMENT_VIEW);
                },
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Text('内边距 padding'),
                  color: Colors.red[200],
                ),
                onTap: () {
                  Navigator.pushNamed(
                      context, ROUTES_COMMON_WIDGETS_CONTAINER_PADDING_VIEW);
                },
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Text('外边距 margin'),
                  color: Colors.red[300],
                ),
                onTap: () {
                  Navigator.pushNamed(
                      context, ROUTES_COMMON_WIDGETS_CONTAINER_MARGIN_VIEW);
                },
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Text('装饰 decoration'),
                  color: Colors.red[400],
                ),
                onTap: () {
                  Navigator.pushNamed(
                      context, ROUTES_COMMON_WIDGETS_CONTAINER_DECORATION_VIEW);
                },
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Text('前景装饰 foregroundDecoration'),
                  color: Colors.red[500],
                ),
                onTap: () {
                  Navigator.pushNamed(context,
                      ROUTES_COMMON_WIDGETS_CONTAINER_FOREGROUND_DECORATION_VIEW);
                },
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Text('约束 constraints'),
                  color: Colors.red[600],
                ),
                onTap: () {
                  Navigator.pushNamed(context,
                      ROUTES_COMMON_WIDGETS_CONTAINER_CONSTRAINTS_VIEW);
                },
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Text('变换 transform'),
                  color: Colors.red[700],
                ),
                onTap: () {
                  Navigator.pushNamed(
                      context, ROUTES_COMMON_WIDGETS_CONTAINER_TRANSFORM_VIEW);
                },
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
            ],
          ),
        ),
      ),
    );
  }
}
