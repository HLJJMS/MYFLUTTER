/* MARK: NestedScrollView
 * @Description: 类描述
 * @Author: 郑群昌
 * @Date: 2019-12-02 08:43:05
 * @Version: 版本号, YYYY-MM-DD
 * @LastEditors: 郑群昌
 * @LastEditTime: 2019-12-02 13:49:26
 * @Deprecated: 否
 * @坑: 1 NestedScrollView 套用 SliverAppBar + 自定义选择器 + pageview 时，pageview内容位置下移  listview padding设为0 解决
 *      2 NestedScrollView 最外层套用 flutter原生下拉刷新、pull_to_refresh、flutter_easyrefresh均无效
 */

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'normalList.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'sliverViews.dart';
import 'pageBarAndViewZqc.dart';
import 'tabBarAndTabViews.dart';
import 'nestedScrollViewTestZqc.dart';

class ZqcTabbarView extends StatefulWidget {
  // This class is the configuration for the state. It holds the
  // values (in this nothing) provided by the parent and used by the build
  // method of the State. Fields in a Widget subclass are always marked "final".

  @override
  ZqcTabbarViewState createState() => new ZqcTabbarViewState();
}

class ZqcTabbarViewState extends State<ZqcTabbarView>
    with SingleTickerProviderStateMixin {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  TabController tabController;
  List array = List();
  //ScrollController _scrollController = ScrollController(); //listview的控制器
  //bool isLoading = false; //是否正在加载数据

  int _selectPage = 0;
  var _pageController = new PageController(initialPage: 0);
  List _pages = [
    new NormalListView(
      pageIndex: 0,
    ),
    new NormalListView(
      pageIndex: 1,
    ),
    new NormalListView(
      pageIndex: 2,
    ),
  ];

  double lineCenter = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      print(_pageController.offset);
      lineCenter = _pageController.offset / 5;
      setState(() {});
    });
    this.tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        // appBar: new AppBar(
        //   title: new Text('NestedScrollView'),
        //   leading: IconButton(
        //     icon: ImageIcon(new AssetImage('assets/image/nav_back.png')),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        // ),

        // body: RefreshIndicator(
        //   onRefresh: _onRefresh,
        //   child: _buildCustomScrollView(),
        // ),

        body: _buildNestedScrollView(),
        //body: _buildNestedScrollViewWithTab(),
      ),
    );
  }

  Widget _buildNestedScrollViewWithTab() {
    return NestedScrollDemoPage();
  }

  /* MARK: 主视图
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildNestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: (context, isscrolled) {
        return [
          _buildSliverAppBar(context),
          _buildBanner(),
          _buildSliverPageBar(),
          _buildImageBar(),
          //_buildTabbar(),
        ];
      },
      body: _buildMainPageView(),
      //body: _buildTabViews(),
    );
  }

  /* MARK: sliverAppBar
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildSliverAppBar(BuildContext context) {
    return SliverOverlapAbsorber(
      //一个 sliver 部件，用于把部件重叠的高度反馈给 SliverOverlapAbsorberHandle，
      //而且指明了 handle 不能空，可以通过 NestedScrollView 的
      //sliverOverlapAbsorberHandleFor 方法来赋值，并且 child 必须是个 sliver 部件，

      // 传入 handle 值，直接通过 `sliverOverlapAbsorberHandleFor` 获取即可
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      child: ZQCSliverHeader(
        tabController: this.tabController,
        selectPage: _selectPage,
        pageController: _pageController,
        onChanged: (index) {
          _onPageChanged(index);
        },
        titleStr: 'NestedScrollView',
        popBack: (index) {
          Navigator.pop(this.context);
        },
      ),
    );
  }

  /* MARK: 顶部banner
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildBanner() {
    return ZQCSliverBanner();
  }

  /* MARK: 翻页选择器 吸顶
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildSliverPageBar() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: false,
      delegate: SliverAppBarDelegate(
        minHeight: 50, //收起的高度
        maxHeight: 50, //展开的最大高度
        child: _buildPageBar(),
      ),
    );
  }

  Widget _buildPageBar() {
    return ZQCPageBar(
      selectPage: _selectPage,
      pageController: _pageController,
      onChanged: (index) {
        _onPageChanged(index);
      },
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
    return ZQCSliverImageBar();
  }

  /* MARK: 主体pageview
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildMainPageView() {
    return ZQCPageView(
      pageViewType: PageViewType.typeNomal,
      selectPage: _selectPage,
      pageController: _pageController,
      pages: _pages,
      onChanged: (index) {
        _onPageChanged(index);
      },
    );
  }

  void _onPageChanged(index) {
    setState(() {
      _selectPage = index;
    });
  }
}
