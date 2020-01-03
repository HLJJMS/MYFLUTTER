import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Grid();
  }
}

List<String> getDataList() {
  List<String> list = [];
  for (int i = 0; i < 100; i++) {
    list.add(i.toString());
  }
  return list;
}

class _Grid extends State<Grid> {
  final MyGridView myGridView = new MyGridView();

  Widget getItemContainer(String item) {
    return Container(
      width: 5.0,
      height: 5.0,
      alignment: Alignment.center,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Colors.blue,
    );
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: GridView.count(
            scrollDirection: Axis.vertical,
            //水平子Widget之间间距
            crossAxisSpacing: 10.0,
            //垂直子Widget之间间距
            mainAxisSpacing: 30.0,
            //GridView内边距
            padding: EdgeInsets.all(10.0),
            //一行的Widget数量
            crossAxisCount: 8,
            //子Widget宽高比例
            childAspectRatio: 2.0,
            //子Widget列表
            children: getWidgetList()));
  }
}

/**
 * 创建一个mygridview类
 * 创建方法返回单个card对象
 * 创建方法返回含有若干card对象的gridview
 */
class MyGridView {
  //方法传入name和iamge的路径 返回一个卡片类的对象
  Card getStructuredGridCell(String name, String image) {
    return new Card(
      elevation: 1.5, //阴影的虚拟高度
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          new Image(image: new AssetImage('images/' + image)),
          new Padding(
              padding: EdgeInsets.only(left: 60, top: 100),
              child: new Text(name)),
        ],
      ),
    );
  }

  //创建gridview的build的方法  返回的就是一个gridview的类对象
  GridView build() {
    return new GridView.count(
      crossAxisCount: 2,
      primary: true,
      padding: const EdgeInsets.all(1.0),
      childAspectRatio: 0.85,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: <Widget>[
        getStructuredGridCell("zhanglei", "img01.jpg"),
        getStructuredGridCell("zhanglei", "img01.jpg"),
        getStructuredGridCell("zhanglei", "img01.jpg"),
        getStructuredGridCell("wangliu", "img02.png"),
        getStructuredGridCell("zhanglei", "img01.jpg"),
        getStructuredGridCell("zhanglei", "img01.jpg"),
        getStructuredGridCell("zhanglei", "img01.jpg"),
      ],
    );
  }
}
