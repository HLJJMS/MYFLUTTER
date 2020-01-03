import 'package:flutter/material.dart';

class RowTextBaselineView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RowTextBaselineViewState();
  }
}

class _RowTextBaselineViewState extends State {
  var textBaseline = TextBaseline.alphabetic;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('TextBaseline'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Container(
                color: Colors.grey,
                child: Row(
                  // 子组件沿着 Cross 轴（在 Row 中是纵轴）如何摆放，其实就是子组件对齐方式
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  // 对其基线
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      'dey',
                      style: TextStyle(fontSize: 35),
                    ),
                    Text(
                      'ydl',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      'apf',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      '1',
                      style: TextStyle(fontSize: 35),
                    ),
                    Text(
                      '.10',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      '+12',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.grey,
                child: Row(
                  // 子组件沿着 Cross 轴（在 Row 中是纵轴）如何摆放，其实就是子组件对齐方式
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  // 对其基线
                  textBaseline: TextBaseline.ideographic,
                  children: <Widget>[
                    Text(
                      'dey',
                      style: TextStyle(fontSize: 35,),
                    ),
                    Text(
                      'ydl',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      'apf',
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      '1',
                      style: TextStyle(fontSize: 35),
                    ),
                    Text(
                      '.10',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      '+12',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),

              Container(
                color: Colors.grey,
                child: Row(
                  // 子组件沿着 Cross 轴（在 Row 中是纵轴）如何摆放，其实就是子组件对齐方式
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  // 对其基线
                  textBaseline: textBaseline,
                  children: <Widget>[
                    Text(
                      '1',
                      style: TextStyle(fontSize: 35),
                    ),
                    Text(
                      '.10',
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      '+12',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              Text('textBaseline：字符基线对其方式'),
              RaisedButton(
                child: Text("当前选中：$textBaseline"),
                onPressed: () {
                  setState(() {
                    _textBaselineDialog();
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 选择基线对齐方式弹窗
  Future _textBaselineDialog() async {
    showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return new SimpleDialog(
          title: new Text('选择textBaseline'),
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text('TextBaseline.alphabetic：用于将字母字符的字形底部对齐的水平线'),
              onPressed: () {
                setState(() {
                  textBaseline = TextBaseline.alphabetic;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('TextBaseline.ideographic：用来对齐表意文字的水平线'),
              onPressed: () {
                setState(() {
                  textBaseline = TextBaseline.ideographic;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((val) {
      print(val);
    });
  }
}
