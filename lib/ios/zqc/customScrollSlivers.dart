import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/ios/zqc/sliverGridView.dart';
import 'package:flutter_app/ios/zqc/sliverListView.dart';
import 'sliverViews.dart';
import 'cellZqc.dart';

class CustomScrollSlivers extends StatefulWidget {
  @override
  _CustomScrollSliversState createState() => _CustomScrollSliversState();
}

class _CustomScrollSliversState extends State<CustomScrollSlivers> {
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
  void getData() {
    if (!mounted) return;
    setState(() {
      array = List.generate(
          10,
          (int index) => ListItem(10 + index, '小明$index', urlStr,
              _subString(index), false, backUrlStr));
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
        // appBar: new AppBar(
        //   title: new Text('ListView'),
        //   leading: IconButton(
        //     icon: ImageIcon(new AssetImage('assets/image/nav_back.png')),
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   ),
        // ),
        body: _buildCustom(),
      ),
    );
  }

  Widget _buildCustom() {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverAppBar(),
        _buildBanner(),
        _buildSliverPadding(),
        //_buildSliverGridView(),
        _buildImageBar(),
        _buildSliverListView(),
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
    return SliverAppBar(
      title: Text('CustomScrollSlivers'),
      leading: IconButton(
        icon: ImageIcon(AssetImage('assets/image/nav_back.png')),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Colors.blue,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('FlutterIsBastFlutterIsBestFlutterIsBestFlutterIsBest'),
        centerTitle: false,
        collapseMode: CollapseMode.parallax, //背景滚动方式
        stretchModes: const <StretchMode>[StretchMode.blurBackground],
        titlePadding: EdgeInsets.only(right: 130, left: 60),
        background: Image.network(
          urlStr,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
      floating: false,
      snap: false,
      pinned: true,
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

  Widget _buildSliverPadding() {
    return SliverPadding(
      padding: EdgeInsets.all(20.0),
      sliver: _buildSliverGridView(),
    );
  }

  /* MARK: SliverGridView
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildSliverGridView() {
    return SliverGridViewZqc();
  }

  /* MARK: SliverListView
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Widget _buildSliverListView() {
    //SliverFixedExtentList与SliverList类似，唯一区别是SliverFixedExtentList可以设置固定高度。
    return SliverListViewZqc(
      array: this.array,
      onChanged: (index) {
        _onOffSwitch(index);
      },
    );
  }

  /* MARK: 隐藏显示介绍
   * @LastEditors: 郑群昌
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
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
}
