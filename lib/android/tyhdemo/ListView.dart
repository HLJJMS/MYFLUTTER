import 'package:flutter/material.dart';
import 'package:flutter_app/android/tyhdemo/bean/ListBean.dart';

/**
 * Description 仿制消费分期退换售后
 * Author  田羽衡
 * Version：<v1.0，2019/11/14 >
 * LastEditTime 2019/11/14
 * LastEditors
 * Deprecated  false
 */
class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListViewDo(),
    );
  }
}

class ListViewDo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListViewDo();
  }
}

class _ListViewDo extends State<ListViewDo> {
  List<ListBean> items = [];
  String photoUrl =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1575372065525&di=d7977a401b6426760d6a01fe5c663c8a&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201407%2F26%2F20140726235459_r3YnS.jpeg";
  String backUrl =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573729803017&di=eeda474d5c196cc4e7cd030dbad95202&imgtype=0&src=http%3A%2F%2Fpic.51yuansu.com%2Fpic2%2Fcover%2F00%2F39%2F10%2F5812d45cb3ff0_610.jpg";

  @override
  Widget build(BuildContext context) {
    items.add(new ListBean("娃哈哈", "12346", Colors.deepPurple, 10));
    items.add(new ListBean("娃哈哈", "12346", Colors.deepPurple, 10));
    items.add(new ListBean("娃哈哈", "12346", Colors.deepPurple, 10));
    items.add(new ListBean("娃哈哈", "12346", Colors.deepPurple, 10));
    items.add(new ListBean("娃哈哈", "12346", Colors.deepPurple, 10));
    items.add(new ListBean("娃哈哈", "12346", Colors.deepPurple, 10));
    items.add(new ListBean("娃哈哈", "12346", Colors.deepPurple, 10));
    items.add(new ListBean("娃哈哈", "12346", Colors.deepPurple, 10));
    items.add(new ListBean("娃哈哈", "12346", Colors.deepPurple, 10));
    items.add(new ListBean("娃哈哈", "12346", Colors.deepPurple, 10));
    items.add(new ListBean("娃哈哈", "12346", Colors.deepPurple, 10));
    items.add(new ListBean("娃哈哈", "12346", Colors.deepPurple, 10));
    items.add(new ListBean("娃哈哈", "12346", Colors.deepPurple, 10));
    items.add(new ListBean("娃哈哈", "12346", Colors.deepPurple, 10));

    Future<Null> aa() {
      print("刷新了");
    }
    listItemClick(int index){

    setState(() {
      items.elementAt(index).txtColor = Colors.red;
    });
    }


    return Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
          leading: FlatButton(
              child: Image.network(
                backUrl,
                width: 50,
                height: 50,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
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
                                softWrap: true,
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
                              width: double.infinity,
                              child: Row(
                                children: <Widget>[
                                  new Image.network(
                                    photoUrl,
                                    width: 60,
                                    height: 60,
                                  ),
                                  new Container(
                                      width: 250,
                                      alignment: Alignment.topLeft,
                                      child: GestureDetector(
                                        onTap: () {listItemClick(index);},
                                        child: new Text(
                                          items.elementAt(index).getName,
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: items
                                                .elementAt(index)
                                                .getTxtSize,
                                            color: items
                                                .elementAt(index)
                                                .getTxtColor,
                                          ),
                                        ),
                                      ))
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
        }));
  }
}
