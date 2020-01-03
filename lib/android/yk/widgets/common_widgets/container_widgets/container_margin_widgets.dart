import 'package:flutter/material.dart';

class ContainerMarginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContainerMarginViewState();
  }
}

class _ContainerMarginViewState extends State<ContainerMarginView> {
  var left = 0.0;
  var right = 0.0;
  var top = 0.0;
  var bottom = 0.0;
  var margin;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('margin'),
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
用空的空间来包裹[装饰]和[子容器]，容器本身大小不变
'''),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text('控制子容器外边距'),
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
                child: Container(
                  width: 100,
                  height: 100,
                  margin: margin ??
                      EdgeInsets.only(
                          top: this.top,
                          bottom: bottom,
                          left: left,
                          right: right),
                  color: Colors.red,
                ),
              ),
              RaisedButton(
                child: Text("show margin"),
                onPressed: () {
                  setState(() {
                    left = 0.0;
                    right = 0.0;
                    top = 0.0;
                    bottom = 0.0;
                    if (margin == null) {
                      margin = EdgeInsets.all(50.0);
                    } else {
                      margin = null;
                    }
                  });
                },
              ),
              RaisedButton(
                child: Text("show top margin"),
                onPressed: () {
                  setState(() {
                    margin = null;
                    if (top == 50.0) {
                      top = 0.0;
                    } else {
                      top = 50.0;
                    }
                  });
                },
              ),
              RaisedButton(
                child: Text("show bottom margin"),
                onPressed: () {
                  setState(() {
                    margin = null;
                    if (bottom == 50.0) {
                      bottom = 0.0;
                    } else {
                      bottom = 50.0;
                    }
                  });
                },
              ),
              RaisedButton(
                child: Text("show left margin"),
                onPressed: () {
                  setState(() {
                    margin = null;
                    if (left == 50.0) {
                      left = 0.0;
                    } else {
                      left = 50.0;
                    }
                  });
                },
              ),
              RaisedButton(
                child: Text("show right margin"),
                onPressed: () {
                  setState(() {
                    margin = null;
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
