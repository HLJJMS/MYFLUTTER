import 'package:flutter_app/liuc/AnimDemoPage.dart';
import 'package:flutter_app/liuc/listViewDemoPage.dart';
import 'package:flutter_app/liuc/page/anim/TweenAnimScreen.dart';
import 'package:flutter_app/liuc/page/anim/animatedBuilderScreen.dart';
import 'package:flutter_app/liuc/page/anim/animationListScreen.dart';
import 'package:flutter_app/liuc/page/anim/curvedAnimScreen.dart';
import 'package:flutter_app/liuc/page/anim/heroFirstScreen.dart';
import 'package:flutter_app/liuc/page/anim/heroSecondScreen.dart';
import 'package:flutter_app/liuc/page/anim/staggerScreen.dart';
import 'package:flutter_app/liuc/page/anim/tabLineAnimScreen.dart';
import 'package:flutter_app/liuc/page/boxTestScreen.dart';
import 'package:flutter_app/liuc/page/gestureDetectors/dragScreen.dart';
import 'package:flutter_app/liuc/page/gestureDetectors/gestureDetectorScreen.dart';
import 'package:flutter_app/liuc/page/gestureDetectors/gestureListScreen.dart';
import 'package:flutter_app/liuc/page/gestureDetectors/listenerScreen.dart';
import 'package:flutter_app/liuc/page/gestureDetectors/recognizerScreen.dart';
import 'package:flutter_app/liuc/page/gestureDetectors/scalescreen.dart';
import 'package:flutter_app/liuc/page/gestureDetectors/scrollStatusScreen.dart';
import 'package:flutter_app/liuc/page/newsListPage.dart';
import 'package:flutter_app/liuc/page/oneMagazinePage.dart';
import 'package:flutter_app/liuc/page/providerDemoPage.dart';
import 'package:flutter_app/liuc/page/tabBar/myTabScreen.dart';
import 'package:flutter_app/liuc/page/tabBar/tabBarDemo.dart';
import 'package:flutter_app/liuc/page/tabBar/tabBarListScreen.dart';
import 'package:flutter_app/liuc/page/tabBar/ydTabBarScreen.dart';
import 'package:flutter_app/liuc/page/textFormScreen.dart';
import 'package:flutter_app/liuc/tapboxCPage.dart';
import 'package:flutter_app/liuc/textDemoPage.dart';

import 'gridViewDemoPage.dart';
import 'homePage.dart';
import 'page/providerSecondPage.dart';

var liucRouter = {
  "lc/home_page": (context, params) => HomePage(),
  "lc/tapboxCPage": (context, params) => ParentWidgetC(),
  "lc/text_demo_page": (conext, params) => TextDemoPage(),
  "lc/gridView_demo_page": (conext, params) => GridViewDemoPage(),
  "lc/listView_demo_page": (context, params) => ListViewDemoPage(),
  "lc/anim_demo_page": (context, params) => AnimDemoPage(),
  "lc/news/list": (context, params) => NewsListPage(),
  // 第一种方式(传统url) ："lc/news/one"
  // 第二种方式(restful) ："lc/news/one/:id"
  "lc/news/one/:id": (context, params) => OneMagazinePage(params["id"]?.first),
  "lc/provider": (context, params) => ProviderDemoPage(),
  "lc/provider2": (context, params) => DroviderSecondPage(),
  "lc/box_test": (context, params) => BoxTestScreen(),
  "lc/form": (context, params) => TextFormScreen(),

  /*-------- tabbar -------- */
  "lc/tabbar/list": (context, params) => TabBarListScreen(),
  "lc/tabbar/demo1": (context, params) => TabBarDemoScreen(),
  "lc/tabbar/myTab": (context, params) => MyTabScreen(),
  "lc/tabbar/ydtab": (context, params) => YdTabBarScreen(),
  /*-------- 动画 -------- */
  "lc/animatable/list": (context, params) => AnimationListScreen(),
  // 补间动画
  "lc/animatable/tween": (context, params) => TweenAnimScreen(),
  // 曲线运功
  "lc/animatable/curved": (context, params) => CurvedAnimScreen(),
  // Builder 重构动画
  "lc/animatable/builder": (context, params) => AnimatedBuilderScreen(),
  // hero动画1
  "lc/animatable/hero1": (context, params) => HeroFirstScreen(),
  // hero动画2
  "lc/animatable/hero2": (context, params) => HeroSecondScreen(),
  // 交错动画
  "lc/animatable/stagger": (context, params) => StaggerScreen(),
  // 导航线动画
  "lc/animatable/tabLine": (context, params) => TabLineAnimScreen(),

  /*-------- 手势事件 -------- */
  "lc/gesture/list": (context, params) => GestureListScreen(),
  "lc/gesture/listener": (context, params) => ListenerScreen(),
  // 事件
  "lc/gesture/detector": (context, params) => GestureDetectorScreen(),
  // 拖拽
  "lc/gesture/drag": (context, params) => DragScreen(),
  // 缩放
  "lc/gesture/scale": (context, params) => ScaleScreen(),
  // 手势识别
  "lc/gesture/recognizer": (context, params) => GestureRecognizerScreen(),
  // 滚动事件通知
  "lc/gesture/scroll": (context, params) => ScrollStatusScreen()
};
