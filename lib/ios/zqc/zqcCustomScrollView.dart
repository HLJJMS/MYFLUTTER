/* MARK: CustomScrollView
 * @Description: 类描述
 * @Author: 郑群昌
 * @Date: 2019-12-03 15:46:07
 * @Version: 版本号, YYYY-MM-DD
 * @LastEditors: 郑群昌
 * @LastEditTime: 2019-12-04 10:44:49
 * @Deprecated: 否
 * @ps:  1 customScrollView 只能添加 sliver家族组件
 *       2 customScrollView + SliverAppBar + SliverToBoxAdapter + TabBar(SliverPersistentHeader嵌套) + tabarview，tabbarview内使用listview时，listview滑动时向上错位
 *       3 customScrollView + SliverAppBar + SliverToBoxAdapter + 自定义选择器 + pageview,pageview内使用listview时，listview滑动时向上错位，
 */
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'normalList.dart';
import 'sliverViews.dart';
import 'pageBarAndViewZqc.dart';
import 'tabBarAndTabViews.dart';

class ZqcCustomScrollView extends StatefulWidget {
  // This class is the configuration for the state. It holds the
  // values (in this nothing) provided by the parent and used by the build
  // method of the State. Fields in a Widget subclass are always marked "final".

  @override
  ZqcCustomScrollViewState createState() => new ZqcCustomScrollViewState();
}

class ZqcCustomScrollViewState extends State<ZqcCustomScrollView>
    with SingleTickerProviderStateMixin {
  TabController tabController;

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

  @override
  void initState() {
    super.initState();
    this.tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        // appBar: new AppBar(
        //   title: new Text('CustomScrollView'),
        //   leading: IconButton(
        //     icon: ImageIcon(new AssetImage('assets/image/nav_back.png')),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        //   //bottom: _appBarBottomPagebar(),
        // ),

        body: _buildCustom(),
        // body: EasyRefresh(
        //   child: _buildCustom(),
        //   onRefresh: () async {},
        //   onLoad: () async {},
        // ),
      ),
    );
  }

  Widget _buildCustom() {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverAppBar(),
        //_buildBanner(),
        //_buildSliverTabbar(),
        //_buildImageBar(),
        _buildTabViews(),
        //_buildSliverPageBar(),
        //_buildPageView(),
      ],
    );
  }

  /* MARK: SliverAppBar
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildSliverAppBar() {
    return ZQCSliverHeader(
      tabController: this.tabController,
      selectPage: _selectPage,
      pageController: _pageController,
      onChanged: (index) {
        _onPageChanged(index);
      },
      titleStr: 'CustomScrollView',
      popBack: (index) {
        Navigator.pop(this.context);
      },
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

  /* MARK: tabbar
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildSliverTabbar() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 50, //收起的高度
        maxHeight: 100, //展开的最大高度
        child: _buildTabbar(),
      ),
    );
  }

  Widget _buildTabbar() {
    return ZQCTabBar(
      tabController: this.tabController,
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
    return ZQCTabView(
      tabController: this.tabController,
    );
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

  /* MARK: pageView
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildPageView() {
    return ZQCPageView(
      pageViewType: PageViewType.typeWithRemaining,
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
