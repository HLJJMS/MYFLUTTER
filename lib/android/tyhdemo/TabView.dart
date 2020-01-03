import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lottie/flutter_lottie.dart';

import 'ListView.dart';
import 'Login.dart';

//主页面
class TabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new ApplicationPage(),
    );
  }
}

class ApplicationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ApplicationPageState();
  }
}

class _ApplicationPageState extends State<ApplicationPage> {
  //  选中的文字颜色
  MaterialColor _selectTextColor = Colors.blue;

//  没有选中的文字颜色
  MaterialColor _unSelectTextColor = Colors.orange;

//  选中的icon颜色
  MaterialColor _selectImageColor = Colors.orange;

//  没有选中的icon颜色
  MaterialColor _unSelectImageColor = Colors.orange;

//  是否显示红点
  List<int> redPointList = new List();

//  TAB文字
  List<String> tabTextList = new List();

//  Tab图片或者icon
  List<IconData> tabIconList = new List();

//  tab加载图片（选中）
  List<ImageIcon> tabImageSelect = new List();

//  tab加载图片（未选中）
  List<ImageIcon> tabImageUnSelect = new List();
  List<BottomNavigationBarItem> itemList = new List();
  int index = 0;
  var _pageController = new PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      print('${_pageController.page} 我是page');
      print('${_pageController.initialPage} 我是initialPage');
      print('${_pageController.initialScrollOffset} initialScrollOffset');
      print('${_pageController.offset} 我是offset');
    });
    tabTextList.add("首页");
    tabTextList.add("消息");
    tabTextList.add("发现");
    tabTextList.add("我的");
    tabIconList.add(Icons.pageview);
    tabIconList.add(Icons.print);
    tabIconList.add(Icons.pan_tool);
    tabIconList.add(Icons.panorama);
    redPointList.add(-1);
    redPointList.add(0);
    redPointList.add(1);
    redPointList.add(2);
    tabImageSelect.add(
        ImageIcon(NetworkImage("https://s2.ax1x.com/2019/08/16/mZeD4P.png")));
    tabImageSelect.add(
        ImageIcon(NetworkImage("https://s2.ax1x.com/2019/08/16/mZeD4P.png")));
    tabImageSelect.add(
        ImageIcon(NetworkImage("https://s2.ax1x.com/2019/08/16/mZeD4P.png")));
    tabImageSelect.add(
        ImageIcon(NetworkImage("https://s2.ax1x.com/2019/08/16/mZeD4P.png")));
    tabImageUnSelect.add(ImageIcon(NetworkImage(
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=634259864,4221380461&fm=26&gp=0.jpg")));
    tabImageUnSelect.add(ImageIcon(NetworkImage(
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=634259864,4221380461&fm=26&gp=0.jpg")));
    tabImageUnSelect.add(ImageIcon(NetworkImage(
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=634259864,4221380461&fm=26&gp=0.jpg")));
    tabImageUnSelect.add(ImageIcon(NetworkImage(
        "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=634259864,4221380461&fm=26&gp=0.jpg")));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new PageView.builder(
        onPageChanged: _pageChange,
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              {
                return new Login(txt: "");
              }
              break;
            case 1:
              {
                return new MyListView();
              }
              break;
            case 2:
              {
                return new Image.network(
                    "http://pics1.baidu.com/feed/9f510fb30f2442a7641f95b92eda624ed113023c.jpeg?token=855b3cfe18c564a5242aecd3ab5ff613&s=900D9F50808B8F07661058B0030070F0");
              }
              break;
            case 3:
              {
                return new Image.network(
                    "https://oimagec5.ydstatic.com/image?id=-3838236511647000640&product=adpublish&w=520&h=347");
              }
              break;
          }
          return null;
        },
        itemCount: 4,
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: _getItem(),
        currentIndex: index,
        onTap: onTap,
      ),
    );
  }

  // bottomnaviagtionbar 和 pageview 的联动
  void onTap(int index) {
    // 过pageview的pagecontroller的animateToPage方法可以跳转
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

//  viewpage位置变更监听
  void _pageChange(int i) {
    setState(() {
      if (index != i) {
        index = i;
      }
    });
  }

//  获取tab图标
  Widget _getTabIcon(bool select, int index) {
    return Container(
      child: new Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            child: new Icon(
              tabIconList[index],
              color: _getColor(select),
            ),
          ),
          _getRedPointView(redPointList[index])
        ],
      ),
    );
  }

  //  获取tab图标(json动画)
  Widget _getTabLottie(bool select, int index) {
    return Container(
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
            width: 35,
            height: 35,
            child: LottieView.fromFile(
              filePath: 'assets/jsonplay/faxian.json',
              autoPlay: true,
              loop: false,
              reverse: false,
            ),
          ),
          _getRedPointView(redPointList[index])
        ],
      ),
    );
  }

//  获取item图片
  Widget _getTabImage(bool select, int index) {
    ImageIcon imageIcon;
    if (select == true) {
      imageIcon = tabImageSelect[index];
    } else {
      imageIcon = tabImageUnSelect[index];
    }
    return Container(
      child: new Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Container(padding: EdgeInsets.fromLTRB(5, 5, 5, 0), child: imageIcon),
          _getRedPointView(redPointList[index])
        ],
      ),
    );
  }

//  获取文字布局
  Widget _getTabTxt(bool select, int index) {
    return new Text(
      tabTextList[index],
      style: TextStyle(
        color: _getColor(select),
      ),
    );
  }

//  获取item
  List<BottomNavigationBarItem> _getItem() {
    itemList.clear();
    for (int i = 0; i < tabTextList.length; i++) {
      itemList.add(BottomNavigationBarItem(
          title: index == i ? _getTabTxt(true, i) : _getTabTxt(false, i),
          icon: index == i ? _getTabLottie(true, i) : _getTabImage(false, i),
          backgroundColor: Colors.greenAccent));
    }
    return itemList;
  }

//获取文字颜色
  MaterialColor _getColor(bool select) {
    if (select == true) {
      return _selectTextColor;
    } else {
      return _unSelectTextColor;
    }
  }

//获取小红点
  AnimatedOpacity _getRedPointView(int index) {
    bool isShow = false;
    if (index > 0) {
      isShow = true;
    }
    return AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: isShow ? 1.0 : 0.0,
        child: Container(
          padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10.0)),
          child: Text(
            index.toString(),
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ));
  }
}
