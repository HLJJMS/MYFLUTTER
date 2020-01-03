
import 'package:flutter/material.dart';

class ChildTreePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChildTreeState();
  }
  
}

class _ChildTreeState extends State<ChildTreePage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("子树中获取Sate对象"),
      ),
      body: Center(
        child: Builder(builder: (context){
          return RaisedButton(
            onPressed: () {
              // 查询父级最近的Scaffold对应的ScaffoldState对象
              ScaffoldState _state = context.ancestorStateOfType(TypeMatcher<ScaffoldState>());
              // 调用 ScaffoldState的showSnackBar来弹出SnackBar
              _state.showSnackBar(
                SnackBar(
                  content: Text("我是SnackBar")
                )
              );
            },
            child: Text("显示SnackBar"),
          );
        }),
      ),
    );
  }
}