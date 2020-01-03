import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/dimens.dart';
import 'package:flutter_app/util/routerUtil.dart';
import 'package:flutter_app/util/theme_utils.dart';
import 'package:flutter_app/util/styles.dart';
import 'package:flutter_app/util/gaps.dart';
import 'package:flutter_app/util/colors.dart';

class UpdateDialog extends StatefulWidget {
  Function onPressClick; // 立即升级按钮点击事件

  UpdateDialog({Function this.onPressClick});

  @override
  State<StatefulWidget> createState() {
    return _UpdateDialogState(onPressClick);
  }

  // @override
  // _UpdateDialogState createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  Function onPressClick; // 立即升级按钮点击事件
  _UpdateDialogState(this.onPressClick);

  CancelToken _cancelToken = CancelToken();
  bool _isDownload = false;
  double _value = 0;
  double progressValue = 0;

  @override
  void dispose() {
    if (!_cancelToken.isCancelled && _value != 1) {
      _cancelToken.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return WillPopScope(
      onWillPop: () async {
        /// 使用false禁止返回键返回，达到强制升级目的
        return true;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  // borderRadius: BorderRadius.circular(20.0),
                ),
                width: 280.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      height: 145.0,
                      width: 280.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        // borderRadius: const BorderRadius.only(
                        //     topLeft: const Radius.circular(8.0),
                        //     topRight: const Radius.circular(8.0)),
                        image: DecorationImage(
                          image: AssetImage("assets/image/update_head.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: _versionUI(context),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: const Radius.circular(3.0),
                            bottomRight: const Radius.circular(3.0)),
                      ),
                      // color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          _titleUI(context),
                          _detailMessageUI(context),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10.0,
                                left: 15.0,
                                right: 15.0,
                                top: 10.0),
                            child: _isDownload
                                ? _androidUI(context)
                                : _iosUI(context, primaryColor),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          )),
    );
  }

/////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
/* MARK: 版本号
 * @LastEditors: 张龙江
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
  Widget _versionUI(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
      alignment: Alignment.center,
      color: Colors.transparent,
      width: 135,
      child: Text(
        "版本 v1.1",
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.normal,
            color: Color(0xffFFFFFF)),
      ),
    );
  }

/* MARK: 标题头
 * @LastEditors: 张龙江
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
  Widget _titleUI(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 16.0),
      child: const Text("新版本更新", style: TextStyles.textBold14),
    );
  }

/* MARK: 详细内容
 * @LastEditors: 张龙江
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */
  Widget _detailMessageUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Container(
        color: Colors.white,
        height: 100,
        width: 280,
        child: SingleChildScrollView(
          //滑动的方向 Axis.vertical为垂直方向滑动，Axis.horizontal 为水平方向
          scrollDirection: Axis.vertical,
          //true 滑动到底部
          reverse: false,
          padding: EdgeInsets.all(0),
////滑动到底部回弹效果
          physics: BouncingScrollPhysics(),
          child: Text(
            "1.又双叒修复了一大堆bug。\n\n2.祭天了多名程序猿。",
            style: TextStyles.textGray12,
          ),
        ),
      ),
    );
  }

/* MARK:  安卓进度条
 * @LastEditors: 张龙江
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */

  Widget _androidUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: SizedBox(
            height: 4.0,
            width: 280.0,
            // 圆角矩形剪裁（`ClipRRect`）组件，使用圆角矩形剪辑其子项的组件。
            child: ClipRRect(
              // 边界半径（`borderRadius`）属性，圆角的边界半径。
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
              child: LinearProgressIndicator(
                value: progressValue == 0 ? 0.3 : 0.6,
                backgroundColor: Color(0xffF4F4F4),
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4F78FD)),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Text(
            "升级中 88%···",
            style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.normal,
                color: Color(0xff365AF7)),
          ),
        )
      ],
    );
  }

/* MARK:  ios 
 * @LastEditors: 张龙江
 * @Version: 版本号, YYYY-MM-DD
 * @param {type} 
 * @return: 
 * @Deprecated: 否
 */

  Widget _iosUI(BuildContext context, Color primaryColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: 110.0,
          height: 36.0,
          child: FlatButton(
            onPressed: () {
              RouterUtil.pop(context);
            },
            textColor: primaryColor,
            color: Colors.transparent,
            disabledTextColor: Colors.white,
            disabledColor: Colours.text_gray_c,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  color: primaryColor,
                  width: 0.8,
                )),
            child: Text(
              "残忍拒绝",
              style: TextStyle(fontSize: Dimens.font_sp16),
            ),
          ),
        ),
        Container(
          width: 110.0,
          height: 36.0,
          child: FlatButton(
            onPressed: () {
              if (defaultTargetPlatform == TargetPlatform.iOS) {
                RouterUtil.pop(context);
                print("这里有一个 跳转AppStore 的一个方法");
              } else {
                setState(() {
                  _isDownload = true;
                });
                print("这里有一个 下载app 的一个方法");
              }
            },
            textColor: Colors.white,
            color: primaryColor,
            disabledTextColor: Colors.white,
            disabledColor: Colours.text_gray_c,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Text(
              "立即更新",
              style: TextStyle(fontSize: Dimens.font_sp16),
            ),
          ),
        )
      ],
    );
  }
}
