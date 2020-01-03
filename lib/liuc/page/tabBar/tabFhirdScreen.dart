import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/page/tabBar/myTabController.dart';
import 'package:flutter_app/liuc/page/tabBar/myTabScreen.dart';

class TabFhirdScreen extends StatefulWidget {
  final MyTabController myTabController;
  TabFhirdScreen({Key key, this.myTabController}) : super(key: key);

  @override
  _TabFhirdScreenState createState() => _TabFhirdScreenState();
}

class _TabFhirdScreenState extends State<TabFhirdScreen>
    with AutomaticKeepAliveClientMixin {
  // 状态文字
  String statusWord = "";
  // 文字颜色
  Color wordColor = Colors.white;

  @override
  void initState() {
    super.initState();
    // debugPrint("tab发现页面 initState....");
    // tabbar中pageView拖动监听
    widget.myTabController.addListener(() {
      if (widget.myTabController.index == 2) {
        // print(
        //     '发现页监听 index: ${widget.myTabController.index}, status: ${widget.myTabController.tabDragStatus}');
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
    //debugPrint('tab发现页面 build......');
    return Container(
      color: Colors.amberAccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('发现', style: TextStyle(fontSize: 40, color: wordColor)),
            Text(statusWord, style: TextStyle(fontSize: 20, color: wordColor))
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
