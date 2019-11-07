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

    return MaterialApp(
      title: "ListView",
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body: ListView.separated(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                  '${items[index]}'
              ),
            );
          },
          separatorBuilder: (context,index){
            return Container(
                constraints: BoxConstraints.tightFor(height: 1,width:0),
              color: Colors.amber,
            );
          },
        ),
      ),
    );
  }
}
