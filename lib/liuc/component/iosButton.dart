/* MARK: 自定义IOS风格按钮
 * @Author: 刘驰
 * @Date: 2019-12-06 09:39:33
 * @Version: v1.0
 * @LastEditors: 刘驰
 * @LastEditTime: 2019-12-06 13:44:38
 * @Deprecated: 否
 * @Example：：：：
 * IosButton(
    buttonText: "登录",
    borderRadius: 8,
    onTapCallback: () {
      debugPrint("立即注册");
    }), 
 * 
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosButton extends StatefulWidget {
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
  // 按钮颜色
  final Color color;
  // 按钮禁用颜色
  final Color disabledColor;
  // 按钮内间距
  final EdgeInsetsGeometry padding;
  // 圆角角度
  final double borderRadius;

  IosButton({
    Key key,
    this.activation = true,
    this.onTapCallback,
    this.buttonText,
    this.buttonStyle,
    this.height,
    this.color,
    this.disabledColor,
    this.padding,
    this.borderRadius = 8,
  }) : super(key: key);

  @override
  _IosButtonState createState() => _IosButtonState();
}

class _IosButtonState extends State<IosButton> {
  @override
  Widget build(BuildContext context) {
    // debugPrint("iosButton build.....");
    return Container(
      height: widget.height,
      child: CupertinoButton(
        // 圆角大小
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
        // 按钮内间距
        padding: widget.padding ?? EdgeInsets.all(0),
        // 按钮颜色
        color: widget.color ?? Theme.of(context).primaryColor,
        // 禁止点击时颜色
        disabledColor: widget.disabledColor ?? Colors.grey.withOpacity(0.3),
        // 点击时的透明度
        pressedOpacity: 1,
        child: Text(
          widget.buttonText,
          style: widget.buttonStyle,
        ),
        // 按钮点击事件
        onPressed: widget.activation
            ? () {
                // 可用状态
                setState(() {
                  widget.onTapCallback();
                });
              }
            : null, //禁止状态
      ),
    );
  }
}
