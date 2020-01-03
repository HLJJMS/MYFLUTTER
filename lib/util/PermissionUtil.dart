import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  /// 打开设置页面
  static Future openAppSettings() async {
    bool isOpened = await PermissionHandler().openAppSettings();
    print("打开设置页面${isOpened ? "成功" : "失败"}");
  }

  /// 检查服务状态
  static Future checkServiceStatus(
      PermissionGroup permissionGroup, CheckServiceStatusResult result) async {
    ServiceStatus serviceStatus =
        await PermissionHandler().checkServiceStatus(permissionGroup);
    result(serviceStatus);
  }

  /// 检查权限状态
  static Future checkPermissionStatus(PermissionGroup permissionGroup,
      {CheckPermissionsResult result, CheckPermissionsStatus status}) async {
    PermissionStatus permissionStatus =
        await PermissionHandler().checkPermissionStatus(permissionGroup);
    var checkPermissionsResult;
    if (permissionStatus == PermissionStatus.granted) {
      // 权限请求成功
      checkPermissionsResult = PermissionResult.succeed;
    } else {
      // 权限请求失败 判断能否再次请求
      bool canAsk = await PermissionHandler()
          .shouldShowRequestPermissionRationale(permissionGroup);
      if (canAsk) {
        // 可以再次请求权限
        checkPermissionsResult = PermissionResult.failureCanAsk;
      } else {
        // 不可以再次请求权限，只能到设置中开启
        checkPermissionsResult = PermissionResult.failure;
      }
    }
    if (result != null) result(checkPermissionsResult);
    if (status != null) status(permissionStatus);
  }

  /// 请求权限
  static Future requestPermission(List<PermissionGroup> permissions,
      {RequestPermissionsResult result,
      RequestPermissionsStatus status}) async {
    if (Platform.isIOS) {
      //ios请求权限 逐个请求
      print("PermissionUtil --> IOS系统 进行权限请求");
      for (var permission in permissions) {
        Map<PermissionGroup, PermissionStatus> map =
            await PermissionHandler().requestPermissions([permission]);
      }
    } else if (Platform.isAndroid) {
      //android请求权限 使用列表一次性请求
      print("PermissionUtil --> Android系统 进行权限请求");
      Map<PermissionGroup, PermissionStatus> map =
          await PermissionHandler().requestPermissions(permissions);
    }

    // 用于存放权限请求结果
    Map<PermissionGroup, PermissionResult> requestPermissionsResult = new Map();
    // 用于保存请求权限当前状态
    Map<PermissionGroup, PermissionStatus> requestPermissionsStatus = new Map();
    for (var permissionGroup in permissions) {
      // 获取权限当前状态
      PermissionStatus status =
          await PermissionHandler().checkPermissionStatus(permissionGroup);
      print("PermissionUtil --> 请求权限状态 --> $permissionGroup --> $status");
      // 保存权限当前状态
      requestPermissionsStatus[permissionGroup] = status;
      if (status == PermissionStatus.granted) {
        // 权限请求成功
        requestPermissionsResult[permissionGroup] = PermissionResult.succeed;
      } else {
        // 权限请求失败 判断能否再次请求
        bool canAsk = await PermissionHandler()
            .shouldShowRequestPermissionRationale(permissionGroup);
        print("PermissionUtil --> 请求失败能否再次请求 $canAsk");
        if (canAsk) {
          // 可以再次请求权限
          requestPermissionsResult[permissionGroup] =
              PermissionResult.failureCanAsk;
        } else {
          // 不可以再次请求权限，只能到设置中开启
          requestPermissionsResult[permissionGroup] = PermissionResult.failure;
        }
      }
    }
    if (result != null) result(requestPermissionsResult);
    if (status != null) status(requestPermissionsStatus);
  }
}

/// 检查服务状态结果回调
typedef CheckServiceStatusResult = void Function(ServiceStatus serviceStatus);
typedef RequestPermissionsResult = void Function(
    Map<PermissionGroup, PermissionResult> map);
typedef RequestPermissionsStatus = void Function(
    Map<PermissionGroup, PermissionStatus> map);

typedef CheckPermissionsResult = void Function(PermissionResult result);
typedef CheckPermissionsStatus = void Function(PermissionStatus status);

/// 权限请求结果 成功、失败、失败但可以再次请求
enum PermissionResult { succeed, failure, failureCanAsk }
