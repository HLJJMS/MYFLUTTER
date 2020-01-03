import 'package:flutter/material.dart';

class ContainerAlignmentView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContainerAlignmentViewState();
  }
}

class _ContainerAlignmentViewState extends State {
  var alignment;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('alignment'),
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
在容器内对齐[子容器]。
如果非空，则容器将展开以填充其父容器并定位其
根据给定的值，在它自身内部产生子元素。如果传入的
约束是无界的，那么子节点将被收缩包装。
如果[子]为空则忽略。
参见:
*[对齐]，一个具有方便常量的类，通常用于
指定一个[AlignmentGeometry]。
* [AlignmentDirectional]，比如[Alignment]用于指定对齐
相对于文本方向。
'''),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                '蓝色为父容器',
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                '红色为子容器',
                style: TextStyle(color: Colors.red),
              ),
              Text('alignment: alignment$alignment'),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                alignment: alignment,
                color: Colors.blue,
                height: 50,
                child: Container(
                  width: 10,
                  height: 10,
                  color: Colors.red,
                ),
              ),
              RaisedButton(
                child: Text("Alignment.bottomRight"),
                onPressed: () {
                  setState(() {
                    alignment = Alignment.bottomRight;
                  });
                },
              ),
              RaisedButton(
                child: Text("Alignment.bottomCenter"),
                onPressed: () {
                  setState(() {
                    alignment = Alignment.bottomCenter;
                  });
                },
              ),
              RaisedButton(
                child: Text("Alignment.bottomLeft"),
                onPressed: () {
                  setState(() {
                    alignment = Alignment.bottomLeft;
                  });
                },
              ),
              RaisedButton(
                child: Text("Alignment.centerRight"),
                onPressed: () {
                  setState(() {
                    alignment = Alignment.centerRight;
                  });
                },
              ),
              RaisedButton(
                child: Text("Alignment.center"),
                onPressed: () {
                  setState(() {
                    alignment = Alignment.center;
                  });
                },
              ),
              RaisedButton(
                child: Text("Alignment.centerLeft"),
                onPressed: () {
                  setState(() {
                    alignment = Alignment.centerLeft;
                  });
                },
              ),
              RaisedButton(
                child: Text("Alignment.topRight"),
                onPressed: () {
                  setState(() {
                    alignment = Alignment.topRight;
                  });
                },
              ),
              RaisedButton(
                child: Text("Alignment.topCenter"),
                onPressed: () {
                  setState(() {
                    alignment = Alignment.topCenter;
                  });
                },
              ),
              RaisedButton(
                child: Text("Alignment.topLeft"),
                onPressed: () {
                  setState(() {
                    alignment = Alignment.topLeft;
                  });
                },
              ),
              RaisedButton(
                child: Text("null"),
                onPressed: () {
                  setState(() {
                    alignment = null;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
