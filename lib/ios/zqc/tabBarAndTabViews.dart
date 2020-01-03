import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'normalList.dart';

class ZQCTabBar extends StatelessWidget {
  final tabController;
  ZQCTabBar({
    Key key,
    this.tabController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.black,
      controller: this.tabController,
      tabs: <Widget>[
        Tab(text: '第一页'),
        Tab(text: '第二页'),
        Tab(text: '第三页'),
      ],
    );
  }
}

class ZQCTabView extends StatelessWidget {
  final tabController;
  ZQCTabView({
    Key key,
    this.tabController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _buildTabViews();
  }

  Widget _buildTabViews() {
    return SliverFillRemaining(
      child: TabBarView(
        controller: this.tabController,
        children: <Widget>[
          NormalListView(
            pageKey: PageStorageKey('pagekey0'),
            pageIndex: 0,
          ),
          NormalListView(
            pageKey: PageStorageKey('pagekey1'),
            pageIndex: 1,
          ),
          NormalListView(
            pageKey: PageStorageKey('pagekey2'),
            pageIndex: 2,
          ),
          // Container(
          //   key: PageStorageKey('pagekey0'),
          //   child: NormalListView(
          //     pageIndex: 0,
          //   ),
          // ),
          // Container(
          //   key: PageStorageKey('pagekey1'),
          //   child: NormalListView(
          //     pageIndex: 1,
          //   ),
          // ),
          // Container(
          //   key: PageStorageKey('pagekey2'),
          //   child: NormalListView(
          //     pageIndex: 2,
          //   ),
          // ),
        ],
      ),
    );
  }
}
