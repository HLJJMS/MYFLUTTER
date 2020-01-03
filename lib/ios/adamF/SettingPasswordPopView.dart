import 'package:flutter/material.dart';
import 'package:flutter_app/util/routerUtil.dart';
import 'package:flutter_app/util/theme_utils.dart';
import 'package:flutter_app/util/styles.dart';
import 'package:flutter_app/util/gaps.dart';
import 'package:flutter_app/util/colors.dart';
import 'package:flutter_app/util/load_image.dart';
import 'package:flutter_app/util/toastUtil.dart';

/// design/6店铺-账户/index.html#artboard13
class WithdrawalPasswordSettingDialog extends StatefulWidget {
  @override
  _WithdrawalPasswordSettingDialogState createState() =>
      _WithdrawalPasswordSettingDialogState();
}

class _WithdrawalPasswordSettingDialogState
    extends State<WithdrawalPasswordSettingDialog> {
  var _list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
                decoration: ShapeDecoration(
                    color: Theme.of(context).canvasColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0)))),
                // color: Theme.of(context).canvasColor,
                height: MediaQuery.of(context).size.height * 5.6 / 10.0,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: const Text(
                            "请输入支付密码",
                            // style: TextStyles.textBold18,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff333333),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Positioned(
                          right: 16.0,
                          top: 16.0,
                          bottom: 16.0,
                          child: InkWell(
                            onTap: () => RouterUtil.pop(
                                context), //NavigatorUtils.goBack(context),

                            child: Image.asset(
                              "assets/image/icon_dialog_close.png",
                              width: 11.0,
                              height: 11.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 45.0,
                            margin:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 0.6, color: Colours.text_gray_c),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Row(
                                children: List.generate(_codeList.length,
                                    (i) => _buildInputWidget(i))),
                          ),
                          Gaps.vGap10,
                          Offstage(
                            offstage: true,
                            child: Text(("提现密码不可为连续、重复的数字。"),
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xff333333))),
                          ),
                        ],
                      ),
                    ),
                    Gaps.vGap10,
                    Container(
                      padding: EdgeInsets.fromLTRB(6, 6, 6, 6),
                      // color: Colours.text_gray_c,
                      color: Color.fromRGBO(210, 213, 219, 0.9),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 2.5,
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 6),
                        itemCount: 12,
                        itemBuilder: (_, index) {
                          // final color = ThemeUtils.isDark(context)
                          //     ? Colours.dark_bg_gray
                          //     : Colours.dark_button_text;
                          final color = Color.fromRGBO(210, 213, 219, 0);
                          return Material(
                            borderRadius: BorderRadius.circular(5.0),
                            color: (index == 9 || index == 11)
                                ? color
                                : Colors.white,
                            child: InkWell(
                              child: Center(
                                child: index == 11
                                    ? Image.asset(
                                        "assets/image/del.png",
                                        width: 32.0,
                                      )
                                    : index == 9
                                        ? Gaps.empty
                                        : Text(_list[index].toString(),
                                            style: TextStyle(fontSize: 26.0)),
                              ),
                              onTap: () {
                                if (index == 9) {
                                  return;
                                }
                                if (index == 11) {
                                  if (_index == 0) {
                                    return;
                                  }
                                  _codeList[_index - 1] = "";
                                  _index--;
                                  setState(() {});
                                  return;
                                }
                                _codeList[_index] = _list[index].toString();
                                _index++;
                                if (_index == _codeList.length) {
                                  String code = "";
                                  for (int i = 0; i < _codeList.length; i++) {
                                    code = code + _codeList[i];
                                  }
                                  // Toast.show("密码：$code");
                                  showToast("密码：$code");
                                  _index = 0;
                                  for (int i = 0; i < _codeList.length; i++) {
                                    _codeList[i] = "";
                                  }
                                }
                                setState(() {});
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  int _index = 0;
  List<String> _codeList = ["", "", "", "", "", ""];

  Widget _buildInputWidget(int p) {
    return Expanded(
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: p != 5
                  ? Border(
                      right: Divider.createBorderSide(context,
                          color: Colours.text_gray_c, width: 0.6),
                    )
                  : null),
          child: Text(
            _codeList[p].isEmpty ? "" : "●",
            style: TextStyles.textSize12,
          )),
    );
  }
}
