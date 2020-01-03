
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

typedef BoolCallback = void Function(bool isGranted);
typedef PermissionStatusCallback = void Function(PermissionStatus permission);
class PermissionsUtil{
  /*
  *
  *
  *
  * */
  static Future<PermissionStatus> requestPermission(PermissionGroup permissionGroup,{BoolCallback boolCallBack,PermissionStatusCallback permissionStatusCallback,bool debug = false}) async {

    // 申请权限
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler().requestPermissions([permissionGroup]);
    if (debug == true){
       print(permissions);
    }
    // 查看申请结果
    // 方法1
//    PermissionStatus permission = permissions[permissionGroup];
//     方法2
//    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
    PermissionsUtil.checkPermissionStatus(permissionGroup,
        boolCallBack:boolCallBack,
        permissionStatusCallback:permissionStatusCallback,
      debug: debug
    );
  }
  static Future checkPermissionStatus(PermissionGroup permissionGroup,{BoolCallback boolCallBack,PermissionStatusCallback permissionStatusCallback,bool debug = false}) async {
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(permissionGroup);
    switch (permission){
      case PermissionStatus.denied:
        if (debug == true){
          print("用户拒绝了访问请求的功能的权限");
        }
        boolCallBack(false);
        break;
      case PermissionStatus.disabled:
        if (debug == true){
          print("用户授予访问该功能的权限，但该功能已禁用");
        }
        boolCallBack(false);
        break;
      case PermissionStatus.granted:
        if (debug == true){
          print("用户授予访问请求的功能的权限");
        }
        boolCallBack(true);
        break;
      case PermissionStatus.restricted:
        if (debug == true){
          print("用户授予对请求的功能的受限访问权限（仅在iOS上）");
        }
        boolCallBack(false);
        break;
      default:
        if (debug == true){
          print("未知状态");
        }
        boolCallBack(false);
    }
    permissionStatusCallback(permission);
  }

}