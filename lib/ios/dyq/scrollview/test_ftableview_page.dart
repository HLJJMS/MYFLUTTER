import 'package:flutter/material.dart';
import 'f_table_view_page.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_swiper/flutter_swiper.dart';


class TestFtableviewPage extends StatefulWidget {
  TestFtableviewPage({Key key}) : super(key: key);

  @override
  _TestFtableviewPageState createState() => _TestFtableviewPageState();
}

class _TestFtableviewPageState extends State<TestFtableviewPage> {

  List<dynamic> bannerlist = [];
  List<dynamic> goodslist = [];
  EasyRefreshController _controller = EasyRefreshController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('测试自定义tableview'),),
      body: FTableViewPage(
        numberOfSections: _numberOfSections,
        numberOfRowsInSections: _numberOfRowsInSections,
        cellForRowAtFIndexPath: _cellForRowAtFIndexPath,
        viewForHeaderInSection: _viewForHeaderInSection,
        viewForFooterInSection: _viewForFooterInSection,
        heightForRowAtFIndexPath: _heightForRowAtFIndexPath,
        heightForHeaderInSection: _heightForHeaderInSection,
        heightForFooterInSection: _heightForFooterInSection,
        refreshOfFTableViewBuilder: _refreshOfFTableViewBuilder,
      ),
    );
  }



  int _numberOfSections(BuildContext context){
    return 2;
  }

  int _numberOfRowsInSections(BuildContext context,int section){
    if (section == 0){
      return 1;
    }
    return 5;
  }

  Widget _cellForRowAtFIndexPath(BuildContext context,FIndexPath fIndexPath){
    if (fIndexPath.section == 0){
      return Container(
        color: Colors.white,
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: NotificationListener(
          onNotification: (ScrollNotification notification) {
            return true;
          },
          child: Swiper(
            itemBuilder: _headBannerItemWidgetCreator,
            itemCount: bannerlist.length,
            autoplay: true,
            duration: 300,
            index: 0,
            pagination: SwiperPagination(),
          ),
        ),
      );
    }
    return Container(
      color: (fIndexPath.row % 2 == 0) ? Colors.red:Colors.orange,
      child: Center(
        child: Text('我是第${fIndexPath.row}行'),
      ),
    );
  }

  Widget _viewForHeaderInSection(BuildContext context,int section){
    return Container(
      color: Colors.purple,
      child: Center(child: Text('我是第$section组header'),),
    );
  }

  Widget _viewForFooterInSection(BuildContext context,int section){
    return Container(
      color: Colors.green,
      child: Center(child: Text('我是第$section组Footer'),),
    );
  }

  double _heightForRowAtFIndexPath(BuildContext context,FIndexPath fIndexPath){

    print(fIndexPath.row % 2);
    if (fIndexPath.section == 0){
      return 150;
    }else{
      return 55;
    }
  }

  double _heightForHeaderInSection(BuildContext context,int section){
    return 60;
  }

  double _heightForFooterInSection(BuildContext context,int section){
    return 33;
  }



  Widget _refreshOfFTableViewBuilder(BuildContext context, ListView listView) {
    return EasyRefresh(
      enableControlFinishRefresh: true,
//      emptyWidget: (bannerlist.length == 0 || goodslist.length == 0) ? Center(child: Text('.....没有数据......'),):null,
      controller: _controller,
      onRefresh: _loadData,

      firstRefresh: true,
      firstRefreshWidget: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(child: Text('正在加载中...........'),),
      ),
      child: listView,
    );
  }



  Widget _headBannerItemWidgetCreator(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        print('点击顶部广告,图片地址为:${bannerlist[index]['name']}');
      },
      child: Image.network(
        bannerlist[index]['thumb'],
        fit: BoxFit.fill,
      ),
    );
  }



  /// 网络请求
  Future _loadData() async {
    Response response;
    response =
    await Dio().get("https://xffqshopapi.yinduoziben.net/api/index/index");
    final body = json.decode(response.toString());
    print(body['banner_list']);
    print(body['hot_goods_list']);

    _controller.finishRefresh();
    setState(() {
      bannerlist = body['banner_list'];
      goodslist = body['hot_goods_list'];
    });
  }

}