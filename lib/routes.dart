import 'dart:core';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/android/qfdemo/qfRouterPage.dart';
import 'package:flutter_app/component/BottomNavigationWidget.dart';
import 'package:flutter_app/ios/adamF/adam.dart';
import 'package:flutter_app/ios/csh/csh_nav.dart';
import 'package:flutter_app/liuc/tapboxBPage.dart';
import 'package:flutter_app/other/otherDemo.dart';
import 'package:flutter_app/util/routerUtil.dart';

import 'ChildTreePage.dart';
import 'SecondPage.dart';
import 'StateDemoPage.dart';
import 'TapboxAPage.dart';
import 'android/androidDemo.dart';
import 'android/qfdemo/router.dart';
import 'android/yk/ykRouter.dart';
import 'android/zlc/exercise_page.dart';
import 'android/zlc/login.dart';
import 'ios/IosDemo.dart';
import 'ios/adamF/adamNextViewController.dart';
import 'ios/csh/csh_column_list.dart';
import 'ios/csh/csh_paging.dart';
import 'ios/csh/csh_reg.dart';
import 'ios/csh/csh_row_list.dart';
import 'ios/csh/csh_table.dart';
import 'ios/dyq/ding_other_somthing.dart';
import 'ios/dyq/ding_page.dart';
import 'ios/dyq/ding_appstore_page.dart';
import 'ios/dyq/scrollview/with_banner_list.dart';

import 'ios/dyq/ding_gaosi_page.dart';
import 'ios/dyq/ding_pwd_page.dart';
import 'ios/dyq/ding_reg_page.dart';
import 'ios/dyq/ding_text_form_field.dart';
import 'ios/dyq/ding_textfield.dart';
import 'ios/dyq/tel_or_other_page.dart';
import 'ios/dyq/ding_appstore_detail_page.dart';

import 'ios/dyq/scrollview/test_ftableview_page.dart';
import 'ios/ran_reg_page.dart';
import 'ios/ranran/ran_ge_second.dart';
import 'ios/ranran/ran_ge_three.dart';
import 'ios/zqc/booksZqc.dart';
import 'ios/zqc/registerzqc.dart';
import 'liuc/router.dart';
import 'package:flutter_app/ios/csh/csh_page.dart';
import 'ios/dyq/ding_paint_page.dart';
import 'ios/csh/csh_animated.dart';

//苹果端路由
var iosRouter = {
  "iosDemoPage": (context, params) {
    Map param = RouterUtil.handleOutParams(params);
    return IosDemo(
      currentIndex: param['currentIndex'],
    );
  },
  "dingReg": (context, params) => DingRegPage(),
  'ranGe': (context, params) => RangRegPage(),
  'telPage': (context, params) => TelOrOtherPage(),
  'zqcReg': (context, params) => RegisterZQCView(),
  'zqc/book': (context, params) => BooksZQCView(),
  'dingTextfield': (context, params) => DingTextfield(),
  'dingPage': (context, params) => DingPage(),
  'dingTextFormfield': (context, params) => DingTextFormField(),
  'dingPwdPage': (context, params) => DingPwdPage(),
  'dingPaintPage': (context, params) => DingPaintPage(),
  'dingGaosiPage': (context, params) => DingGaosiPage(),
  'dingAppstorePage': (context, params) => DingAppstorePage(),
  'dingAppstoredetailPage/:tagStr': (context, params) =>
      DingAppstoreDetailPage(params["tagStr"]?.first),
  'dingBannerListPage': (context, params) => WithBannerList(),
  'dingTestTableViewPage': (context, params) => TestFtableviewPage(),
  "zlj/adamPage/:name": (context, params) => AdamPage(params["name"]?.first),
  'dingOtherPage': (context, params) => DingOtherSomthing(),
  "ranran/second/:asd": (context, params) => RanGeSecond(params["asd"]?.first),
  "ranran/three": (context, params) => RanGeThree(),
  "zlj/adamNextPage/:id": (context, params) =>
      NextViewcontroller(params["id"]?.first),
};

//安卓端路由
var androidRouter = {
  "androidDemoPage": (context, params) => AndroidDemo(),
  "qifeng": (context, params) => qfRouterPage(),
  "zlcLogin": (context, params) => Login(),
  "zlcMainPage": (context, params) => ExercisePage(),
};

//其它路由
var otherRouter = {
  "secondPage": (context, params) =>
      SecondPage(str: ModalRoute.of(context).settings.arguments),
  "stateDemoPage": (context, params) => StateDemoPage(initValue: 13),
  "childTreePage": (context, params) => ChildTreePage(),
  "tapboxAPage": (context, params) => TapboxAPage(),
  "tapboxBPage": (context, params) => ParentWidget(),
  "otherMainPage": (context, params) => OtherDemo(),
  RouterName.cshReg: (context, Map<String, List<Object>> params) {
    Map param = RouterUtil.handleOutParams(params);
    return CSHRegPage(
      param: param['param'],
      title: param['title'],
    );
  },
  RouterName.cshNav: (context, params) => CSHNav(),
  RouterName.cshPage: (conttext, params) => CSHPage(),
  RouterName.cshAnimated: (conttext, params) => AnimatedListSample(),
  RouterName.cshColumnList: (conttext, params) => CSHColumnList(),
  RouterName.cshRowList: (conttext, params) => CSHRowList(),
  RouterName.cshTable: (conttext, params) => CSHTable(),
  RouterName.cshPaging: (conttext, params) => CSHPaging(),
};

/**
 * @Description: 返回所有路由
 * @LastEditors: 刘驰
 * @Version: v1.0, 2019-11-13
 * @param {void}
 * @return: Map<String, Widget Function(dynamic)>
 * @Deprecated: 否
 */
Map getRouters() {
  otherRouter.addAll(iosRouter);
  otherRouter.addAll(androidRouter);
  otherRouter.addAll(liucRouter);
  otherRouter.addAll(qifengRouter);
  otherRouter.addAll(ykRouter);
  return otherRouter;
}

class Routes {
  static String root = "/";

  static configureRoutes(Router router) {
    var routerUrl = {};
    var rootHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return BottomNavigationWidget();
      //return UsersScreen(params["id"][0]);
    });

    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("route is not find !");
    });

    router.define(root, handler: rootHandler);
    router.define("otherMainPage", handler: Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return OtherDemo();
    }));

    getRouters().forEach((url, func) {
      router.define(url, handler: Handler(handlerFunc: func));
    });
  }
}
