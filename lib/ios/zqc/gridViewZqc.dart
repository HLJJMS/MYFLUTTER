import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'ListViewzqc.dart';

import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'zqcEasyRefreshHeader.dart';
import 'zqcEasyRefreshFooter.dart';

import 'cellZqc.dart';

class GridViewZqc extends StatefulWidget {
  @override
  _GridViewZqcState createState() => _GridViewZqcState();
}

class _GridViewZqcState extends State<GridViewZqc> {
  bool isEmptyShow = true;
  EasyRefreshController _easyRefreshcontroller =
      EasyRefreshController(); // EasyRefresh 刷新 Controller
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
          title: new Text('GridView'),
          leading: IconButton(
            icon: ImageIcon(new AssetImage('assets/image/nav_back.png')),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.autorenew),
              onPressed: () {
                _easyRefreshcontroller.callRefresh();
              },
            ),
            IconButton(
              icon: Icon(Icons.vertical_align_top),
              onPressed: () {
                _easyRefreshcontroller.callLoad();
              },
            ),
          ],
        ),
        body: _buildEasyRefresh(),
        //body: _buildGridCountView(),
        //body: _buildGridExtentView(),
        //body: _buildGridViewBuilderFixed(),
        //body: _buildGridViewCustom(),
      ),
    );
  }

  /* MARK: GridView.Count
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildGridCountView() {
    return GridView.count(
      scrollDirection: Axis.vertical, //滚动方向

      reverse: false, //反向排列

      primary: true, //如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。

      shrinkWrap: true, //默认false   内容适配

      physics:
          AlwaysScrollableScrollPhysics(), //滑动类型设置 AlwaysScrollableScrollPhysics() 总是可以滑动 NeverScrollableScrollPhysics 禁止滚动 BouncingScrollPhysics 内容超过一屏 上拉有回弹效果 ClampingScrollPhysics 包裹内容 不会有回弹

      addAutomaticKeepAlives: true,
      addRepaintBoundaries: true,
      addSemanticIndexes: true,

      //semanticChildCount: 2, //将提供语义信息的子代数量

      crossAxisSpacing: 10.0, //水平子Widget之间间距

      mainAxisSpacing: 30.0, //垂直子Widget之间间距

      padding: EdgeInsets.all(10.0), //GridView内边距

      crossAxisCount: 2, //一行的Widget数量

      childAspectRatio: 0.5, //子Widget宽高比例

      children: _buildWidgetList(), //子Widget列表

      cacheExtent: 100.0, //设置预加载的区域
    );
  }

  /* MARK: GridView.Count
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildGridExtentView() {
    return GridView.extent(
      scrollDirection: Axis.vertical, //滚动方向

      reverse: false, //反向排列

      primary: true, //如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。

      shrinkWrap: true, //默认false   内容适配

      physics:
          AlwaysScrollableScrollPhysics(), //滑动类型设置 AlwaysScrollableScrollPhysics() 总是可以滑动 NeverScrollableScrollPhysics 禁止滚动 BouncingScrollPhysics 内容超过一屏 上拉有回弹效果 ClampingScrollPhysics 包裹内容 不会有回弹

      addAutomaticKeepAlives: true,
      addRepaintBoundaries: true,
      addSemanticIndexes: true,

      semanticChildCount: 2, //将提供语义信息的子代数量

      crossAxisSpacing: 10.0, //水平子Widget之间间距

      mainAxisSpacing: 30.0, //垂直子Widget之间间距

      padding: EdgeInsets.all(10.0), //GridView内边距

      //crossAxisCount: 2, //一行的Widget数量
      maxCrossAxisExtent: 190, //表示交叉轴上Item最大的宽度

      childAspectRatio: 0.5, //子Widget宽高比例

      children: _buildWidgetList(), //子Widget列表

      //cacheExtent: 10.0, //设置预加载的区域
    );
  }

  /* MARK: GridView.builder  Fixed
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildGridViewBuilderFixed() {
    return GridView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: array.length,
        //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //横轴元素个数
          crossAxisCount: 3,
          //纵轴间距
          mainAxisSpacing: 20.0,
          //横轴间距
          crossAxisSpacing: 10.0,
          //子组件宽高长度比例
          childAspectRatio: 0.5,
        ),
        itemBuilder: (BuildContext context, int index) {
          //Widget Function(BuildContext context, int index)
          return _buildCell(index);
        });
  }

  /* MARK: GridView.builder  Max
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildGridViewBuilderMax() {
    return GridView.builder(
        reverse: false, //反向排列
        scrollDirection: Axis.vertical, //滚动方向

        padding: EdgeInsets.all(10.0),
        itemCount: array.length,
        //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //crossAxisCount: 3,//横轴元素个数

          mainAxisSpacing: 20.0, //纵轴间距

          crossAxisSpacing: 10.0, //横轴间距

          childAspectRatio: 0.8, //子组件宽高长度比例

          maxCrossAxisExtent: 200, //单个子Widget的水平最大宽度
        ),
        itemBuilder: (BuildContext context, int index) {
          //Widget Function(BuildContext context, int index)
          return _buildCell(index);
        });
  }

  /* MARK: GridView.custom
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildGridViewCustom() {
    return GridView.custom(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.5,
        ),
        childrenDelegate: MyChildrenDelegate(
          (context, position) {
            return _buildCell(position);
          },
          childCount: array.length,
        ));
  }

  List<Widget> _buildWidgetList() {
    List<Widget> widgets = List();
    for (var i = 0; i < array.length; i++) {
      //ListItem item = array[i];
      Container con = new Container(
        //height: 30.0 * (i + 1),
        color: Colors.cyan,
        child: _buildCell(i),
      );
      widgets.add(con);
    }
    return widgets;
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
      //header: ClassicalHeader(),
      //footer: ClassicalFooter(),
      controller: _easyRefreshcontroller,
      enableControlFinishRefresh: true,
      enableControlFinishLoad: true,
      onRefresh: () async {
        _easyOnRefresh();
      },
      onLoad: () async {
        _easyOnLoading();
      },
      child: _buildGridViewBuilderMax(),
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
