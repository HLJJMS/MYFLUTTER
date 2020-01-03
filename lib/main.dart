import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/ChildTreePage.dart';
import 'package:flutter_app/SecondPage.dart';
import 'package:flutter_app/StateDemoPage.dart';
import 'package:flutter_app/TapboxAPage.dart';
import 'package:flutter_app/application.dart';
import 'package:flutter_app/liuc/model/OneModel.dart';
import 'package:flutter_app/liuc/model/weatherModel.dart';
import 'package:flutter_app/liuc/service/newsService.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_app/tool/data_helper.dart';
import 'package:provider/provider.dart';
import 'Demo.dart';
import 'RandomWords.dart';
import 'liuc/provider/CounterModel.dart';
// import 'package:english_words/english_words.dart';

Future<WeatherModel> loadInitData() async {
  return await NewsService.queryWeatherList();
}

void main() async {
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  final counter = CounterModel();
  var om = await loadInitData();
  counter.setWeatherMOdel(om);
  final textSize = 48;
  runApp(MultiProvider(providers: [
    Provider<int>.value(value: textSize),
    ChangeNotifierProvider.value(
      value: counter,
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    var router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "/",
      // 设置主题主颜色与按钮颜色
      theme: new ThemeData(
          primaryColor: Colors.green,
          buttonColor: Colors.green,
          splashColor: Colors.transparent,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.green,
          )),
      // routes: getRouters(),
      // onGenerateRoute: (RouteSettings settings) {
      //   return MaterialPageRoute(builder: (context) {
      //     String routeName = settings.name;
      //     print("路由名称：$routeName");
      //     // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
      //     // 引导用户登录；其它情况则正常打开路由。
      //   });
      // }
      onGenerateRoute: Application.router.generator,
    );
  }
}
