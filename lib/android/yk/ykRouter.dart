import 'package:flutter/cupertino.dart';
import 'package:flutter_app/android/yk/pageJumps/SecondScreen.dart';
import 'package:flutter_app/android/yk/passByValue/ListDemo.dart';
import 'package:flutter_app/android/yk/save/FileDemo.dart';
import 'package:flutter_app/android/yk/save/SharedPreferencesDemo.dart';
import 'package:flutter_app/android/yk/uiDemo/ui_demo_main.dart';
import 'package:flutter_app/passport/login/loginPage.dart';

import 'FirstScreen.dart';
import 'demo/TestExitApp.dart';
import 'demo/TestPermission.dart';
import 'passByValue/DetailsDemo.dart';
import 'save/DbDemo.dart';
import 'widgets/common_widgets/column_widgets/column_widgets.dart';
import 'widgets/common_widgets/common_main_widgets.dart';
import 'widgets/common_widgets/container_widgets/container_alignment_widgets.dart';
import 'widgets/common_widgets/container_widgets/container_child_widgets.dart';
import 'widgets/common_widgets/container_widgets/container_constraints_widgets.dart';
import 'widgets/common_widgets/container_widgets/container_decoration_widgets.dart';
import 'widgets/common_widgets/container_widgets/container_foreground_decoration_widgets.dart';
import 'widgets/common_widgets/container_widgets/container_main_widgets.dart';
import 'widgets/common_widgets/container_widgets/container_margin_widgets.dart';
import 'widgets/common_widgets/container_widgets/container_padding_widgets.dart';
import 'widgets/common_widgets/container_widgets/container_transform_widgets.dart';
import 'widgets/common_widgets/image_widgets/image_color_widgets.dart';
import 'widgets/common_widgets/image_widgets/image_loading_builder_widgets.dart';
import 'widgets/common_widgets/image_widgets/image_provider_widgets.dart';
import 'widgets/common_widgets/image_widgets/image_widgets.dart';
import 'widgets/common_widgets/row_widgets/row_expanded_widgets.dart';
import 'widgets/common_widgets/row_widgets/row_text_baseline_widgets.dart';
import 'widgets/common_widgets/row_widgets/row_widgets.dart';
import 'widgets/main_widgets.dart';
import 'ykMain.dart';

final ROUTES_ROOT = 'yk/';
final WIDGETS = '${ROUTES_ROOT}widgets/';
final COMMON_WIDGETS = '${WIDGETS}commonWidgets/';

final ROUTES_WIDGETS_MAIN_VIEW = '${COMMON_WIDGETS}WidgetsMainView';
final ROUTES_COMMON_WIDGETS_MAIN_VIEW =
    '${COMMON_WIDGETS}CommonWidgetsMainView';
final ROUTES_COMMON_WIDGETS_CONTAINER_VIEW =
    '${COMMON_WIDGETS}ContainerMainView';
final ROUTES_COMMON_WIDGETS_CONTAINER_ALIGNMENT_VIEW =
    '${COMMON_WIDGETS}ContainerAlignmentView';
final ROUTES_COMMON_WIDGETS_CONTAINER_CHILD_VIEW =
    '${COMMON_WIDGETS}ContainerChildView';
final ROUTES_COMMON_WIDGETS_CONTAINER_PADDING_VIEW =
    '${COMMON_WIDGETS}ContainerPaddingView';
final ROUTES_COMMON_WIDGETS_CONTAINER_MARGIN_VIEW =
    '${COMMON_WIDGETS}ContainerMarginView';
final ROUTES_COMMON_WIDGETS_CONTAINER_DECORATION_VIEW =
    '${COMMON_WIDGETS}ContainerDecorationView';
final ROUTES_COMMON_WIDGETS_CONTAINER_FOREGROUND_DECORATION_VIEW =
    '${COMMON_WIDGETS}ContainerForegroundDecorationView';
final ROUTES_COMMON_WIDGETS_CONTAINER_CONSTRAINTS_VIEW =
    '${COMMON_WIDGETS}ContainerConstraintsView';
final ROUTES_COMMON_WIDGETS_CONTAINER_TRANSFORM_VIEW =
    '${COMMON_WIDGETS}ContainerTransformView';
final ROUTES_COMMON_WIDGETS_ROW_VIEW = '${COMMON_WIDGETS}RowMainView';
final ROUTES_COMMON_WIDGETS_ROW_EXPANDED_VIEW =
    '${COMMON_WIDGETS}RowExpandedView';
final ROUTES_COMMON_WIDGETS_ROW_TEXT_BASELINE_VIEW =
    '${COMMON_WIDGETS}RowTextBaselineView';
final ROUTES_COMMON_WIDGETS_COLUMN_VIEW = '${COMMON_WIDGETS}ColumnMainView';
final ROUTES_COMMON_WIDGETS_IMAGE_VIEW = '${COMMON_WIDGETS}ImageMainView';
final ROUTES_COMMON_WIDGETS_IMAGE_PROVIDER_VIEW =
    '${COMMON_WIDGETS}ImageProviderView';
final ROUTES_COMMON_WIDGETS_IMAGE_COLOR_VIEW =
    '${COMMON_WIDGETS}ImageColorView';
final ROUTES_COMMON_WIDGETS_IMAGE_LOADING_BUILDER_VIEW =
    '${COMMON_WIDGETS}ImageLoadingBuilderView';
var ykRouter = {
  "yk/YKMain": (context, params) => YKMain(),
  "yk/TestPermission": (context, params) => TestPermission(),
  "yk/TestExitApp": (context, params) => TestExitApp(),
  "yk/Book": (context, params) => DbDemo(),
  "yk/SharedPreferencesDemo": (context, params) => SharedPreferencesDemo(),
  "yk/FirstScreen": (context, params) => FirstScreen(),
  "yk/SecondScreen": (context, params) => SecondScreen(),
  "yk/ListDemo": (context, params) => ListDemo(),
  "yk/DetailsDemo": (context, params) =>
      DetailsDemo(ModalRoute.of(context).settings.arguments),
  "yk/LoginView": (context, params) => LoginPage(),
  "yk/FileDemo": (context, params) => FileDemo(),
  "yk/uiDemo": (context, params) => UIMain(),
  // 组件主页
  ROUTES_WIDGETS_MAIN_VIEW: (context, params) => WidgetsMainView(),
  // 基础组件主页
  ROUTES_COMMON_WIDGETS_MAIN_VIEW: (context, params) => CommonWidgetsMain(),
  // Container主页
  ROUTES_COMMON_WIDGETS_CONTAINER_VIEW: (context, params) =>
      ContainerMainView(),
  // Container 对齐属性
  ROUTES_COMMON_WIDGETS_CONTAINER_ALIGNMENT_VIEW: (context, params) =>
      ContainerAlignmentView(),
  // Container 子容器
  ROUTES_COMMON_WIDGETS_CONTAINER_CHILD_VIEW: (context, params) =>
      ContainerChildView(),
  // Container 内边距
  ROUTES_COMMON_WIDGETS_CONTAINER_PADDING_VIEW: (context, params) =>
      ContainerPaddingView(),
  // Container 外边距
  ROUTES_COMMON_WIDGETS_CONTAINER_MARGIN_VIEW: (context, params) =>
      ContainerMarginView(),
  // Container 装饰
  ROUTES_COMMON_WIDGETS_CONTAINER_DECORATION_VIEW: (context, params) =>
      ContainerDecorationView(),
  // Container 前景装饰
  ROUTES_COMMON_WIDGETS_CONTAINER_FOREGROUND_DECORATION_VIEW:
      (context, params) => ContainerForegroundDecorationView(),
  // Container 约束
  ROUTES_COMMON_WIDGETS_CONTAINER_CONSTRAINTS_VIEW: (context, params) =>
      ContainerConstraintsView(),
  // Container 变换
  ROUTES_COMMON_WIDGETS_CONTAINER_TRANSFORM_VIEW: (context, params) =>
      ContainerTransformView(),
  // Row 主页
  ROUTES_COMMON_WIDGETS_ROW_VIEW: (context, params) => RowMainView(),
  // Row 扩展部件
  ROUTES_COMMON_WIDGETS_ROW_EXPANDED_VIEW: (context, params) =>
      RowExpandedView(),
  // Row 基线对齐
  ROUTES_COMMON_WIDGETS_ROW_TEXT_BASELINE_VIEW: (context, params) =>
      RowTextBaselineView(),
  // Column 主页
  ROUTES_COMMON_WIDGETS_COLUMN_VIEW: (context, params) => ColumnMainView(),
  // 图片主页
  ROUTES_COMMON_WIDGETS_IMAGE_VIEW: (context, params) => ImageMainView(),
  // 图片 加载方式
  ROUTES_COMMON_WIDGETS_IMAGE_PROVIDER_VIEW: (context, params) =>
      ImageProviderView(),
  // 图片 设置颜色与颜色混合
  ROUTES_COMMON_WIDGETS_IMAGE_COLOR_VIEW: (context, params) => ImageColorView(),
  // 图片 设置颜色与颜色混合
  ROUTES_COMMON_WIDGETS_IMAGE_LOADING_BUILDER_VIEW: (context, params) =>
      ImageLoadingBuilderView(),
};
