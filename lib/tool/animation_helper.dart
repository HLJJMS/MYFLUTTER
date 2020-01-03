import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

/* MARK: 动画效果从右到左
 * @LastEditors: 陈胜辉
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
SlideTransition rightToLeft(Animation<double> animation, Widget child) {
  return SlideTransition(
    // 从右到左
    position: Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(animation),
    child: child,
  );
}
