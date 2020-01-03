import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/page/tabBar/myTabController.dart';
import 'package:flutter_app/liuc/page/tabBar/myTabScreen.dart';

class TabFourthScreen extends StatefulWidget {
  final MyTabController myTabController;
  TabFourthScreen({Key key, this.myTabController}) : super(key: key);

  @override
  _TabFourthScreenState createState() => _TabFourthScreenState();
}

class _TabFourthScreenState extends State<TabFourthScreen>
    with AutomaticKeepAliveClientMixin {
  // 状态文字
  String statusWord = "";
  // 文字颜色
  Color wordColor = Colors.white;
  @override
  void initState() {
    super.initState();
    // debugPrint("tab我的页面 initState ....");
    // tabbar中pageView拖动监听
    widget.myTabController.addListener(() {
      if (widget.myTabController.index == 3) {
        // print(
        //     '我的页监听 index: ${widget.myTabController.index}, status: ${widget.myTabController.tabDragStatus}');
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
  Widget build(BuildContext context) {
    // debugPrint('tab我的页面 build ....');
    return Container(
      color: Colors.deepOrange,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('我的', style: TextStyle(fontSize: 40, color: wordColor)),
            Text(statusWord, style: TextStyle(fontSize: 20, color: wordColor))
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
