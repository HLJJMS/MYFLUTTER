/* MARK: extended_nested_scroll_view
 * @Description: 类描述
 * @Author: 郑群昌
 * @Date: 2019-12-05 09:55:11
 * @Version: 版本号, YYYY-MM-DD
 * @LastEditors: 郑群昌
 * @LastEditTime: 2019-12-05 13:34:58
 * @Deprecated: 否 
 * @备注：pull_to_refresh_notification 刷新视图适用于 SliverToBoxAdapter 和 sliverAppBar 
 */
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';

import 'dart:math';
import 'normalList.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extended;
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
//import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart';
import 'package:pull_to_refresh_notification/pull_to_refresh_notification.dart'
    as prefix0;

class ExtenedNestedScrollView extends StatefulWidget {
  @override
  _ExtenedNestedScrollViewState createState() =>
      _ExtenedNestedScrollViewState();
}

class _ExtenedNestedScrollViewState extends State<ExtenedNestedScrollView>
    with TickerProviderStateMixin {
  TabController primaryTC;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  var pinnedHeaderHeight;
  var primaryTabBar;
  SliverPersistentHeader sliverImage;
  double sliverImageMinHeight = 50.0;
  double sliverImageMaxHeight = 200.0;
  @override
  void initState() {
    primaryTC = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    primaryTabBar = _buildTabber();
    var tabBarHeight = primaryTabBar.preferredSize.height;
    sliverImage = _buildImageBar();
    var sliverImageHeight = sliverImageMaxHeight;
    pinnedHeaderHeight =
        //statusBar height
        statusBarHeight +
            //pinned SliverAppBar height in header
            kToolbarHeight +
            //pinned tabbar height in header
            tabBarHeight +
            sliverImageHeight;

    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        //body: _buildNestedScrollView(),
        //body: _buildNestedScrollViewRefreshIndicator(),
        body: _buildPullToRefreshNotification(),
      ),
    );
  }

  /* MARK: 刷新组件  pullToRefreshNotification  
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildPullToRefreshNotification() {
    return PullToRefreshNotification(
      color: Colors.blue,
      pullBackOnRefresh: true,
      onRefresh: _pullToRefreshNotificationOnRefresh,
      maxDragOffset: 100.0,
      child: _buildNestedScrollView(),
    );
  }

  Future<bool> _pullToRefreshNotificationOnRefresh() async {
    print("onRefresh");
    // if (primaryTC.index == 0) {
    //   return await listSourceRepository.refresh(false);
    // } else if (primaryTC.index == 1) {
    //   listSourceRepository2.clear();
    //   return await listSourceRepository1.refresh(true);
    // } else if (primaryTC.index == 2) {
    //   return await listSourceRepository3.refresh(true);
    // }
    return true;
  }

  /* MARK: extended.NestedScrollView 扩展的 flutter自带刷新
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildNestedScrollViewRefreshIndicator() {
    return NestedScrollViewRefreshIndicator(
      onRefresh: () async {},
      child: _buildNestedScrollView(),
    );
  }

  /* MARK: 主视图extended.NestedScrollView
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildNestedScrollView() {
    return extended.NestedScrollView(
      physics: ClampingScrollPhysics(),
      pinnedHeaderSliverHeightBuilder: () {
        return pinnedHeaderHeight;
      },
      innerScrollPositionKeyBuilder: () {
        var indexHeader = "Tab";
        return Key(indexHeader + primaryTC.index.toString());
      },
      headerSliverBuilder: (c, f) {
        var widgets = <Widget>[];
        // pull_to_refresh_notification 的 sliverAppBar
        widgets.add(PullToRefreshContainer(builderAppbar));
        //其他刷新或者不需要刷新时用的普通 sliverAppBar
        //widgets.add(_buildSliverAppBar());
        widgets.add(_buildImageBar());
        widgets.add(SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: _SliverAppBarDelegate(
              minHeight: primaryTabBar.preferredSize.height, //收起的高度
              maxHeight: primaryTabBar.preferredSize.height, //展开��最大高度
              child: Container(
                child: primaryTabBar,
                //color: Colors.white,
              ),
            )));

        return widgets;
      },
      body: _buildTabViews(),
    );
  }

  /* MARK: PullToRefreshScrollNotificationInfo 加载 sliverAppBar
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否   RefreshIndicatorMode.error
   */
  Widget builderAppbar(PullToRefreshScrollNotificationInfo info) {
    Widget action = Padding(
      child: info?.refreshWiget ?? Icon(Icons.more_horiz),
      padding: EdgeInsets.all(15.0),
    );
    var offset = info?.dragOffset ?? 0.0;
    Widget child = Container();
    if (info != null) {
      if (info.mode == prefix0.RefreshIndicatorMode.error) {
        child = GestureDetector(
          onTap: () {
            // refreshNotification;
            info?.pullToRefreshNotificationState?.show();
          },
          child: Text(
            (info.mode?.toString() ?? "") + "  click to retry" ?? "",
            style: TextStyle(fontSize: 10.0),
          ),
        );
        action = Container();
      } else {
        child = Text(
          info?.mode?.toString() ?? "",
          style: TextStyle(fontSize: 10.0),
        );
        action = Padding(
          child: info?.refreshWiget ?? Icon(Icons.more_horiz),
          padding: EdgeInsets.all(15.0),
        );
      }
    }

    return SliverAppBar(
      pinned: true,
      floating: true,
      title: Text('ExtenedNestedScrollView'),
      leading: IconButton(
        icon: ImageIcon(new AssetImage('assets/image/nav_back.png')),
        onPressed: () {
          Navigator.pop(this.context);
        },
      ),
      centerTitle: true,
      expandedHeight: 200.0 + offset,
      actions: <Widget>[action],
      flexibleSpace: FlexibleSpaceBar(
        //centerTitle: true,
        title: child,
        collapseMode: CollapseMode
            .pin, // 背景 固定到位，直到达到最小范围。 默认是CollapseMode.parallax(将以视差方式滚动。)，还有一个是none，滚动没有效果
        background: Image.network(
          'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1246190829,2813517358&fm=11&gp=0.jpg',
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
      //bottom: _buildTabber(),
    );
  }

  /* MARK: sliverAppBar
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildSliverAppBar() {
    return SliverAppBar(
      title: Text('ExtenedNestedScrollView'),
      leading: IconButton(
        icon: ImageIcon(new AssetImage('assets/image/nav_back.png')),
        onPressed: () {
          Navigator.pop(this.context);
        },
      ),
      backgroundColor: Theme.of(context).accentColor,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1246190829,2813517358&fm=11&gp=0.jpg',
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
      //floating: true,
      //snap: true,
      pinned: true,
      //bottom: _appBarBottomPagebar(),
    );
  }

  /* MARK: 可伸缩imageBar
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildImageBar() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: false,
      delegate: _SliverAppBarDelegate(
          minHeight: sliverImageMinHeight, //收起的高度
          maxHeight: sliverImageMaxHeight, //展开的最大高度
          child: Container(
              width: double.infinity,
              height: 200.0,
              color: Colors.cyan,
              //alignment: Alignment.centerLeft,
              child: Image.network(
                'http://pics1.baidu.com/feed/9f510fb30f2442a7641f95b92eda624ed113023c.jpeg?token=855b3cfe18c564a5242aecd3ab5ff613&s=900D9F50808B8F07661058B0030070F0',
                height: double.infinity,
                fit: BoxFit.fill,
              ))),
    );
  }

  /* MARK: Tabber
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  TabBar _buildTabber() {
    return new TabBar(
      controller: primaryTC,
      labelColor: Colors.blue,
      indicatorColor: Colors.blue,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 2.0,
      isScrollable: false,
      unselectedLabelColor: Colors.grey,
      tabs: [
        Tab(text: "Tab0"),
        Tab(text: "Tab1"),
        Tab(text: "Tab2"),
      ],
    );
  }

  /* MARK: tabviews
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildTabViews() {
    return TabBarView(
      controller: this.primaryTC,
      children: <Widget>[
        new extended.NestedScrollViewInnerScrollPositionKeyWidget(
          Key("Tab0"),
          new NormalListView(
            pageIndex: 0,
          ),
        ),
        new extended.NestedScrollViewInnerScrollPositionKeyWidget(
          Key("Tab1"),
          new NormalListView(
            pageIndex: 1,
          ),
        ),
        new extended.NestedScrollViewInnerScrollPositionKeyWidget(
          Key("Tab2"),
          new NormalListView(
            pageIndex: 2,
          ),
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
