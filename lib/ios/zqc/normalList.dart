/* MARK: listview
 * @Description: 类描述
 * @Author: 郑群昌
 * @Date: 2019-12-02 13:58:54
 * @Version: 版本号, YYYY-MM-DD
 * @LastEditors: 郑群昌
 * @LastEditTime: 2019-12-04 09:15:29
 * @Deprecated: 否
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NormalListView extends StatefulWidget {
  final pageIndex;
  final PageStorageKey pageKey;
  NormalListView({Key key, this.pageIndex, this.pageKey});

  @override
  _NormalListviewState createState() =>
      _NormalListviewState(pageIndex: this.pageIndex, pageKey: pageKey);
}

class _NormalListviewState extends State<NormalListView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final pageIndex;
  final PageStorageKey pageKey;
  _NormalListviewState({Key key, this.pageIndex, this.pageKey});

  ScrollController _normalListController = ScrollController(
    initialScrollOffset: 0.0, //初始滚动位置
    keepScrollOffset: false, //是否保存滚动位置
  );
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void dispose() {
    //_normalListController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //return _listview();
    //return _listViewWithEsayRefresh();
    return _listViewWithPullToRefresh();
  }

  /* MARK: _listview
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _listview() {
    return ListView.builder(
      key: this.pageKey,
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      //设置physics属性总是可滚动
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: 30,
      controller: _normalListController,
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text('这是个list$pageIndex  $index'));
      },
    );
  }

  /* MARK: _listView加刷新组件EsayRefresh
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  // Widget _listViewWithEsayRefresh() {
  //   return EasyRefresh(
  //       child: _listview(),
  //       onRefresh: () async {
  //         print('1111');
  //       },
  //       onLoad: () async {
  //         print('2222');
  //       });
  // }
  /* MARK: _listView加刷新组件 pull_to_refresh
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _listViewWithPullToRefresh() {
    return SmartRefresher(
      //key: this.pageKey,
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text("pull up load");
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("release to load more");
          } else {
            body = Text("No more Data");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: _listview(),
    );
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    // if(mounted)
    // setState(() {

    // });
    _refreshController.loadComplete();
  }
}
