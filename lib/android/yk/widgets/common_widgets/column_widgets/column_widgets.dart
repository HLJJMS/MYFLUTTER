import 'package:flutter/material.dart';

class ColumnMainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ColumnMainViewState();
  }
}

class _ColumnMainViewState extends State {
  var crossAxisAlignment = CrossAxisAlignment.center;
  var mainAxisAlignment = MainAxisAlignment.center;
  var mainAxisSize = MainAxisSize.max;
  var textDirection = TextDirection.rtl;
  var verticalDirection = VerticalDirection.down;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Column'),
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
                child: Text('''
Column 就相当于一个 orientation 为 vertical 的 LinearLayout。
它的用法完全与 Row 大部分一样。
Column 设置textDirection属性无效，crossAxisAlignment属性设置baseline时会报错
            '''),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Container(
                width: double.infinity,
                height: 200,
                child: _getExampleView(),
              ),
              Text(
                  'crossAxisAlignment：子组件沿着 Cross 轴（在 Row 中是纵轴）如何摆放，其实就是子组件对齐方式'),
              RaisedButton(
                child: Text("当前选中：$crossAxisAlignment"),
                onPressed: () {
                  setState(() {
                    _crossAxisAlignmentDialog();
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Text(
                  'mainAxisAlignment：子组件沿着 Main 轴（在 Row 中是横轴）如何摆放，其实就是子组件排列方式'),
              RaisedButton(
                child: Text("当前选中：$mainAxisAlignment"),
                onPressed: () {
                  setState(() {
                    _mainAxisAlignmentDialog();
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Text('mainAxisSize：Main 轴大小'),
              RaisedButton(
                child: Text("当前选中：$mainAxisSize"),
                onPressed: () {
                  setState(() {
                    _mainAxisSizeDialog();
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Text('textDirection：子组件排列顺序'),
              RaisedButton(
                child: Text("当前选中：$textDirection"),
                onPressed: () {
                  setState(() {
                    _textDirectionDialog();
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Text(
                  'verticalDirection：确定如何在垂直方向摆放子组件，以及如何解释 start 和 end，指定 height 可以看到效果'),
              RaisedButton(
                child: Text("当前选中：$verticalDirection"),
                onPressed: () {
                  setState(() {
                    _verticalDirectionDialog();
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getExampleView() {
    return Stack(
      alignment: FractionalOffset.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          color: Colors.grey,
          child: Column(
            // 子组件沿着 Cross 轴（在 Column 中是横轴）如何摆放，其实就是子组件对齐方式
            crossAxisAlignment: crossAxisAlignment,
            // 子组件沿着 Main 轴（在 Column 中是纵轴）如何摆放，其实就是子组件排列方式
            mainAxisAlignment: mainAxisAlignment,
            // Main 轴大小
            mainAxisSize: mainAxisSize,
            // 子组件排列顺序
            textDirection: textDirection,
            // 确定如何在垂直方向摆放子组件，以及如何解释 start 和 end，指定 height 可以看到效果
            verticalDirection: verticalDirection,
            children: <Widget>[
              Container(
                width: 10,
                height: 10,
                color: Colors.red,
              ),
              Container(
                width: 20,
                height: 20,
                color: Colors.blue,
              ),
              Container(
                width: 40,
                height: 40,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 0.5,
              color: Colors.green,
            ),
            Container(
              width: 0.5,
              color: Colors.green,
            ),
            Container(
              width: 0.5,
              color: Colors.green,
            ),
            Container(
              width: 0.5,
              color: Colors.green,
            ),
            Container(
              width: 0.5,
              color: Colors.green,
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 0.5,
              color: Colors.green,
            ),
            Container(
              height: 0.5,
              color: Colors.green,
            ),
            Container(
              height: 0.5,
              color: Colors.green,
            ),
            Container(
              height: 0.5,
              color: Colors.green,
            ),
            Container(
              height: 0.5,
              color: Colors.green,
            ),
          ],
        ),
      ],
    );
  }

  /// 对其方式 选择弹窗
  Future _crossAxisAlignmentDialog() async {
    showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return new SimpleDialog(
          title: new Text('选择crossAxisAlignment'),
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text('CrossAxisAlignment.start：子组件在 Column 中右侧对齐'),
              onPressed: () {
                setState(() {
                  crossAxisAlignment = CrossAxisAlignment.start;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('CrossAxisAlignment.end：子组件在 Column 中左侧对齐'),
              onPressed: () {
                setState(() {
                  crossAxisAlignment = CrossAxisAlignment.end;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('CrossAxisAlignment.center：子组件在 Column 中居中对齐'),
              onPressed: () {
                setState(() {
                  crossAxisAlignment = CrossAxisAlignment.center;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('CrossAxisAlignment.stretch：拉伸填充满父布局'),
              onPressed: () {
                setState(() {
                  crossAxisAlignment = CrossAxisAlignment.stretch;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('CrossAxisAlignment.baseline：在 Column 组件中会报错'),
              onPressed: () {
                setState(() {
                  crossAxisAlignment = CrossAxisAlignment.baseline;
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

  /// 选择排列方式弹窗
  Future _mainAxisAlignmentDialog() async {
    showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return new SimpleDialog(
          title: new Text('选择mainAxisAlignment'),
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text('MainAxisAlignment.start：靠上排列'),
              onPressed: () {
                setState(() {
                  mainAxisAlignment = MainAxisAlignment.start;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('MainAxisAlignment.end：靠下排列'),
              onPressed: () {
                setState(() {
                  mainAxisAlignment = MainAxisAlignment.end;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('MainAxisAlignment.center：居中排列'),
              onPressed: () {
                setState(() {
                  mainAxisAlignment = MainAxisAlignment.center;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'MainAxisAlignment.spaceAround：每个子组件左右间隔相等，也就是 margin 相等'),
              onPressed: () {
                setState(() {
                  mainAxisAlignment = MainAxisAlignment.spaceAround;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'MainAxisAlignment.spaceBetween：两端对齐，也就是第一个子组件靠左，最后一个子组件靠右，剩余组件在中间平均分散排列'),
              onPressed: () {
                setState(() {
                  mainAxisAlignment = MainAxisAlignment.spaceBetween;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child:
                  new Text('MainAxisAlignment.spaceEvenly：每个子组件平均分散排列，也就是宽度相等'),
              onPressed: () {
                setState(() {
                  mainAxisAlignment = MainAxisAlignment.spaceEvenly;
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

  /// 选择Main 轴大小弹窗
  Future _mainAxisSizeDialog() async {
    showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return new SimpleDialog(
          title: new Text('选择mainAxisSize'),
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text('MainAxisSize.max：相当于 Android 的 match_parent'),
              onPressed: () {
                setState(() {
                  mainAxisSize = MainAxisSize.max;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('MainAxisSize.min：相当于 Android 的 wrap_content'),
              onPressed: () {
                setState(() {
                  mainAxisSize = MainAxisSize.min;
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

  /// 选择子组件排列顺序弹窗
  Future _textDirectionDialog() async {
    showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return new SimpleDialog(
          title: new Text('选择textDirection'),
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text('TextDirection.ltr：从左往右开始排列'),
              onPressed: () {
                setState(() {
                  textDirection = TextDirection.ltr;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('TextDirection.rtl：从右往左开始排列'),
              onPressed: () {
                setState(() {
                  textDirection = TextDirection.rtl;
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

  /// 选择确定如何在垂直方向摆放子组件弹窗
  Future _verticalDirectionDialog() async {
    showDialog<Null>(
      context: context,
      builder: (BuildContext context) {
        return new SimpleDialog(
          title: new Text('选择verticalDirection'),
          children: <Widget>[
            new SimpleDialogOption(
              child: new Text(
                  'VerticalDirection.up：Column 从上至下 开始摆放子组件'),
              onPressed: () {
                setState(() {
                  verticalDirection = VerticalDirection.up;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'VerticalDirection.down：Column 从下至上 开始摆放子组件'),
              onPressed: () {
                setState(() {
                  verticalDirection = VerticalDirection.down;
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
