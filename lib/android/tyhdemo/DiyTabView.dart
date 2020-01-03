import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DiyTabView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DiyTabView();
  }
}

class _DiyTabView extends State<DiyTabView> {
  List<Widget> list = new List();
  int position = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list
      ..add(new Image.network(
          "http://pic.rmb.bdstatic.com/a5b615b075ff762573b69ada32d7f5981835.gif"))
      ..add(new Image.network(
          "http://imgbdb3.bendibao.com/shbdb/traffic/201912/03/20191203163151_98569.jpg"));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Fluttertoast.showToast(msg: "你点到中间打大圆了");
        },
//        背景颜色
        backgroundColor: Colors.orange,
        foregroundColor: Colors.green,
        hoverColor: Colors.purpleAccent,
//        点击后焦点以外的颜色
        focusColor: Colors.deepPurple,
//        点击焦点颜色
        splashColor: Colors.red,
        child: Icon(
          Icons.ac_unit,
          color: Colors.greenAccent,
        ),
      ),
      body: list[position],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: _getBottom(),
      ),
    );
  }

  Row _getBottom() {
    return new Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new IconButton(
                icon: new Icon(
                  Icons.phone,
                  color: _getColor(0),
                ),
                onPressed: () {
                  setState(() {
                    position = 0;
                  });
                }),
            new Text(
              "第一页",
              style: TextStyle(color: _getColor(0)),
            ),
          ],
        ),
        new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new IconButton(
              icon: new Icon(
                Icons.desktop_mac,
                color: _getColor(1),
              ),
              onPressed: () {
                setState(() {
                  position = 1;
                });
              },
            ),
            new Text(
              "第二页",
              style: TextStyle(color: _getColor(1)),
            )
          ],
        )
      ],
    );
  }

//  获取颜色
  MaterialColor _getColor(int number) {
    if (number == position) {
      return Colors.green;
    } else {
      return Colors.cyan;
    }
  }
}
