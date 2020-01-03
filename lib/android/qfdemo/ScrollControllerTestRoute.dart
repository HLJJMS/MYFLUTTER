import 'package:flutter/material.dart';

/// @Description: ListView监听demo

/// @Author: 齐峰

/// @Date:2019年11月20日 15:42:25

/// @Version: 1.0

/// @LastEditors:齐峰

/// @LastEditTime:2019年11月20日 15:42:32

/// @Deprecated: false
class ScrollControllerTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ScrollControllerTestRouteState();
  }
}

class ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      print(_scrollController.offset); //滚动位置
      if (_scrollController.offset < 500 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_scrollController.offset >= 500 && showToTopBtn==false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('滚动监听demo')),
      body: Scrollbar(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('我是第$index'),
            );
          },
          controller: _scrollController,
          itemCount: 50,
          itemExtent: 50, //列表项高度固定时，显式指定高度
        ),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : new FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                //返回顶部动画
                _scrollController.animateTo(0,
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
              }),
    );
  }
}
