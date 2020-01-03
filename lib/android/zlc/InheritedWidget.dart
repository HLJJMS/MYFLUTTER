import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyInheritedWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InheritedWidgets();
  }
}

class InheritedWidgets extends State<MyInheritedWidget>{
 int  count=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text("InheritedWidget"),),
    body:  ShardDateWidget(count,Center(
        child:Column(
      children: <Widget>[
        _TextWidet(),
        RaisedButton(child: Text("点击刷新父组件的值"),
        onPressed: (){
          setState(() {
            count++;
          });
        },)
      ],
    )),
    ),);
  }

}
class ShardDateWidget  extends InheritedWidget{
  final int data;
  //传入值
  ShardDateWidget(this.data, Widget child):super(child:child);
  //获取此widget对象 方便子widget 调用对象
  static ShardDateWidget of(BuildContext context){
    return context.inheritFromWidgetOfExactType(ShardDateWidget);
  }
  //如果此函数返回true则  state didChangeDependencies被调用
  @override
  bool updateShouldNotify(ShardDateWidget  oldWidget) {
    return data!=oldWidget.data;
  }

}
//新建一个有状态的组件
class _TextWidet extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextWidget();
  }

}
//当父组件的inheritedwidget变化时回调用子组件的didChangeDependencies回调并且子组件进行刷新
class _TextWidget extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(ShardDateWidget.of(context).data.toString());
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    print("didChangeDependencies被调用");

  }
}

