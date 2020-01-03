import 'package:flutter/material.dart';

class GridViewDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _gridViewDemoPageState();
  }
}

class _gridViewDemoPageState extends State<GridViewDemoPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView练习")
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(5),
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, 
          mainAxisSpacing: 10, 
          childAspectRatio: 1, 
          crossAxisSpacing: 10
        ), 
        itemBuilder: (BuildContext context, int index){
          return Container(
            color: Colors.red,
            child: Text("第$index个元素"),
          );
        },
      )
    );
  }
}