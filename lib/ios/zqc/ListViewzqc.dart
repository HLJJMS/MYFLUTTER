/* MARK: ListView
 * @Description: 类描述
 * @Author: 郑群昌
 * @Date: 2019-12-05 15:46:01
 * @Version: 版本号, YYYY-MM-DD
 * @LastEditors: 郑群昌
 * @LastEditTime: 2019-12-06 14:54:52
 * @Deprecated: 否
 */
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';

//import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'refreshHeaderFooterZqc.dart';
import 'cellZqc.dart';
import 'cellListView.dart';
import 'listItemsZqc.dart';
import 'gridViewZqc.dart';

class ListViewqzc extends StatefulWidget {
  final PageStorageKey pageKey;
  ListViewqzc({Key key, this.pageKey});
  @override
  _ListViewqzcState createState() => _ListViewqzcState(pageKey: this.pageKey);
}

class _ListViewqzcState extends State<ListViewqzc> {
  final PageStorageKey pageKey;
  _ListViewqzcState({Key key, this.pageKey});
  bool isEmptyShow = true;
  ScrollController _listViewController = ScrollController(
    //initialScrollOffset: 100.0, //初始滚动位置
    keepScrollOffset: true, //是否保存滚动位置
    //一个路由中包含多个可滚动组件时，如果要分别跟踪它们的滚动位置，
    //并非一定就得给他们分别提供PageStorageKey。这是因为Scrollable
    //本身是一个StatefulWidget，它的状态中也会保存当前滚动位置，所以，
    //只要可滚动组件本身没有被从树上detach掉，那么其State就不会销毁(dispose)，
    //滚动位置就不会丢失。只有当Widget发生结构变化，导致可滚动组件的State销毁或
    //重新构建时才会丢失状态，这种情况就需要显式指定PageStorageKey，通过
    //PageStorage来存储滚动位置，一个典型的场景是在使用TabBarView时，
    //在Tab发生切换时，Tab页中的可滚动组件的State就会销毁，
    //这时如果想恢复滚动位置就需要指定PageStorageKey。
    //也能解决TabBarView恢复滚动位置 AutomaticKeepAliveClientMixin  但 NestedScrollView + TabBar + TabBarView/PageView 同步滚动
  ); //listview的控制器
  RefreshController _refreshController =
      RefreshController(initialRefresh: false); //刷新controller
  List<ListItem> array = List();
  final urlStr =
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1246190829,2813517358&fm=11&gp=0.jpg';
  final backUrlStr =
      'http://file02.16sucai.com/d/file/2014/1006/e94e4f70870be76a018dff428306c5a3.jpg';

  @override
  void initState() {
    super.initState();
    getData();
    _listViewController.addListener(() {
      print('=============================');
      print(
          'hasClients:  ${_listViewController.hasClients}'); //是否正确初始化并连接到像ListView这样的实际滚动元素
      print(
          'initialScrollOffset: ${_listViewController.initialScrollOffset}'); //初始滚动位置
      print('offset: ${_listViewController.offset}');
      print('pixels: ${_listViewController.position.pixels}'); //当前滚动位置。
      print(
          'maxScrollExtent: ${_listViewController.position.maxScrollExtent}'); //最大可滚动长度。
      print(
          'extentBefore: ${_listViewController.position.extentBefore}'); //滑出ViewPort顶部的长度；相当于顶部滑出屏幕上方的列表长度。
      print(
          'extentInside: ${_listViewController.position.extentInside}'); //ViewPort内部长度；相当于屏幕显示的列表部分的长度。
      print(
          'extentAfter: ${_listViewController.position.extentAfter}'); //列表中未滑入ViewPort部分的长度；列表底部未显示到屏幕范围部分的长度。
      print('atEdge: ${_listViewController.position.atEdge}'); //是否滑到了可滚动组件的边界
      print('+++++++++++++++++++++++++++++');
      if (_listViewController.position.pixels ==
          _listViewController.position.maxScrollExtent) {
        print('滑动到了最底部');
      }
    });
  }

  //处理字符串
  String _subString(int index) {
    String subStr = '';
    for (var i = 0; i <= index; i++) {
      subStr = subStr + '小明是   萨德何时放假都好几个用法体检卡复印看过呀流量好的一脚踢开如科技园退款';
    }
    return subStr;
  }

  /* MARK: 模仿网络获取
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Future getData() async {
    await Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        array = List.generate(
            10,
            (int index) => ListItem(10 + index, '小明$index', urlStr,
                _subString(index), false, backUrlStr));
      });
      isEmptyShow = false;
    });
  }

  @override
  void dispose() {
    _listViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: pageKey,
      //title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('ListView'),
          leading: IconButton(
            icon: ImageIcon(new AssetImage('assets/image/nav_back.png')),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              child: new Text(
                'GridView',
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new GridViewZqc()));
              },
            ),
            // FlatButton(
            //     color: Colors.blue,
            //     textColor: Colors.white,
            //     child: new Text(
            //       'jumpTo',
            //     ),
            //     onPressed: () {
            //       _listViewController.jumpTo(300);
            //     }),
            // FlatButton(
            //   color: Colors.blue,
            //   textColor: Colors.white,
            //   child: new Text(
            //     'animateTo',
            //   ),
            //   onPressed: () {
            //     _listViewController.animateTo(400,
            //         duration: Duration(milliseconds: 500), curve: Curves.ease);
            //   },
            // ),
            IconButton(
              icon: Icon(Icons.autorenew),
              onPressed: () {
                _refreshController.requestRefresh();
              },
            ),
            IconButton(
              icon: Icon(Icons.vertical_align_top),
              onPressed: () {
                _refreshController.requestLoading();
              },
            ),
          ],
        ),
        body: _listViewWithPullToRefresh(),
        //body: _listviewBuilder(),
        //body: _listViewSeparated(),
        //body: _listListCustom(),
        //body: _listListTile(),
      ),
    );
  }

  /* MARK: list + listTile 
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _listListTile() {
    List<Widget> _list = new List();
    for (int i = 0; i < array.length; i++) {
      ListItem item = array[i];
      _list.add(new Center(
        child: ZQCListTitle(item: item, index: i),

        //child: _buildListViewCell(i),
      ));
    }
    return new ListView(
      children: _list,
      reverse: false,
      scrollDirection: Axis.vertical, //需注意，不能水平滑动
      //shrinkWrap: true,
    );
  }

  Widget _buildListViewCell(int index) {
    return CellListViewZqc(
      onChanged: (index) {
        _onOffSwitch(index);
      },
      index: index,
      array: this.array,
    );
  }

  /* MARK: listView custom 构建
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _listListCustom() {
//    return ListView.custom(childrenDelegate: new MyChildrenDelegate());
    return ListView.custom(
      //itemExtent: 40.0,//cell高度
      childrenDelegate: MyChildrenDelegate(
        (BuildContext context, int index) {
          // return Container(
          //   color: Colors.yellowAccent,
          //   child: Text(array[index].name),
          // );
          return _buildCell(index);
        },
        childCount: array.length,
      ),
      cacheExtent: 30.0, //预加载的区域
    );
  }

  /* MARK: listView.separated
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _listViewSeparated() {
    return ListView.separated(
      addAutomaticKeepAlives: true,
      addRepaintBoundaries: true,
      addSemanticIndexes: false, //是否用[IndexedSemantics]包装每个子项。
      //通常，滚动容器中的子项必须使用语义索引进行注释，以便生成正确的可访问性声明。
      //只有当索引已经由[IndexedChildSemantics]小部件提供时，才应将此设置为false。
      //[IndexedChildSemantics] Creates a widget that annotated the first child semantics node with an index.
      //[IndexedChildSemantics] 创建用索引注释第一个子语义节点的小部件。
      itemBuilder: (BuildContext context, int index) {
        return _buildCell(index);
        //return _buildListViewCell(index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return (index % 3) == 0
            ? Container(
                height: 60.0,
                color: Colors.yellow,
                child: Text((index ~/ 3).toString()),
              )
            : Container();
      },
      itemCount: array.length,
    );
  }

  /* MARK: ListView.builder
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _listviewBuilder() {
    return ListView.builder(
      //key: pageKey,
      scrollDirection:
          Axis.vertical, //设置滑动方向 Axis.horizontal 水平  默认 Axis.vertical 垂直
      //shrinkWrap: true, //多用于嵌套listView中 内容大小不确定
      padding: EdgeInsets.all(0), //内边距
      reverse: false, //是否倒序显示 默认正序 false  倒序true
      //itemExtent: 50.0, //确定每一个item的高度 会让item加载更加高效
      //primary: false, //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
      //设置physics属性总是可滚动
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: array.length, //数量
      controller: _listViewController,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: _buildCell(index),
          //child: _buildListViewCell(index),
        );
      },
    );
  }

  /* MARK: buidCell
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildCell(int index) {
    return CellZqc(
      onChanged: (index) {
        _onOffSwitch(index);
      },
      index: index,
      array: this.array,
    );
  }

  // 隐藏显示介绍
  _onOffSwitch(int index) {
    ListItem item = array[index];

    if (item.isShow == true) {
      item.isShow = false;
    } else {
      item.isShow = true;
    }
    //array.setAll(index, [item]);
    if (!mounted) return;
    setState(() {});
  }

  /* MARK: _listView加刷新组件 pull_to_refresh
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _listViewWithPullToRefresh() {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: RefreshHeadererZqc(),
      footer: RefreshFooterZqc(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: isEmptyShow ? _easyRefreshEmptyWidget() : _listviewBuilder(),
    );
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        array = List.generate(
            10,
            (int index) => ListItem(10 + index, '小明$index', urlStr,
                _subString(index), false, backUrlStr));
      });
    });
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
    _refreshController.loadFailed();
    //_refreshController.refreshFailed();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;
      var lastIndex = array.length > 0 ? array.last.age - 10 + 1 : 0;
      setState(() {
        var items = List.generate(
            10,
            (int index) => ListItem(
                10 + lastIndex + index,
                '小明' + (lastIndex + index).toString(),
                urlStr,
                _subString(index),
                false,
                backUrlStr));
        array.addAll(items);
      });
    });
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (array.length > 19) {
      _refreshController.loadNoData();
    } else {
      _refreshController.loadComplete();
    }
    //_refreshController.loadFailed();
    //_refreshController.loadNoData();
  }

  //空数据视图
  Widget _easyRefreshEmptyWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellow,
      child: Center(
        child: Text(
          '空',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}

// class ListItem {
//   int age;
//   String name;
//   String picUrl;
//   String backPicUrl;
//   String infomation;
//   bool isShow;
//   ListItem(this.age, this.name, this.picUrl, this.infomation, this.isShow,
//       this.backPicUrl);
// }

/* MARK: 继承SliverChildBuilderDelegate  可以对列表的监听
 * @LastEditors: 郑群昌
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
//可以用SliverChildListDelegate或SliverChildBuilderDelegate这两个类实现。前者将会一次性全部渲染子组件，后者将会根据视窗渲染当前出现的元素，其效果可以和ListView和ListView.build这两个构造函数类比。
//SliverChildBuilderDelegate和SliverChildListDelegate，两者区别在于SliverChildBuilderDelegate可以加载不确定数量的列表，而SliverChildListDelegate只能加载固定已知数量
class MyChildrenDelegate extends SliverChildBuilderDelegate {
  MyChildrenDelegate(
    Widget Function(BuildContext, int) builder, {
    int childCount,
    bool addAutomaticKeepAlive =
        true, //是否将列表项(子Widget)包裹在AutomaticKeepAlive widget中，典型的，在一个懒加载列表中，如果列表项包裹在AutomaticKeepAlive中，列表项移出视口时该列表项不会GC，会使用KeepAliveNotification来保存其状态。如果列表项自己维护KeepAlive状态，则此项为false。
    bool addRepaintBoundaries =
        true, //是否将列表项(子Widget)包裹在RepaintBoundary中。将列表项包裹在RepaintBoundary中可以避免在滚动的时候重绘，但重绘开销非常小的时候，不添加RepaintBoundary反而会高效。
  }) : super(builder,
            childCount: childCount,
            addAutomaticKeepAlives: addAutomaticKeepAlive,
            addRepaintBoundaries: addRepaintBoundaries);

  ///监听 在可见的列表中 显示的第一个位置和最后一个位置
  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    print('firstIndex: $firstIndex, lastIndex: $lastIndex');
  }

  ///可不重写 重写不能为null  默认是true  添加进来的实例与之前的实例是否相同 相同返回true 反之false
  ///listView 暂时没有看到应用场景 源码中使用在 SliverFillViewport 中
  @override
  bool shouldRebuild(SliverChildBuilderDelegate oldDelegate) {
    print("oldDelegate$oldDelegate");
    return super.shouldRebuild(oldDelegate);
  }
}
