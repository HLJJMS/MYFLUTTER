import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../util/permissionsUtil.dart';

class TelOrOtherPage extends StatefulWidget {
  TelOrOtherPage({Key key}) : super(key: key);

  @override
  _TelOrOtherPageState createState() => _TelOrOtherPageState();
}

class _TelOrOtherPageState extends State<TelOrOtherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("权限和拨打电话"),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                getBtn("打电话", () {
                  _tell("17614630038");
                  print("打电话");
                }),
                getBtn("请求相机权限", () {
                  PermissionsUtil.requestPermission(PermissionGroup.camera,
                      boolCallBack: (isGranted) {
                    print(isGranted);
                  }, permissionStatusCallback: (permissionStatu) {
                    print(permissionStatu);
                  }, debug: true);
//              _requestPermission(PermissionGroup.camera);
//              print("请求相机权限");
                }),
                getBtn("请求通讯录权限", () {
                  PermissionsUtil.requestPermission(PermissionGroup.contacts,
                      boolCallBack: (isGranted) {
                    print(isGranted);
                  }, permissionStatusCallback: (permissionStatu) {
                    print(permissionStatu);
                  });
//              _requestPermission(PermissionGroup.contacts);
                  print("请求通讯录权限");
                }),
                getBtn("请求定位权限", () {
                  PermissionsUtil.requestPermission(PermissionGroup.location,
                      boolCallBack: (isGranted) {
                    print(isGranted);
//                        if (isGranted == false){
//                          _openSettings();
//                        }
                  }, permissionStatusCallback: (permissionStatu) {
                    print(permissionStatu);
                  }, debug: true);
//              _requestPermission(PermissionGroup.location);
                  print("请求定位权限");
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future _openSettings() async {
    bool isOpened = await PermissionHandler().openAppSettings();
    print(isOpened);
  }

  ///请求相机权限
  Future _requestPermission(PermissionGroup permissionGroup) async {
    // 申请权限
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([permissionGroup]);
    print(permissions);
    // 查看申请结果
    // 方法1
    PermissionStatus permission = permissions[permissionGroup];
//     方法2
//    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
    switch (permission) {
      case PermissionStatus.denied:
        print("用户拒绝了访问请求的功能的权限");
        bool isOpened = await PermissionHandler().openAppSettings();
        print(isOpened);
        break;
      case PermissionStatus.disabled:
        print("用户授予访问该功能的权限，但该功能已禁用");
        bool isOpened = await PermissionHandler().openAppSettings();
        print(isOpened);
        break;
      case PermissionStatus.granted:
        print("用户授予访问请求的功能的权限");
        break;
      case PermissionStatus.restricted:
        print("用户授予对请求的功能的受限访问权限（仅在iOS上）");
        break;
      default:
        print("未知状态");
    }
  }

  //打电话
  void _tell(String number) async {
    String url = 'tel:' + number;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('不能访问');
    }
  }

  //
  Widget getBtn(String name, VoidCallback pressBack) {
    return FlatButton(
      color: Colors.blue,
      textColor: Colors.white,
      child: Text("$name"),
      onPressed: pressBack,
    );
  }
}
