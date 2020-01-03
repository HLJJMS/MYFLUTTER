/* MARK: mytab监听类
 * @Author: 刘驰
 * @Date: 2019-12-18 13:20:26
 * @Version: 版本号, YYYY-MM-DD
 * @LastEditors: 刘驰
 * @LastEditTime: 2019-12-18 15:05:03
 * @Deprecated: 否
 */
import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/page/tabBar/myTabScreen.dart';

class MyTabController extends ChangeNotifier {
  // 当然选中索引
  int index = 0;
  // 拖拽状态
  TabDragStatus tabDragStatus;

  /* MARK: 拖拽页面事件
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {
   *  changeIndex 拖拽页面索引
   *  TabDragStatus 拖拽事件状态
   * } 
   * @return: 
   * @Deprecated: 否
   */
  void changePage(int changeIndex, TabDragStatus ts) {
    index = changeIndex;
    tabDragStatus = ts;
    notifyListeners();
  }
}
