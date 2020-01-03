import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyPaintExercise extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ExpansionPanelList();
  }
}

class _ExpansionPanelList extends State<MyPaintExercise> {
  @override
  Widget build(BuildContext context) {
    List<Item> _data = generateItems(3);
    DateTime _currentDateTime;
    return Scaffold(
        appBar: AppBar(),
        body: WillPopScope(
          onWillPop: () async {
            if (_currentDateTime == null ||
                DateTime.now().difference(_currentDateTime) >
                    Duration(seconds: 1)) {
              _currentDateTime = DateTime.now();
              Fluttertoast.showToast(
                msg: "请快速按下两次返回键退出应用", // TODO: 以后统计加入配置文件中
                toastLength: Toast.LENGTH_SHORT,
                backgroundColor: Colors.black,
                textColor: Colors.white,
              );
              return false;
            }
            return true;
          },
          child: Container(
            child: SingleChildScrollView(
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _data[index].isExpanded = !isExpanded;
                  });
                },
                children: _data.map<ExpansionPanel>((Item item) {
                  return ExpansionPanel(
                    canTapOnHeader: true,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(item.headerValue),
                      );
                    },
                    body: ListTile(
                        title: Text(item.expandedValue),
                        subtitle: Text(
                            'To delete this panel, tap the trash can icon'),
                        trailing: Icon(Icons.delete),
                        onTap: () {
                          setState(() {
                            _data.removeWhere(
                                (currentItem) => item == currentItem);
                          });
                        }),
                    isExpanded: item.isExpanded,
                  );
                }).toList(),
              ),
            ),
          ),
        ));
  }

  List<Item> generateItems(int numberOfItems) {
    return List.generate(numberOfItems, (int index) {
      return Item(
        headerValue: 'Panel $index',
        expandedValue: 'This is item number $index',
      );
    });
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

class ViewPaint extends CustomPainter {
  Rect rect = Rect.fromLTRB(100, 100, 300, 300);
  Paint myPaint;
  Path path;
  BuildContext context;
  ViewPaint(this.context) {
    myPaint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..strokeWidth = 20;
    path = Path();
  }
  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Rect.fromLTRB(0, 0, 500, 800));
    canvas.drawCircle(Offset(0, 0), 360.0, myPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}
