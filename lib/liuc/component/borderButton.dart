/* MARK: 自定义边线按钮
 * @Author: 刘驰
 * @Date: 2019-12-06 10:49:06
 * @Version: v1.0
 * @LastEditors: 刘驰
 * @LastEditTime: 2019-12-06 13:43:56
 * @Deprecated: 否
 * @Example：：：：
 * BorderButton(
    buttonText: "立即注册",
    borderRadius: 8,
    borderWidth: 1,
    onTapCallback: () {
      debugPrint("立即注册");
    }),
 * 
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/mediaUtil.dart';

class BorderButton extends StatefulWidget {
  // 激活状态
  final bool activation;
  // 点击回调方法
  final Function onTapCallback;
  // 按钮文字
  final String buttonText;
  // 按钮文字样式
  final TextStyle buttonStyle;
  // 按钮高度
  final double height;
  // 边线宽度
  final double borderWidth;
  // 按钮边线颜色
  Color borderColor;
  // 按钮禁用颜色
  final Color disabledColor;
  // 按钮内间距
  final EdgeInsetsGeometry padding;
  // 圆角角度
  final double borderRadius;

  BorderButton({
    Key key,
    this.activation = false,
    this.onTapCallback,
    this.buttonText,
    this.buttonStyle,
    this.height,
    this.borderWidth,
    this.borderColor,
    this.disabledColor,
    this.padding,
    this.borderRadius = 8,
  }) : super(key: key);

  @override
  _BorderButtonState createState() => _BorderButtonState();
}

class _BorderButtonState extends State<BorderButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        // 圆角大小
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          // 边线宽度
          width: widget.borderWidth ?? MediaUtil.onePixelWideLine(context),
          // 边线颜色
          color: _changeTextColor(),
        ),
      ),
      child: CupertinoButton(
        // 内间距
        padding: widget.padding ?? EdgeInsets.all(0),

        // 禁止点击时颜色
        // disabledColor: widget.disabledColor ?? Colors.grey.withOpacity(0.3),
        // 点击时的透明度
        pressedOpacity: 1,
        // 按钮点击事件
        onPressed: widget.activation
            ? () {
                // 可用状态
                setState(() {
                  widget.onTapCallback();
                });
              } //禁用状态
            : null,
        child: Text(
          widget.buttonText,
          style: widget.buttonStyle ??
              TextStyle(color: _changeTextColor(), fontSize: 14),
        ),
      ),
    );
  }

  /* MARK: 根据状态显示边线颜色
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Color _changeBorderColor() {
    if (widget.activation) {
      // 可用状态
      return widget.borderColor ?? Theme.of(context).primaryColor;
    } else {
      // 禁用状态
      return widget.disabledColor ?? Colors.grey.withOpacity(0.3);
    }
  }

  /* MARK: 根据状态显示按钮文字颜色
   * @LastEditors: 刘驰
   * @Version: 版本号, YYYY-MM-DD
   * @param {type} 
   * @return: 
   * @Deprecated: 否
   */
  Color _changeTextColor() {
    if (widget.activation) {
      return widget.buttonStyle ?? Theme.of(context).primaryColor;
    } else {
      return widget.disabledColor ?? Colors.grey.withOpacity(0.3);
    }
  }
}
