/* MARK: 屏幕相关工具类
 * @Description: 类描述
 * @Author: 刘驰
 * @Date: 2019-12-05 10:06:33
 * @Version: v1.0, 2019-12-05
 * @LastEditors: 刘驰
 * @LastEditTime: 2019-12-05 10:09:17
 * @Deprecated: 否
 */
import 'package:flutter/widgets.dart';

class MediaUtil {
  /* MARK: 根据不同屏幕获取1个逻辑像素宽的线
   * @LastEditors: 刘驰
   * @Version: v1.0, 2019-12-05
   * @param {type} 
   * @return: e
   * @Deprecated: 否
   */
  static double onePixelWideLine(BuildContext context) {
    return 1 / MediaQuery.of(context).devicePixelRatio;
  }

  /* MARK: 获取屏幕宽度
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /* MARK: 获取屏幕高度
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
