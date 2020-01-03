import 'dart:convert';

import 'package:flutter/material.dart';
import 'list_with_head_banner_page.dart';
import '../../../util/httpUtil.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class WithBannerList extends StatefulWidget {
  WithBannerList({Key key}) : super(key: key);

  @override
  _WithBannerListState createState() => _WithBannerListState();
}

class _WithBannerListState extends State<WithBannerList> {
  List<dynamic> bannerlist = [];
  List<dynamic> goodslist = [];
  EasyRefreshController _controller = EasyRefreshController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('带banner的listview'),
      ),
      body: ListWithHeadBannerPage(
        headerBannerList: _getBannerUrls,
        listItemsCount: _getItemListCount,
        itemWidgetCreator: _itemWidgetCreator,
        headBannerItemWidgetCreator: _headBannerItemWidgetCreator,
        refreshOfListBuilder: _refreshOfListBuilder,
      ),
    );
  }

  Widget _refreshOfListBuilder(BuildContext context, ListView listView) {
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

  Widget _itemWidgetCreator(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text("${goodslist[index]['name']}"),
    );
  }

  /// 获取banner图片地址数组
  List<String> _getBannerUrls(BuildContext context) {
    List<String> bannerUrls = [];
    for (var banner in bannerlist) {
      bannerUrls.add(banner['thumb']);
    }
//    print(bannerUrls);
    return bannerUrls;
  }

  int _getItemListCount(BuildContext context) {
    return goodslist.length;
  }

  /// 网络请求
  Future _loadData() async {
    Response response;
    response =
        await Dio().get("https://xffqshopapi.yinduoziben.net/api/index/index");
    final body = json.decode(response.toString());
    print(body['banner_list']);
    print(body['hot_goods_list']);
    setState(() {
      bannerlist = body['banner_list'];
      goodslist = body['hot_goods_list'];

      _controller.finishRefresh();
    });
  }
}
