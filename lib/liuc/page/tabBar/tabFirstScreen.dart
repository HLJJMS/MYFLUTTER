import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/page/tabBar/myTabController.dart';
import 'package:flutter_app/liuc/page/tabBar/myTabScreen.dart';

class TabFirstScreen extends StatefulWidget {
  // 自定义tabbar监听
  final MyTabController myTabController;

  TabFirstScreen({Key key, this.myTabController}) : super(key: key);

  @override
  _TabFirstScreenState createState() => _TabFirstScreenState();
}

class _TabFirstScreenState extends State<TabFirstScreen>
    with AutomaticKeepAliveClientMixin {
  // 状态文字
  String statusWord = "";
  // 文字颜色
  Color wordColor = Colors.white;
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // debugPrint("tab首页页面 initState....");
    // tabbar中pageView拖动监听
    widget.myTabController.addListener(() {
      if (widget.myTabController.index == 0) {
        // print(
        //     '首页监听 index: ${widget.myTabController.index}, status: ${widget.myTabController.tabDragStatus}');
        setState(() {
          // TabBar中pageView开始拖动
          if (widget.myTabController.tabDragStatus == TabDragStatus.start) {
            statusWord = "准备加载数据...";
            wordColor = Colors.white60;
            // TabBar中pageView结束拖动
          } else if (widget.myTabController.tabDragStatus ==
              TabDragStatus.end) {
            statusWord = "正在加载数据...";
            wordColor = Colors.white;
          }
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    // debugPrint("tab首页页面 didChangeDependencies....");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('tab首页页面 build ....');
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('首页', style: TextStyle(fontSize: 40, color: wordColor)),
            Text(statusWord, style: TextStyle(fontSize: 20, color: wordColor))
          ],
        ),
      ),
    );
  }
}
