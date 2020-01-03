/* MARK: 自定义刷新组件
 * @Description: 类描述
 * @Author: 郑群昌
 * @Date: 2019-12-06 13:54:33
 * @Version: 版本号, YYYY-MM-DD
 * @LastEditors: 郑群昌
 * @LastEditTime: 2019-12-06 13:57:17
 * @Deprecated: 否
 * @三方样式: ClassicIndicator  WaterDropHeader  MaterialClassicHeader  WaterDropMaterialHeader  Shimmer  Indicator  Bezier+Circle
 */
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/* MARK: 自定义header
 * @LastEditors: 郑群昌
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
class RefreshHeadererZqc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomHeader(
      height: 100.0,
      refreshStyle: RefreshStyle.UnFollow,
      builder: (BuildContext context, RefreshStatus mode) {
        Widget body;
        switch (mode) {
          case RefreshStatus.idle:
            body = _idleHeaderBody();
            break;
          case RefreshStatus.canRefresh:
            body = _canRefreshHeaderBody();
            break;
          case RefreshStatus.refreshing:
            body = CupertinoActivityIndicator();
            break;
          case RefreshStatus.completed:
            body = _completedHeaderBody();
            break;
          case RefreshStatus.failed:
            body = _failedHeaderBody();
            break;
          default:
            body = Text("这是什么状态");
            break;
        }
        return Container(
          height: 100.0,
          color: Colors.orangeAccent,
          child: Center(child: body),
        );
      },
    );
  }

  //等待刷新
  Widget _idleHeaderBody() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.keyboard_arrow_down),
          Text("请下拉刷新"),
        ],
      ),
    );
  }

  //释放刷新
  Widget _canRefreshHeaderBody() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.keyboard_arrow_down),
          Text("松开立即刷新"),
        ],
      ),
    );
  }

  //刷新完毕
  Widget _completedHeaderBody() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.keyboard_arrow_up),
          Text("刷新完成"),
        ],
      ),
    );
  }

  //刷新失败
  Widget _failedHeaderBody() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.keyboard_arrow_up),
          Text("刷新失败"),
        ],
      ),
    );
  }
}

/* MARK: 自定义footer
 * @LastEditors: 郑群昌
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
class RefreshFooterZqc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      loadStyle: LoadStyle.ShowAlways,
      builder: (BuildContext context, LoadStatus mode) {
        Widget body;

        switch (mode) {
          case LoadStatus.idle:
            body = _idleFooterBody();
            break;
          case LoadStatus.canLoading:
            body = _canLoadingFooterBody();
            break;
          case LoadStatus.loading:
            body = CupertinoActivityIndicator();
            break;
          case LoadStatus.failed:
            body = _failedFooterBody();
            break;
          case LoadStatus.noMore:
            body = _completedHeaderBody();
            break;
          default:
            break;
        }
        return Container(
          height: 20.0,
          child: Center(child: body),
        );
      },
    );
  }

  //等待加载
  Widget _idleFooterBody() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.keyboard_arrow_up),
          Text("上拉加载更多"),
        ],
      ),
    );
  }

  //释放加载
  Widget _canLoadingFooterBody() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.keyboard_arrow_up),
          Text("松开立即加载"),
        ],
      ),
    );
  }

  //加载失败
  Widget _failedFooterBody() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.keyboard_arrow_up),
          Text("加载失败"),
        ],
      ),
    );
  }

  //没有更多
  Widget _completedHeaderBody() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.keyboard_arrow_left),
          Text("没有更多数据"),
          Icon(Icons.keyboard_arrow_right),
        ],
      ),
    );
  }
}
