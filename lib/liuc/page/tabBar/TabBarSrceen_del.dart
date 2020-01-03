// import 'package:flutter/material.dart';
// import 'package:flutter_app/liuc/page/tabBar/YdOneScreen.dart';
// import 'package:flutter_app/liuc/page/tabBar/YdTwoScreen.dart';
// import 'package:flutter_app/liuc/page/tabBar/tabFirstScreen.dart';
// import 'package:flutter_app/liuc/page/tabBar/ydFourScreen.dart';
// import 'package:flutter_app/liuc/page/tabBar/ydThreeScreen.dart';
// import 'package:flutter_app/util/mediaUtil.dart';

// class YdTabBarScreen extends StatefulWidget {
//   YdTabBarScreen({Key key}) : super(key: key);

//   @override
//   _YdTabBarScreenState createState() => _YdTabBarScreenState();
// }

// class _YdTabBarScreenState extends State<YdTabBarScreen>
//     with SingleTickerProviderStateMixin {
//   List<String> _tabs;
//   AnimationController _controller;
//   Duration _duration = Duration(milliseconds: 400);
//   Animation<double> _lineAnimation;
//   Tween<double> _lineTween = Tween<double>(begin: 0.0, end: 0.0);
//   int currentIndex = 0;
//   double _end = 0;
//   double _begin = 0;
//   List<Widget> _pages = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _tabs = ['首页', '投资', '发现', '我的'];
//     _pages = [YdOneScreen(), YdTwoScreen(), YdThreeScreen(), YdFourScreen()];
//     _controller = AnimationController(duration: _duration, vsync: this);
//     _lineAnimation = _lineTween.animate(
//         CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc))
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _lineTween.begin = _end;
//           debugPrint('动画执行完成！begin: ${_lineTween.begin}');
//         }
//       });
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('银多自定义TabBar'),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             _buildTabBtn(context),
//             _buildTabLine(context),
//             _buildPageView(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTabBtn(BuildContext context) {
//     return Container(
//       height: 50,
//       color: Colors.blue,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Expanded(
//             child: _buildHomeBtn(context),
//           ),
//           Expanded(
//             child: _buildTzBtn(context),
//           ),
//           Expanded(
//             child: _buildFxBtn(context),
//           ),
//           Expanded(
//             child: _buildMineBtn(context),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHomeBtn(BuildContext context) {
//     return FlatButton(
//       padding: EdgeInsets.all(0),
//       child: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.black,
//         alignment: Alignment.center,
//         child: Text(
//           '首页',
//           style: TextStyle(fontSize: 18, color: Colors.white),
//         ),
//       ),
//       onPressed: () {
//         debugPrint('首页');
//         currentIndex = 0;
//         _end = (MediaUtil.screenWidth(context) / _tabs.length) * currentIndex;
//         _lineTween.end = _end;
//         debugPrint('begin:${_lineTween.begin},end: ${_lineTween.end}');
//         if (!_controller.isAnimating) {
//           _controller.forward(from: 0);
//         }
//       },
//     );
//   }

//   _lineAnimTo(double end) {
//     if (!_controller.isAnimating) {
//       _controller.forward(from: 0);
//     }
//   }

//   Widget _buildTzBtn(BuildContext context) {
//     return FlatButton(
//       padding: EdgeInsets.all(0),
//       child: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.black,
//         alignment: Alignment.center,
//         child: Text(
//           '投资',
//           style: TextStyle(fontSize: 18, color: Colors.white),
//         ),
//       ),
//       onPressed: () {
//         debugPrint('投资');
//         currentIndex = 1;
//         _end = (MediaUtil.screenWidth(context) / _tabs.length) * currentIndex;
//         _lineTween.end = _end;
//         debugPrint('begin:${_lineTween.begin},end: ${_lineTween.end}');
//         if (!_controller.isAnimating) {
//           _controller.forward(from: 0);
//         }
//       },
//     );
//   }

//   Widget _buildFxBtn(BuildContext context) {
//     return FlatButton(
//       padding: EdgeInsets.all(0),
//       child: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.black,
//         alignment: Alignment.center,
//         child: Text(
//           '发现',
//           style: TextStyle(fontSize: 18, color: Colors.white),
//         ),
//       ),
//       onPressed: () {
//         debugPrint('发现');
//         currentIndex = 2;
//         _end = (MediaUtil.screenWidth(context) / _tabs.length) * currentIndex;
//         _lineTween.end = _end;
//         debugPrint('begin:${_lineTween.begin},end: ${_lineTween.end}');
//         if (!_controller.isAnimating) {
//           _controller.forward(from: 0);
//         }
//       },
//     );
//   }

//   Widget _buildMineBtn(BuildContext context) {
//     return FlatButton(
//       padding: EdgeInsets.all(0),
//       child: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.black,
//         alignment: Alignment.center,
//         child: Text(
//           '我的',
//           style: TextStyle(fontSize: 18, color: Colors.white),
//         ),
//       ),
//       onPressed: () {
//         debugPrint('我的');
//         currentIndex = 3;
//         _end = (MediaUtil.screenWidth(context) / _tabs.length) * currentIndex;
//         _lineTween.end = _end;
//         debugPrint('begin:${_lineTween.begin},end: ${_lineTween.end}');
//         if (!_controller.isAnimating) {
//           _controller.forward(from: 0);
//         }
//       },
//     );
//   }

//   Widget _buildTabLine(BuildContext context) {
//     return Container(
//       height: 4,
//       color: Colors.red,
//       margin: EdgeInsets.only(left: _lineAnimation.value),
//       width: MediaUtil.screenWidth(context) / 4,
//     );
//   }

//   Widget _buildPageView(BuildContext context) {
//     return Expanded(
//       child: PageView(children: _pages.map((v) => v).toList()),
//     );
//   }
// }
