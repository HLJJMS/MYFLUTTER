import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/net_work/base/toast_util.dart';
import 'package:flutter_app/util/routerUtil.dart';
import 'package:flutter_app/util/custom_widget.dart';

class CSHPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            top: true,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  CupertinoButton(
                    padding: const EdgeInsets.all(0),
                    borderRadius: BorderRadius.circular(0),
                    pressedOpacity: 0.8,
                    color: Colors.blue,
                    minSize: 0,
                    child: Container(
                      width: 90,
                      height: 35,
                      alignment: Alignment.center,
                      child: Text(
                        '注册页',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    onPressed: () {
                      RouterUtil.navigateTo(
                        context,
                        RouterName.cshReg +
                            RouterUtil.handleParams({
                              'param': '1234',
                              'title': '标题',
                            }),
                        block: ((value) {
                          if (value != null) {
                            showToast(value);
                          }
                        }),
                      );
                    },
                  ),
                  FlatButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text('导航栏'),
                    onPressed: () {
                      RouterUtil.navigateTo(context, RouterName.cshNav);
                    },
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text('布局'),
                    onPressed: () {
                      RouterUtil.navigateTo(context, RouterName.cshLayout);
                    },
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text('动画'),
                    onPressed: () {
                      RouterUtil.navigateTo(context, RouterName.cshAnimated);
                    },
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text('列悬浮'),
                    onPressed: () {
                      RouterUtil.navigateTo(context, RouterName.cshColumnList);
                    },
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text('行悬浮'),
                    onPressed: () {
                      RouterUtil.navigateTo(context, RouterName.cshRowList);
                    },
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text('自定义标签页'),
                    onPressed: () {
                      RouterUtil.navigateTo(context, RouterName.cshTable);
                    },
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Text('分页'),
                    onPressed: () {
                      RouterUtil.navigateTo(context, RouterName.cshPaging);
                    },
                  ),
                ],
              ),
            ),
          ),
          CustomNav(
            middleText: '陈胜辉',
          ),
        ],
      ),
    );
  }
}
