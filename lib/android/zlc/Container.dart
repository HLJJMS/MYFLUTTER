import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyContainerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContainerWidget();
  }
}

class ContainerWidget extends State<MyContainerWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("容器"),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("pading使用"),
              //pading使用
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text("容器内上下左右都留白"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text("容器内只有右边留白"),
                  )
                ],
              ),
              //固定大小的容器
              Text("固定大小的容器"),
              SizedBox(
                width: 50,
                height: 100,
                child: Container(
                  color: Colors.green,
                ),
              ),
              Text("外层约束内层容器"),
              //外层约束内层容器
              ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 100, minHeight: 50),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 200, minHeight: 100),
                    child: Container(
                      color: Colors.red,
                    ),
                  )),
              Text("装饰容纳的使用"),
              DecoratedBox(
                decoration: BoxDecoration(
                    //阴影
                    boxShadow: [
                      BoxShadow(color: Colors.black, offset: Offset(2.0, 2.0))
                    ],
                    //圆角
                    borderRadius: BorderRadius.circular(5.0),
                    //背景渐变
                    gradient:
                        LinearGradient(colors: [Colors.white, Colors.red])),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                      "http://i1.sinaimg.cn/ent/d/2008-06-04/U105P28T3D2048907F326DT20080604225106.jpg"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("变换Transform 使其子组件进行位置变化，平移、旋转、缩放等"),
              ),

              Container(
                color: Colors.blue,
                child: Transform.rotate(
                  angle: 20,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        //阴影
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black, offset: Offset(2.0, 2.0))
                        ],
                        //圆角
                        borderRadius: BorderRadius.circular(5.0),
                        //背景渐变
                        gradient:
                            LinearGradient(colors: [Colors.white, Colors.red])),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                          "http://i1.sinaimg.cn/ent/d/2008-06-04/U105P28T3D2048907F326DT20080604225106.jpg"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("图片原图"),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.network(
                    "http://b-ssl.duitang.com/uploads/blog/201401/07/20140107171234_3W2RC.jpeg"),
              ),
              Text("FittedBox，做了缩放（Scale）以及位置调整（Position）两件事"),
              SizedBox(
                width: 200,
                height: 100,
                child: FittedBox(
                  fit: BoxFit.fitWidth, //可以让其内部属性以什么样的方式进行填充
                  child: Image.network(
                      "http://b-ssl.duitang.com/uploads/blog/201401/07/20140107171234_3W2RC.jpeg"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("剪裁clip 圆形"),
              ),
              ClipOval(
                  child: SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                    "http://b-ssl.duitang.com/uploads/blog/201401/07/20140107171234_3W2RC.jpeg"),
              )),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("剪裁clip 矩形"),
              ),

              ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                      "http://b-ssl.duitang.com/uploads/blog/201401/07/20140107171234_3W2RC.jpeg"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("剪裁clip 特定位置"),
              ),
              ClipRRect(
                clipper: MyClipper(),
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.network(
                      "http://b-ssl.duitang.com/uploads/blog/201401/07/20140107171234_3W2RC.jpeg"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                    "AspectRatio宽高比例控件还有这个组件IntrinsicHeight和AspectRatio 效果相似但是官方不建议用"),
              ),
              SizedBox(
                height: 80,
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("Baseline 设置字体对齐"),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Baseline(
                    baseline: 50,
                    //alphabetic：对齐字符底部的水平线；
                    //ideographic：对齐表意字符的水平线。
                    baselineType: TextBaseline.ideographic,
                    child: Text(
                      "国",
                      style: TextStyle(
                          fontSize: 50, textBaseline: TextBaseline.ideographic),
                    ),
                  ),
                  Baseline(
                    baseline: 50,
                    baselineType: TextBaseline.ideographic,
                    child: Text(
                      "臀",
                      style: TextStyle(
                          fontSize: 50, textBaseline: TextBaseline.ideographic),
                    ),
                  ),
                  Baseline(
                    baseline: 50,
                    baselineType: TextBaseline.ideographic,
                    child: Text(
                      "yyy",
                      style: TextStyle(
                          fontSize: 50, textBaseline: TextBaseline.ideographic),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: <Widget>[
                  //alphabetic：对齐字符底部的水平线；
                  //ideographic：对齐表意字符的水平线。
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                  Text(
                    "jjjjjj",
                    style: TextStyle(fontSize: 50),
                  ),
                  Text(
                    "国",
                    style: TextStyle(fontSize: 50),
                  ),
                  Text(
                    "yyyyyy",
                    style: TextStyle(fontSize: 50),
                  ),
                  Text(
                    "三",
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    "一",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                    "FractionallySizedBox布局，如果此组件设置了宽高因子，那么它可以不受父布局大小约束而超出界限尽可能大的展示"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: FractionallySizedBox(
                      alignment: Alignment.centerRight,
                      heightFactor: 0.5,
                      widthFactor: 1.5,
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(50),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: FractionallySizedBox(
                      heightFactor: 1.5,
                      widthFactor: 0.5,
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("OverflowBox 可以超出父组件的控制进行显示"),
              ),
              Container(
                  color: Colors.green,
                  width: 200,
                  height: 200,
                  child: OverflowBox(
                    alignment: Alignment.centerRight,
                    maxWidth: 300,
                    maxHeight: 200,
                    child: Container(
                      width: 400,
                      height: 400,
                      color: Color(0x33FF00FF),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("Stack 绝对布局"),
              ),
//              fit：如何确定没有使用 Position 包裹的子组件的大小
//                  StackFit.loose：子组件宽松取值，可以从 min 到 max。
//                  StackFit.expand：子组件取最大值。
//                  StackFit.passthrough：如果stack的父布局为类似Expanded不改变子组件约束条件。
              Container(
                width: double.maxFinite,
                height: 300,
                child: Stack(
                  alignment: Alignment.topRight,
                  textDirection: TextDirection.ltr,
                  fit: StackFit.loose,
                  overflow: Overflow.visible,
                  // stack 超出父布局限制大小是否显示  不显示Overflow.clip
                  // 显示Overflow.visible
                  children: <Widget>[
                    Positioned(
                      top: -80,
                      left: 50,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Fluttertoast.showToast(msg: "ClipOval越界部分点击事件");
                        },
                        child: Container(
                            child: ClipOval(
                                child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network(
                              "http://b-ssl.duitang.com/uploads/blog/201401/07/20140107171234_3W2RC.jpeg"),
                        ))),
                      ),
                    ),
                    ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network(
                              "http://b-ssl.duitang.com/uploads/blog/201401/07/20140107171234_3W2RC.jpeg"),
                        )),
                    Positioned(
                      bottom: 25,
                      child: RaisedButton(
                          onPressed: () {
                            Fluttertoast.showToast(msg: "ClipOval越界部分点击事件");
                          },
                          child: ClipOval(
                              child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.network(
                                "http://b-ssl.duitang.com/uploads/blog/201401/07/20140107171234_3W2RC.jpeg"),
                          ))),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("IndexStack 绝对布局"),
              ),
              IndexedStack(
                index: 2, //显示第index个child 其他多余则不显示
                children: <Widget>[
                  ClipOval(
                      child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.network(
                        "http://b-ssl.duitang.com/uploads/blog/201401/07/20140107171234_3W2RC.jpeg"),
                  )),
                  Positioned(
                    bottom: 25,
                    child: Container(
                      child: Text("aaaaa"),
                    ),
                  ),
                  Positioned(
                    bottom: 25,
                    child: Container(
                      child: Text("bbbbb"),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("Wrap  可以同 column 或者row实现一样的效果，"
                    "不过它如果行、列间距不够展示，会自动换行列。"),
              ),
              //
              Wrap(
                //主轴方向
                direction: Axis.horizontal,
                //换行后的位置
                alignment: WrapAlignment.end,
                runAlignment: WrapAlignment.start,
                spacing: 10.0, // 主轴方向上的间距
                runSpacing: 4.0, // 新的行 或者列的间距
                //垂直方向上的排序
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: new Text(
                          'AH',
                          style: TextStyle(fontSize: 10.0),
                        )),
                    label: Text('Hamilton'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: new Text(
                          'ML',
                          style: TextStyle(fontSize: 10.0),
                        )),
                    label: Text('Lafayette'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: new Text(
                          'HM',
                          style: TextStyle(fontSize: 10.0),
                        )),
                    label: Text('Mulligan'),
                  ),
                  Chip(
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue.shade900,
                        child: new Text(
                          'JL',
                          style: TextStyle(fontSize: 10.0),
                        )),
                    label: Text('Laurens'),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("ListBody 会让其按照制定方向按顺序排列子节点"
                    "但在主轴上，给予子节点的空间必须是不受限制的（unlimited）"),
              ),
              ListBody(
                mainAxis: Axis.vertical,
                reverse: false, //可以改变子节点顺序
                children: <Widget>[
                  Container(
                    color: Colors.red,
                    width: 50.0,
                    height: 50.0,
                  ),
                  Container(
                    color: Colors.yellow,
                    width: 50.0,
                    height: 50.0,
                  ),
                  Container(
                    color: Colors.green,
                    width: 50.0,
                    height: 50.0,
                  ),
                  Container(
                    color: Colors.blue,
                    width: 50.0,
                    height: 50.0,
                  ),
                  Container(
                    color: Colors.black,
                    width: 50.0,
                    height: 50.0,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("Card "),
              ),
              new Card(
                borderOnForeground: false, //将这个圆角显示在子child 前边 默认是 true
                color: Colors.white,
                //默认为true 即边框画在子child的后边
                elevation: 15.0, //设置阴影
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(14.0))), //设置圆角
                child: new Column(
                  // card只能有一个widget，但这个widget内容可以包含其他的widget
                  children: [
                    new ListTile(
                      title: new Text('标题',
                          style: new TextStyle(fontWeight: FontWeight.w500)),
                      subtitle: new Text('子标题'),
                      leading: new Icon(
                        Icons.restaurant_menu,
                        color: Colors.blue[500],
                      ),
                    ),
                    new Divider(),
                    new ListTile(
                      title: new Text('内容一',
                          style: new TextStyle(fontWeight: FontWeight.w500)),
                      leading: new Icon(
                        Icons.contact_phone,
                        color: Colors.blue[500],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("Opacity"),
              ),
              Center(
                child: Opacity(
                  opacity: 0.5,
                  alwaysIncludeSemantics: true,
                  child: Container(
                    height: 50,
                    color: Colors.red,
                    child: Text(
                      "透明度信息",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(15),
                child: Text("Expanded 它可以填充布局剩余空间"),
              ),
              new Row(children: <Widget>[
                new FlatButton(
                  color: Colors.red,
                  child: Padding(
                    child: new Text('红色按钮'),
                    padding: EdgeInsets.all(15),
                  ),
                ),
                new Expanded(
                  flex: 1,
                  child: new FlatButton(
                    color: const Color(0xfff1c232),
                    child: new Text('黄色按钮'),
                  ),
                ),
                new FlatButton(
                  color: const Color(0xffea9999),
                  child: new Text('粉色按钮'),
                ),
              ]),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("Flexible 它不填充布局剩余空间"),
              ),
              new Row(children: <Widget>[
                new RaisedButton(
                  color: const Color(0xffcc0000),
                  child: new Text('红色按钮'),
                ),
                new Flexible(
                  flex: 1,
                  child: new MaterialButton(
                    minWidth: 0,
                    padding: EdgeInsets.all(0),
                    color: const Color(0xfff1c232),
                    child: new Text('钮'),
                  ),
                ),
                new RaisedButton(
                  color: const Color(0xffea9999),
                  child: new Text('粉色按钮'),
                ),
              ]),
            ],
          ),
        ));
  }
}

class MyClipper extends CustomClipper<RRect> {
  @override
  getClip(Size size) {
    // TODO: implement getClip
    //可以定义截取哪个圆角
    return RRect.fromLTRBAndCorners(
      50,
      50,
      200,
      200,
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
    );
    //可以定义椭圆
//    return RRect.fromRectXY(
//    Rect.fromLTRB(
//    50,
//    50,
//    150,
//    150,
//    ),
//    50,
//    15);
  }

  //判断是否从新剪裁 如果此区域不发生变化则返回false 不会进行再次剪裁 变化则true
  @override
  bool shouldReclip(CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
