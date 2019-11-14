import 'package:flutter/material.dart';

/**
 * Description 防止消费分期退换售后
 * Author  田羽衡
 * Version：<v1.0，2019/11/14 >
 * LastEditTime 2019/11/14
 * LastEditors
 * Deprecated  false
 */
class MyListView extends StatelessWidget {
  List<String> items = [];
  String photoUrl =
      "http://www.agri35.com/UploadFiles/img_1_27718957_1369346470_200.jpg";

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
    Future<Null> aa() {
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
                  child: new Container(
                    color: const Color(0xFFF6F6F6),
                    child: new ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return new Container(
                          color: Colors.white,
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Container(
                                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                child: Text(
                                  '订单编号:  45896328',
                                  style: TextStyle(
                                    color: const Color(0xFF9A9A9A),
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              new Container(
                                color: Color(0xFFeaeaea),
                                width: double.infinity,
                                height: 1,
                              ),
                              new Container(
                                margin: EdgeInsets.fromLTRB(8, 11, 21, 10),
                                child: Row(
                                  children: <Widget>[
                                    new Image.network(
                                      photoUrl,
                                      width: 60,
                                      height: 60,
                                    ),
                                    new Container(
                                      padding: EdgeInsets.fromLTRB(15, 0, 21, 0),
                                         child: new Text(
                                           "好哈哈哈哈哈哈哈哈哈哈或或或或或或或或或或或或或或或或或或或或或或或或或或",
                                           softWrap: true,
                                           maxLines: 2,
                                           overflow: TextOverflow.ellipsis,
                                           style: TextStyle(
                                             fontSize: 13,
                                             color: Colors.black87 ,
                                           ),
                                         ),
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )),
            );
          })),
    );
  }
}
