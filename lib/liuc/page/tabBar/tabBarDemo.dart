import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/component/fixTabBarView.dart';
import 'package:flutter_app/liuc/page/tabBar/tabFhirdScreen.dart';
import 'package:flutter_app/liuc/page/tabBar/tabFirstScreen.dart';
import 'package:flutter_app/liuc/page/tabBar/tabFourthScreen.dart';
import 'package:flutter_app/liuc/page/tabBar/tabScondScreen.dart';

class TabBarDemoScreen extends StatefulWidget {
  TabBarDemoScreen({Key key}) : super(key: key);

  @override
  _TabBarDemoScreenState createState() => _TabBarDemoScreenState();
}

class _TabBarDemoScreenState extends State<TabBarDemoScreen>
    with SingleTickerProviderStateMixin {
  int tabIndex = 0;
  // tabbar 标题
  List<String> _tabs = ['首页', '发现', '我的', '设置'];
  // tabbar关联的页面
  List<Widget> _pages = [
    TabFirstScreen(),
    TabScondScreen(),
    TabFhirdScreen(),
    TabFourthScreen()
  ];
  // tabBar和TabBarView 正是通过同一个controller来实现菜单切换和滑动状态同步的
  TabController _tabController;
  // 页面控制器
  PageController _pageController;

  @override
  void initState() {
    debugPrint("tabBarDemo initState....");
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    // 添加监听事件
    _tabController.addListener(() => _onTabChanged());
    _pageController = PageController();
  }

  _onTabChanged() {
    // 显示页面是否发生改变
    if (_tabController.indexIsChanging) {
      // 对tabbar滑块动画监听
      _tabController.animation.addStatusListener((status) {
        // 如果滑块完成动画
        if (status == AnimationStatus.completed) {
          setState(() {
            // 修改tabbar文字大小
            tabIndex = _tabController.index;
          });
        }
      });
      // if (this.mounted) {
      //   debugPrint("onTabChanged:::${_tabController.index}");
      //   // setState(() {
      //   //   tabIndex = _tabController.index;
      //   // });
      // }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("dispose.....");
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tabbar练习1'),
        // 设置选项卡
        bottom: _buildTabBar(context),
      ),
      // 设置选项卡对应的page
      body: _buildBodyView(context),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return TabBar(
      //tabs 的长度超出屏幕宽度后，TabBar，是否可滚动
      //设置为false tab 将平分宽度，为true tab 将会自适应宽度
      isScrollable: false,
      // 设置tab文字类型
      labelStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      // unselectedLabelStyle:TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
      // 设置tab选中颜色
      labelColor: Colors.white,
      // 设置tab未选中颜色
      unselectedLabelColor: Colors.white70,
      unselectedLabelStyle:
          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      // 设置自定义tab的批示器, CustomUnderLineTabIndicator
      // 若不需要自定义，可直接通过
      indicatorColor: Colors.white,
      // 设置指示器宽度
      indicatorWeight: 3,
      indicatorPadding: EdgeInsets.only(top: 0, left: 25, right: 25, bottom: 2),
      // indicatorSize 设置指示器大小计算方式
      // 指示器大小计算方式， TabBarIndicatorSize.lable跟文字等宽, TabBarIndicatorSize.tab跟每个tab等宽
      indicatorSize: TabBarIndicatorSize.tab,
      // 生成Tab菜单
      controller: _tabController,
      dragStartBehavior: DragStartBehavior.down,
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 4.0, color: Colors.red)),
      // 构造Tab集合
      // tabs: _tabs.map((v) {
      //   return Tab(
      //     child: Text(
      //       v,
      //       textAlign: TextAlign.left,
      //     ),
      //   );
      // }).toList(),
      tabs: [
        Tab(
          child: Text(
            _tabs[0],
            style: TextStyle(fontSize: tabIndex == 0 ? 20 : 16),
          ),
        ), // 如果当前索引等于0字体大小就是20
        Tab(
          child: Text(
            _tabs[1],
            style: TextStyle(fontSize: tabIndex == 1 ? 20 : 16),
          ),
        ),
        Tab(
          child: Text(
            _tabs[2],
            style: TextStyle(fontSize: tabIndex == 2 ? 20 : 16),
          ),
        ),
        Tab(
          child: Text(
            _tabs[3],
            style: TextStyle(fontSize: tabIndex == 3 ? 20 : 16),
          ),
        ),
      ],
      onTap: (index) {
        debugPrint("val:$index");
        // 每当TabBar 切换更新索引

        _tabController.animateTo(index);
        _pageController.jumpToPage(index);
        // setState(() {
        //   tabIndex = index;
        // });
      },
    );
  }

  Widget _buildBodyView(BuildContext context) {
    // 自定义tabbarView
    return FixTabBarView(
      tabController: _tabController,
      pageController: _pageController,
      dragStartBehavior: DragStartBehavior.down,
      // 页面改变事件
      onPageChange: (index) {
        print("onPageChange($index)....");
        // setState(() {
        //   tabIndex = index;
        // });
      },
      children: _pages.map(
        (v) {
          return v;
        },
      ).toList(),
    );
  }
}
