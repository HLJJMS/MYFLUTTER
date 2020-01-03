/*
 * @Description: 新闻列表页
 * @Author: 刘驰
 * @Date: 2019-11-19 21:31:28
 * @Version: v1.0, 2019-11-19
 * @LastEditors: 刘驰
 * @LastEditTime: 2019-11-20 10:05:32
 * @Deprecated: 否
 */
import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/component/weatherWidget.dart';
import 'package:flutter_app/liuc/model/newsModel.dart';
import 'package:flutter_app/net_work/request_server.dart';
import 'package:flutter_app/util/toastUtil.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsListPage();
  }
}

class _NewsListPage extends State<NewsListPage> {
  // 新闻信息List
  List<NewsModel> newslist = [];
  RefreshController refreshController;

  @override
  initState() {
    super.initState();

    refreshController = RefreshController(initialRefresh: false);
    // 加载数据
    getData(false);

    getOrderList();
  }

  getOrderList() async {
    var res = await Request.queryOrderList(this.context);
    showToast(res.data.toString());
  }

  /*MARK 加载新闻列表页数据
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-11-19
   * @param {void} 
   * @return: void
   * @Deprecated: 否
   */
  getData(bool isLoading) async {
    // 加载新闻列表数据
    var res = await Request.queryNewsList(this.context);
    // FIXME 下拉刷新时会出现空数据问题
    if (res.data != null) {
      if (refreshController != null) {
        refreshController.refreshCompleted();
        refreshController.loadComplete();
      }

      setState(() {
        if (isLoading) {
          this.newslist.addAll(res.data);
        } else {
          this.newslist = res.data;
        }
      });
    }
  }

  void _onRefresh() async {
    getData(false);
  }

  void _onLoading() async {
    getData(true);
  }

  @override
  Widget build(BuildContext context) {
    //TODO 明天加入下拉刷新功能
    return Scaffold(
      appBar: AppBar(
        title: Text("新闻列表页"),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: CustomHeader(builder: (
          BuildContext context,
          RefreshStatus mode,
        ) {
          Widget body;
          if (mode == RefreshStatus.idle) {
            body = Text('下拉刷新');
          } else if (mode == RefreshStatus.refreshing) {
            body = Text('刷新中。。。');
          } else if (mode == RefreshStatus.failed) {
            body = Text('刷新失败');
          } else if (mode == RefreshStatus.canRefresh) {
            body = Text('松手刷新');
          } else {
            body = Text('刷新完成');
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        }),
        footer: CustomFooter(
          builder: (
            BuildContext context,
            LoadStatus mode,
          ) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text('上拉加载');
            } else if (mode == LoadStatus.loading) {
              body = Text('加载中。。。');
            } else if (mode == LoadStatus.failed) {
              body = Text('加载失败');
            } else if (mode == LoadStatus.canLoading) {
              body = Text('松手加载更多');
            } else {
              body = Text('加载完成');
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: buildPage(context),
      ),
    );
  }

  /* MARK 构建页面组件
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-11-19
   * @param {void} 
   * @return: Widget
   * @Deprecated: 否
   */
  Widget buildPage(BuildContext context) {
    // FIXBUG bug_12234 需要修复下拉加载空数据问题
    // 判断新闻列表数据是否为空
    if (newslist.length > 0) {
      // 如果有数据显示列表组件
      return CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              height: 60,
              child: WeatherWidget(),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 1),
            ),
          ),
          // 当列表项高度固定时，使用 SliverFixedExtendList 比 SliverList 具有更高的性能
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(getNewsListWedget,
                  childCount: newslist.length),
              itemExtent: 100.0)
        ],
      );
      // return Column(
      //   children: <Widget>[
      //     getWeather(_counter),
      //     getListWedget(),
      //   ],
      // );
    } else {
      //TODO 需加入空数据图标
      // 新闻列表为空是显示暂无数据组件
      return Column(
        children: <Widget>[
          WeatherWidget(),
          Text("暂无数据"),
        ],
      );
    }
  }

  Widget getTestListWedget(BuildContext context, int index) {
    return ListTile(title: Text('list tile index $index'));
  }

  Widget getNewsListWedget(BuildContext context, int index) {
    //屏幕size
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(newslist[index].picUrl, width: 80, height: 80),
            // 将描述和标题使用列布局进行竖直排列
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: size.width - 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          newslist[index].description,
                          style: TextStyle(fontSize: 19),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      ),
                      Container(
                        child: Text(newslist[index].ctime.substring(5, 10)),
                        padding: EdgeInsets.all(10),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    newslist[index].title,
                    softWrap: true,
                    maxLines: 2,
                  ),
                  constraints: BoxConstraints(
                    maxWidth: size.width - 80,
                  ),
                  padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
                  margin: EdgeInsets.only(bottom: 10),
                ),
              ],
            ),
          ],
        ));
  }

  /* MARK: 获取新��列表组件
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-11-19
   * @param {void} 
   * @return: Widget
   * @Deprecated: 否
   */
  getListWedget() {
    // return ListView.builder(
    return (context, index) {
      //屏幕size
      final size = MediaQuery.of(context).size;
      Container(
        // color: Colors.green,
        width: size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // 加载文章的网络缩略图
            Image.network(newslist[index].picUrl, width: 80, height: 80),
            // 将描述和标题使用列布局进行竖直排列
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: size.width - 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          newslist[index].description,
                          style: TextStyle(fontSize: 19),
                        ),
                        padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
                      ),
                      Container(
                        child: Text(newslist[index].ctime.substring(5, 10)),
                        padding: EdgeInsets.all(10),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    newslist[index].title,
                    softWrap: true,
                    maxLines: 2,
                  ),
                  constraints: BoxConstraints(
                    maxWidth: size.width - 80,
                  ),
                  padding: EdgeInsets.fromLTRB(10, 6, 10, 0),
                  margin: EdgeInsets.only(bottom: 10),
                ),
              ],
            ),
          ],
        ),
        padding: EdgeInsets.only(top: 10),
        decoration: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.grey, width: 1)),
      );
    };
  }
}
