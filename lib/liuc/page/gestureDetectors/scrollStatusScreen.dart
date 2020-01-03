import 'package:flutter/material.dart';

class ScrollStatusScreen extends StatefulWidget {
  ScrollStatusScreen({Key key}) : super(key: key);

  @override
  _ScrollStatusScreenState createState() => _ScrollStatusScreenState();
}

class _ScrollStatusScreenState extends State<ScrollStatusScreen> {
  String message = "";

  _onStartScroll(ScrollMetrics metrics) {
    print(metrics.pixels);
    setState(() {
      message = "Scroll start ";
    });
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    print(metrics.pixels);
    setState(() {
      message = "Scroll Update";
    });
  }

  _onEndScroll(ScrollMetrics metrics) {
    print(metrics.pixels);
    setState(() {
      message = "Scroll End";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动事件通知'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.green,
            child: Center(
              child: Text(message),
            ),
          ),
          Expanded(
            // 事件通知
            child: NotificationListener<ScrollNotification>(
              onNotification: (sn) {
                // 手指按下
                if (sn is ScrollStartNotification) {
                  _onStartScroll(sn.metrics);
                  // 手指滑动
                } else if (sn is ScrollUpdateNotification) {
                  _onUpdateScroll(sn.metrics);
                  // 手指离开
                } else if (sn is ScrollEndNotification) {
                  _onEndScroll(sn.metrics);
                }
              },
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (contxt, index) {
                  return ListTile(title: Text("Index: $index"));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
