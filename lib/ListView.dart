import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  List<String> items = [];

  @override
  Widget build(BuildContext context) {
    items.add("1");
    items.add("2");
    items.add("3");
    items.add("4");
    items.add("5");
    items.add("6");
    items.add("7");
    items.add("8");
    items.add("9");
    items.add("10");
    items.add("11");
    items.add("12");
    items.add("13");
    items.add("14");
    items.add("15");
    items.add("16");
    items.add("17");
    items.add("18");
    items.add("19");
    items.add("20");
    Future<Null> aa(){
      print("刷新了");
    }
    return MaterialApp(
      title: "ListView",
      home: Scaffold(
          appBar: AppBar(
            title: Text("ListView"),
          ),
          body: new LayoutBuilder(builder: (context, constraints) {
            return new NotificationListener(

              onNotification: (ScrollNotification note) {
                print(note.metrics.pixels.toInt()); // 滚动位置。
              },
              child: RefreshIndicator(
                onRefresh: aa,
                child: new ListView.builder(
                  itemCount: items.length,

                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('今天吃什么？${items.elementAt(index)}'),
                          Container(
                            width: 500,
                            height: 5,
                            color: Colors.deepPurple,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          })),
    );
  }


}
