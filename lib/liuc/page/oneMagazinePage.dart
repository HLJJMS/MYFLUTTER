import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/component/weatherWidget.dart';
import 'package:flutter_app/liuc/model/OneModel.dart';
import 'package:flutter_app/liuc/service/newsService.dart';
import 'package:provider/provider.dart';

class OneMagazinePage extends StatefulWidget {
  final String id;
  OneMagazinePage(this.id);

  @override
  State<StatefulWidget> createState() {
    return _OneMagazinePage(id);
  }
}

class _OneMagazinePage extends State<OneMagazinePage> {
  final String id;
  _OneMagazinePage(this.id);
  // 新闻services
  // NewsService newsService;
  // 新闻信息
  OneModel oneModel;

  @override
  initState() {
    super.initState();
    // newsService = NewsService();
    oneModel = OneModel();
    // 加载数据
    getData();
  }

  /* MARK: 加载接口数据
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-11-24
   * @param {void} 
   * @return: void
   * @Deprecated: 否
   */
  getData() async {
    // 加载新闻列表数据
    var res = await NewsService.queryOneMagazineList(this.context);
    setState(() {
      this.oneModel = res;
    });
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ONE一个杂志id:$id"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            WeatherWidget(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 1),
            ),
            Image(
              image: NetworkImage(oneModel.imgurl),
            ),
            Text(oneModel.wordfrom),
            Text(oneModel.word),
            Text(oneModel.imgauthor),
            Text(oneModel.date)
          ],
        ),
      ),
    );
  }
}
