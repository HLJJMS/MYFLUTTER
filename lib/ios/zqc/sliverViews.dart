/* MARK: sliver控件
 * @Description: 类描述
 * @Author: 郑群昌
 * @Date: 2019-12-16 09:51:59
 * @Version: 版本号, YYYY-MM-DD
 * @LastEditors: 郑群昌
 * @LastEditTime: 2019-12-16 14:40:59
 * @Deprecated: 否
 * @坑: tabbar封装后
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'pageBarAndViewZqc.dart';
import 'tabBarAndTabViews.dart';
import 'dart:math';
/* MARK: sliverAppBar
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */

class ZQCSliverHeader extends StatelessWidget {
  //tabBarAndTabViews 使用
  final tabController;
  //自用
  final ValueChanged<int> popBack;
  final titleStr;
  //pageBarAndViewZqc 使用
  final selectPage;
  final pageController;
  final ValueChanged<int> onChanged;
  ZQCSliverHeader({
    Key key,
    this.titleStr,
    this.popBack,
    this.onChanged,
    this.selectPage,
    this.pageController,
    this.tabController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _buildSliverAppBar();
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      title: Text(this.titleStr),
      leading: IconButton(
        icon: ImageIcon(new AssetImage('assets/image/nav_back.png')),
        onPressed: () {
          popBack(1);
        },
      ),
      backgroundColor: Colors.blue,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1246190829,2813517358&fm=11&gp=0.jpg',
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
      // floating: floating,
      // snap: snap,
      pinned: true,

      //bottom: _appBarBottomPagebar(),
      bottom: _appBarBottomTabbar(),

      // bottom: ZQCTabBar(
      //   tabController: this.tabController,
      // ),

      // bottom: TabBar(
      //   labelColor: Colors.black,
      //   controller: this.tabController,
      //   tabs: <Widget>[
      //     Tab(text: '第一页'),
      //     Tab(text: '第二页'),
      //     Tab(text: '第三页'),
      //   ],
      // ),
    );
  }

  //tabbar 用作bottom
  Widget _appBarBottomTabbar() {
    return PreferredSize(
      child: ZQCTabBar(
        tabController: this.tabController,
      ),
      preferredSize: Size.fromHeight(48.0),
    );
    // return ZQCTabBar(
    //   tabController: this.tabController,
    // );
  }

  //pagebar 用作bottom
  Widget _appBarBottomPagebar() {
    return PreferredSize(
      child: ZQCPageBar(
        selectPage: selectPage,
        pageController: pageController,
        onChanged: (index) {
          onChanged(index);
        },
      ),
      preferredSize: Size.fromHeight(48.0),
    );
  }
}
/* MARK: SliverToBoxAdapter
 * @LastEditors: 郑群昌
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */

class ZQCSliverBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildBanner();
  }

  Widget _buildBanner() {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        height: 100,
        child: Image.network(
          'http://pics1.baidu.com/feed/9f510fb30f2442a7641f95b92eda624ed113023c.jpeg?token=855b3cfe18c564a5242aecd3ab5ff613&s=900D9F50808B8F07661058B0030070F0',
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

/* MARK: 可伸缩imageBar
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
class ZQCSliverImageBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildImageBar();
  }

  Widget _buildImageBar() {
    return SliverPersistentHeader(
      pinned: true, //是否固定在顶部
      floating: false,
      delegate: SliverAppBarDelegate(
          minHeight: 100, //收起的高度
          maxHeight: 200, //展开的最大高度
          child: Container(
              width: double.infinity,
              height: 200.0,
              color: Colors.cyan,
              alignment: Alignment.centerLeft,
              child: Image.network(
                'http://pics1.baidu.com/feed/9f510fb30f2442a7641f95b92eda624ed113023c.jpeg?token=855b3cfe18c564a5242aecd3ab5ff613&s=900D9F50808B8F07661058B0030070F0',
                height: double.infinity,
                fit: BoxFit.fill,
              ))),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
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
    return child;
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
