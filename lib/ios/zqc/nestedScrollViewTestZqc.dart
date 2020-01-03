import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NestedScrollDemoPage extends StatelessWidget {
  final _tabs = <String>['TabA', 'TabB'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: _tabs.length,
          child: NestedScrollView(
              headerSliverBuilder: (context, innerScrolled) => <Widget>[
                    SliverOverlapAbsorber(
                      // 传入 handle 值，直接通过 `sliverOverlapAbsorberHandleFor` 获取即可
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                      child: SliverAppBar(
                        pinned: true,
                        title: Text('NestedScroll Demo'),
                        expandedHeight: 200.0,
                        flexibleSpace: FlexibleSpaceBar(
                            background: Image.network(
                          'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1246190829,2813517358&fm=11&gp=0.jpg',
                          height: double.infinity,
                          fit: BoxFit.fill,
                        )),
                        bottom: TabBar(
                            tabs: _tabs
                                .map((tab) =>
                                    Text(tab, style: TextStyle(fontSize: 18.0)))
                                .toList()),
                        forceElevated: innerScrolled,
                      ),
                    )
                  ],
              body: TabBarView(
                  children: _tabs
                      // 这边需要通过 Builder 来创建 TabBarView 的内容，否则会报错
                      // NestedScrollView.sliverOverlapAbsorberHandleFor must be called with a context that contains a NestedScrollView.
                      .map((tab) => Builder(
                            builder: (context) => CustomScrollView(
                              // key 保证唯一性
                              key: PageStorageKey<String>(tab),
                              slivers: <Widget>[
                                // 将子部件同 `SliverAppBar` 重叠部分顶出来，否则会被遮挡
                                SliverOverlapInjector(
                                    handle: NestedScrollView
                                        .sliverOverlapAbsorberHandleFor(
                                            context)),
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      return Container(
                                        child: Text('$tab - item${index + 1}',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                            )),
                                      );
                                    },
                                    childCount: 40,
                                  ),
                                )
                              ],
                            ),
                          ))
                      .toList()))),
    );
  }
}
