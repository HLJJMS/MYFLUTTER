import 'package:flutter/material.dart';

class ContainerPaddingView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContainerPaddingViewState();
  }
}

class _ContainerPaddingViewState extends State<ContainerPaddingView> {
  var left = 0.0;
  var right = 0.0;
  var top = 0.0;
  var bottom = 0.0;
  var padding;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('padding'),
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
在[容器]内的空白空间。[子容器]如果有的话，就是放在这个填充物里面。
这种内边距是对[装饰]中固有的任何内边距的补充;
看到[Decoration.padding]。
'''),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text('控制父布局内边距'),
              Text(
                '蓝色为父容器',
                style: TextStyle(color: Colors.blue),
              ),
              Text(
                '红色为子容器',
                style: TextStyle(color: Colors.red),
              ),
              Container(
                color: Colors.blue,
                height: 200,
                width: 200,
                padding: padding ??
                    EdgeInsets.only(
                        top: this.top,
                        bottom: bottom,
                        left: left,
                        right: right),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              RaisedButton(
                child: Text("show padding"),
                onPressed: () {
                  setState(() {
                    left = 0.0;
                    right = 0.0;
                    top = 0.0;
                    bottom = 0.0;
                    if (padding == null) {
                      padding = EdgeInsets.all(50.0);
                    } else {
                      padding = null;
                    }
                  });
                },
              ),
              RaisedButton(
                child: Text("show top padding"),
                onPressed: () {
                  setState(() {
                    padding = null;
                    if (top == 50.0) {
                      top = 0.0;
                    } else {
                      top = 50.0;
                    }
                  });
                },
              ),
              RaisedButton(
                child: Text("show bottom padding"),
                onPressed: () {
                  setState(() {
                    padding = null;
                    if (bottom == 50.0) {
                      bottom = 0.0;
                    } else {
                      bottom = 50.0;
                    }
                  });
                },
              ),
              RaisedButton(
                child: Text("show left padding"),
                onPressed: () {
                  setState(() {
                    padding = null;
                    if (left == 50.0) {
                      left = 0.0;
                    } else {
                      left = 50.0;
                    }
                  });
                },
              ),
              RaisedButton(
                child: Text("show right padding"),
                onPressed: () {
                  setState(() {
                    padding = null;
                    if (right == 50.0) {
                      right = 0.0;
                    } else {
                      right = 50.0;
                    }
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
