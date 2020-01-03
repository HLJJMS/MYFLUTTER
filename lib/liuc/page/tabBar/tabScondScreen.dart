import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/page/tabBar/myTabController.dart';
import 'package:flutter_app/liuc/page/tabBar/myTabScreen.dart';

class TabScondScreen extends StatefulWidget {
  final MyTabController myTabController;

  TabScondScreen({Key key, this.myTabController}) : super(key: key);

  @override
  _TabScondScreenState createState() => _TabScondScreenState();
}

class _TabScondScreenState extends State<TabScondScreen>
    with AutomaticKeepAliveClientMixin {
  // 状态文字
  String statusWord = "";
  // 文字颜色
  Color wordColor = Colors.white;
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    debugPrint("tab投资页面 initState....");
    // tabbar中pageView拖动监听
    widget.myTabController.addListener(() {
      if (widget.myTabController.index == 1) {
        // print(
        //     '投资页监听 index: ${widget.myTabController.index}, status: ${widget.myTabController.tabDragStatus}');
        setState(() {
          // TabBar中pageView开始拖动
          if (widget.myTabController.tabDragStatus == TabDragStatus.start) {
            statusWord = "准备加载数据...";
            wordColor = Colors.white60;
            // pageView结束拖动
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
    // debugPrint("tab投资页面 didChangeDependencies....");
    super.didChangeDependencies();
  }

  reassemble() {
    debugPrint('reassemble .......');
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('tab投资页面 build .....');
    return Container(
      color: Colors.purple,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('投资', style: TextStyle(fontSize: 40, color: wordColor)),
            Text(statusWord, style: TextStyle(fontSize: 20, color: wordColor))
          ],
        ),
      ),
    );
  }
}
