import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

typedef _ListOfHeadBannerUrls = List<String> Function(BuildContext context);
typedef _NumberOfListItems = int Function(BuildContext context);
typedef _HeaderBannerItemWidgetOfListBuilder = Widget Function(
    BuildContext context, int position);
typedef _ItemWidgetOfListBuilder = Widget Function(
    BuildContext context, int position);
typedef _RefreshOfListBuilder = Widget Function(
    BuildContext context, ListView listView);

// ignore: must_be_immutable
class ListWithHeadBannerPage extends StatefulWidget {
  /// banner地址数组
  _ListOfHeadBannerUrls headerBannerList;

  /// banner底部数据项个数
  _NumberOfListItems listItemsCount;

  /// banner底部数据项构建方法
  _ItemWidgetOfListBuilder itemWidgetCreator;

  /// banner项构建方法
  _HeaderBannerItemWidgetOfListBuilder headBannerItemWidgetCreator;

  /// 刷新构建方法
  _RefreshOfListBuilder refreshOfListBuilder;
  ListWithHeadBannerPage(
      {this.headerBannerList,
      this.listItemsCount,
      this.itemWidgetCreator,
      this.headBannerItemWidgetCreator,
      this.refreshOfListBuilder});

  @override
  _ListWithHeadBannerPageState createState() => _ListWithHeadBannerPageState();
}

class _ListWithHeadBannerPageState extends State<ListWithHeadBannerPage> {
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(this);
  }

  @override
  Widget build(BuildContext context) {
    return getBodyWidget();
  }

  Widget getBodyWidget() {
    if (widget.refreshOfListBuilder != null) {
      return widget.refreshOfListBuilder(context, _getListView());
    } else {
      return Container(
        child: _getListView(),
      );
    }
  }

  /// 创建listview
  Widget _getListView() {
    return ListView.builder(
        itemBuilder: (BuildContext context, int position) {
          return buildItemWidget(context, position);
        },
        itemCount: _getListCount());
  }

  /// 获取数据项个数
  int _getListCount() {
    if (widget.headerBannerList == null ||
        widget.headerBannerList(context).length == 0) {
      if (widget.listItemsCount == null) {
        return 0;
      } else {
        return widget.listItemsCount(context);
      }
    } else {
      if (widget.listItemsCount == null) {
        return 1;
      } else {
        return widget.listItemsCount(context) + 1;
      }
    }
  }

  Widget buildItemWidget(BuildContext context, int index) {
    if (widget.headerBannerList == null ||
        widget.headerBannerList(context).length == 0) {
      return _itemBuildWidget(context, index);
    } else {
      if (index == 0) {
        return _headerItemWidget(context, index);
      } else {
        int pos = index - 1;
        return _itemBuildWidget(context, pos);
      }
    }
  }

  /// 创建banner控件
  Widget _headerItemWidget(BuildContext context, int index) {
    if (widget.headBannerItemWidgetCreator != null) {
      print(widget.headBannerItemWidgetCreator);
      print(widget.headerBannerList(context).length);
      return Container(
        color: Colors.white,
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: NotificationListener(
          onNotification: (ScrollNotification notification) {
            return true;
          },
          child: Swiper(
            itemBuilder: widget.headBannerItemWidgetCreator,
            itemCount: widget.headerBannerList(context).length,
            autoplay: true,
            duration: 300,
            index: 0,
            pagination: SwiperPagination(),
          ),
        ),
      );
    } else {
      return GestureDetector(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("未传入headBannerItemWidgetCreator方法")),
        onTap: () {
          print('未传入headBannerItemWidgetCreator方法');
        },
      );
    }
  }

  /// 创建item 每一项
  Widget _itemBuildWidget(BuildContext context, int index) {
    if (widget.itemWidgetCreator != null) {
      return widget.itemWidgetCreator(context, index);
    } else {
      return GestureDetector(
        child: Padding(
            padding: EdgeInsets.all(10.0),
            child: new Text("未传入itemWidgetCreator方法 $index")),
        onTap: () {
          print('click $index ---------未传入itemWidgetCreator方法-----------');
        },
      );
    }
  }
}
