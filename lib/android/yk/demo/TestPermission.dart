import 'package:flutter/material.dart';
import 'package:flutter_app/util/PermissionUtil.dart';
import 'package:permission_handler/permission_handler.dart';

class TestPermission extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TestPermissionState();
  }
}

class TestPermissionState extends State<TestPermission> {
  String msg = "显示请求结果：\n";
  String msg2 = "";

  void _showMsg(String msg) {
    setState(() {
      msg2 = msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("权限"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            msg + msg2,
          ),
          MaterialButton(
            child: new Text("请求许可"),
            elevation: 5.0,
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              PermissionUtil.requestPermission([PermissionGroup.phone],
                  result: (map) {
                if (map[PermissionGroup.phone] == PermissionResult.succeed) {
                  _showMsg("请求权限成功");
                } else if (map[PermissionGroup.phone] ==
                    PermissionResult.failure) {
                  _showMsg("请求权限失败，禁止再次请求,需要到设置中进行设置。\n失败权限" +
                      PermissionGroup.phone.toString());
                } else {
                  _showMsg("请求权限失败，可以再次请求。\n失败权限：" +
                      PermissionGroup.phone.toString());
                }
              });
            },
          ),
          MaterialButton(
            child: new Text(
              "申请权限拒绝后，判断是否可以再次申请此权限(仅限Android)",
              textAlign: TextAlign.center,
            ),
            elevation: 5.0,
            padding: EdgeInsets.all(8.0),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () async {
              bool isShown = await PermissionHandler()
                  .shouldShowRequestPermissionRationale(PermissionGroup.contacts);
              if (isShown) {
                _showMsg("可以再次申请此权限");
              } else {
                _showMsg("无法再次申请此权限，需要到设置中手动设置");
              }
            },
          ),
          Text("这在IOS上总是返回false，权限请求成功后调用此方法也会返回false，即无法再次申请。"),
          MaterialButton(
            child: new Text("检查定位（GPS）服务状态"),
            elevation: 5.0,
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              PermissionUtil.checkServiceStatus(PermissionGroup.location, (serviceStatus){
                switch (serviceStatus) {
                  case ServiceStatus.disabled:
                    _showMsg("相关服务已被禁用");
                    break;
                  case ServiceStatus.enabled:
                    _showMsg("相关服务已启用");
                    break;
                  case ServiceStatus.notApplicable:
                    _showMsg("没有找到要检查的服务");
                    break;
                  case ServiceStatus.unknown:
                    _showMsg("要检查的服务状态未知");
                    break;
                }
              });
            },
          ),
          Text("开关手机的GPS开关，即可测试"),
          MaterialButton(
            child: new Text("打开应用程序设置页面"),
            elevation: 5.0,
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () async {
              bool isOpened = await PermissionHandler().openAppSettings();
              _showMsg("打开应用程序设置结果：" + isOpened.toString());
            },
          ),
        ],
      ),
    );
  }
}
