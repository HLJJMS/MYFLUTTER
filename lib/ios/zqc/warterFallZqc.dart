import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';

//import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'refreshHeaderFooterZqc.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'zqcEasyRefreshHeader.dart';
import 'zqcEasyRefreshFooter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'cellZqc.dart';

class WarterFallZqc extends StatefulWidget {
  @override
  _WarterFallZqcState createState() => _WarterFallZqcState();
}

class _WarterFallZqcState extends State<WarterFallZqc> {
  bool isEmptyShow = true;
  EasyRefreshController _easyRefreshcontroller =
      EasyRefreshController(); // EasyRefresh 刷新 Controller
  RefreshController _refreshController =
      RefreshController(initialRefresh: false); //pull_to_refresh刷新controller
  List<ListItem> array = List();
  final urlStr =
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1246190829,2813517358&fm=11&gp=0.jpg';
  final backUrlStr =
      'http://file02.16sucai.com/d/file/2014/1006/e94e4f70870be76a018dff428306c5a3.jpg';
  @override
  void initState() {
    super.initState();
    getData();
  }

  //处理字符串
  String _subString(int index) {
    String subStr = '';
    for (var i = 0; i <= index; i++) {
      subStr = subStr + '小明是   萨德何时放假都好几个用法体检卡复';
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
        isEmptyShow = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('StaggeredGridView'),
          leading: IconButton(
            icon: ImageIcon(new AssetImage('assets/image/nav_back.png')),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: _staggeredGridViewWithPullToRefresh(),
        //body: _buildEasyRefresh(),
      ),
    );
  }

  Widget _buildStaggeredGridView() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: array.length,
      itemBuilder: (BuildContext context, int index) => _buildCell(index),
      // staggeredTileBuilder: (int index) =>
      //     new StaggeredTile.count(2, index.isEven ? 2 : 1),
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  /* MARK: 创建每个item
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
    array.setAll(index, [item]);
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
  Widget _staggeredGridViewWithPullToRefresh() {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: RefreshHeadererZqc(),
      footer: RefreshFooterZqc(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: _buildStaggeredGridView(),
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

  /* MARK: EasyRefresh
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildEasyRefresh() {
    return EasyRefresh(
      header: ZQCClassicalHeader(),
      footer: ZQCClassicalFooter(),
      controller: _easyRefreshcontroller,
      enableControlFinishRefresh: true,
      enableControlFinishLoad: true,
      onRefresh: () async {
        _easyOnRefresh();
      },
      onLoad: () async {
        _easyOnLoading();
      },
      child: _buildStaggeredGridView(),
      emptyWidget: isEmptyShow ? _easyRefreshEmptyWidget() : null,
    );
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

  //刷新
  void _easyOnRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        array = List.generate(
            10,
            (int index) => ListItem(10 + index, '小明$index', urlStr,
                _subString(index), false, backUrlStr));
      });
    });
    _easyRefreshcontroller.finishRefresh(success: true, noMore: false);
    _easyRefreshcontroller.finishLoad(success: false, noMore: false);
  }

  //加载
  void _easyOnLoading() async {
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
    bool noMore = false;
    if (array.length > 19) {
      noMore = true;
    }
    _easyRefreshcontroller.finishLoad(success: true, noMore: noMore);
  }
}
