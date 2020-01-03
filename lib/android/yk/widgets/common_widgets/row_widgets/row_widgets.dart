import 'package:flutter/material.dart';

import '../../../ykRouter.dart';

class RowMainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RowMainViewState();
  }
}

class _RowMainViewState extends State {
  var crossAxisAlignment = CrossAxisAlignment.center;
  var mainAxisAlignment = MainAxisAlignment.center;
  var mainAxisSize = MainAxisSize.max;
  var textDirection = TextDirection.rtl;
  var verticalDirection = VerticalDirection.down;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Row'),
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
Row 是一个可以沿水平方向展示它的子组件的组件。
它还可以灵活布局，如果要让某个子组件填充满剩余剩余空间，请使用 Expanded 组件包裹该组件即可。
Row 组件是不可以滚动的，所以在 Row 组件中一般不会放置过多子组件，如果需要滚动的话应该考虑使用 ListView。
如果需要垂直展示，应该考虑 Column 组件。
如果只有一个子组件的话，应该考虑使用使用 Align 或者 Container 组件来定位这个子组件。
说了这么多，对我来说，Row 就是一个 orientation 为 horizontal 的 LinearLayout。
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
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Text('Expanded 扩展部件'),
                  color: Colors.red[900],
                ),
                onTap: () {
                  Navigator.pushNamed(
                      context, ROUTES_COMMON_WIDGETS_ROW_EXPANDED_VIEW);
                },
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: Text('textBaseline 基线对齐'),
                  color: Colors.red[800],
                ),
                onTap: () {
                  Navigator.pushNamed(
                      context, ROUTES_COMMON_WIDGETS_ROW_TEXT_BASELINE_VIEW);
                },
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
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
          height: double.infinity,
          color: Colors.grey,
          child: Row(
            // 子组件沿着 Cross 轴（在 Row 中是纵轴）如何摆放，其实就是子组件对齐方式
            crossAxisAlignment: crossAxisAlignment,
            // 子组件沿着 Main 轴（在 Row 中是横轴）如何摆放，其实就是子组件排列方式
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
              child: new Text('CrossAxisAlignment.start：子组件在 Row 中顶部对齐'),
              onPressed: () {
                setState(() {
                  crossAxisAlignment = CrossAxisAlignment.start;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('CrossAxisAlignment.end：子组件在 Row 中底部对齐'),
              onPressed: () {
                setState(() {
                  crossAxisAlignment = CrossAxisAlignment.end;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('CrossAxisAlignment.center：子组件在 Row 中居中对齐'),
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
              child: new Text('CrossAxisAlignment.baseline：按照文本基线对齐，如果子容器没有文本则以底边对齐，设置此属性时，必须要设置textBaseline属性'),
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
              child: new Text('MainAxisAlignment.start：靠左排列'),
              onPressed: () {
                setState(() {
                  mainAxisAlignment = MainAxisAlignment.start;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text('MainAxisAlignment.end：靠右排列'),
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
                  'VerticalDirection.up：Row 从下至上开始摆放子组件，此时我们看到的底部其实是顶部'),
              onPressed: () {
                setState(() {
                  verticalDirection = VerticalDirection.up;
                });
                Navigator.of(context).pop();
              },
            ),
            new SimpleDialogOption(
              child: new Text(
                  'VerticalDirection.down：Row 从上至下开始摆放子组件，此时我们看到的顶部就是顶部'),
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
