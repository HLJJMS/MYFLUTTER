import 'package:flutter/material.dart';

class ListViewDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _listViewDemoPage();
  }
}

class _listViewDemoPage extends State<ListViewDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List练习"),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index){
          return Container(
            height: 50,
            color: Colors.red,
            child: Column(
              children: <Widget>[
                Text("数据$index"),
                Divider(
                  height: 2,
                  indent: 30,
                  endIndent: 30,
                  color: Colors.black26,
                )
              ],
            )
          );
        }
      ),
    );
  }
}