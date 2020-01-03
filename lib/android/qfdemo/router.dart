import 'package:flutter_app/android/qfdemo/CustomScrollViewTestRoute.dart';
import 'package:flutter_app/android/qfdemo/ScrollControllerTestRoute.dart';
import 'package:flutter_app/android/qfdemo/WebViewExample.dart';
import 'package:flutter_app/android/qfdemo/Webview_flutter.dart';
import 'package:flutter_app/android/qfdemo/WebViewProgress.dart';
//import 'package:flutter_app/android/qfdemo/VersionUpgrade.dart';
import 'package:flutter_app/android/qfdemo/loginPage_qf.dart';
//import 'package:flutter_app/android/qfdemo/test.dart';
import 'package:flutter_app/android/qfdemo/upApkDemo.dart';

var qifengRouter = {
  "qf/customScrollView": (context, params) => CustomScrollViewTestRoute(),
  "qf/loginPage": (context, params) => LoginPage_qf(),
  "qf/scrollController": (conext, params) => ScrollControllerTestRoute(),
  "qf/upApk": (conext, params) => upApkDemo(),
  "qf/webview": (conext, params) => WebViewPage(),
  "qf/webviewprogress": (conext, params) => WebViewProgress(),
};
