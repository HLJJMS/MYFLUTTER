import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

//import 'package:flutter_app/android/qfdemo/download_progress_dialog.dart';
import 'dart:math';
import 'dart:collection';
import 'package:permission_handler/permission_handler.dart';
import 'package:package_info/package_info.dart';
import 'package:flutter_app/android/qfdemo/VersionUpgrade.dart';

class upApkDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _upApkDemoState();
  }
}

class _upApkDemoState extends State<upApkDemo> {
  var savepath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('升级'),
      ),
      body: Center(
        child: Text('点击下方按钮检测更新'),
      ),
      floatingActionButton: new Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          //更新按钮
          onPressed: () {
//           VersionUpgrade().executeDownload('https://asks.oss-cn-beijing.aliyuncs.com/ydw/v6_2/ydzb622_6.2.2.apk');
            //检查是否有新版本
            var update = checkUpdate();

            update.then((value) {
//              if (value == null) {
//                //显示已是最新
//                final mySnackBar = SnackBar(
//                  content: new Text('已是最新版本'),
//                  backgroundColor: Colors.blue,
//                  duration: Duration(milliseconds: 500),
//                );
//                Scaffold.of(context).showSnackBar(mySnackBar);
//              } else {
                //显示更新内容
                showUpdate(value['ver'], value['data'], value['url']);
//              }
            });
          },
          tooltip: '点击检测更新',
          child: Text(
            '更新',
          ),
        );
      }),
    );
  }

  ///检查是否有更新
  Future<Map> checkUpdate() async {
    //获取当前版本
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;

    //获取服务器上最新版本
    Map map = new HashMap();
    map['data'] = '1.新增app应用内升级\n2.修复若干个bug';
    map['ver'] = '1.0.1';
    map['url'] =
        'https://ydxffq.oss-cn-hangzhou.aliyuncs.com/ydxffqprod/app/upgrade/v1.1b/xiaoyinhao_1.1.apk';

    //判断如果服务器上版本比当前版本新,则返回最新版本信息
    if ((Random().nextInt(10)) > 3) {
      print('当前版本: ' + version + ',最新版本: ' + map['ver']);
      return map;
    }
    return null;
  }

  ///显示更新内容
  ///[version] 最新版本号
  ///[data] 更新内容
  Future<void> showUpdate(String version, String data, String url) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('发现新版本'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(version),
                Text(''),
                Text('更新内容'),
                Text(data),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('确认'),
              onPressed: () => doUpdate(version, url),
            ),
          ],
        );
      },
    );
  }

  ///执行更新操作
  ///[version] 最新版本号
  doUpdate(String version, String url) async {
    //关闭更新内容提示框
    Navigator.of(context).pop();

    //获取权限
    var per = await checkPermission();
    if (per != null && !per) {
      return null;
    }

    updateApk();
//    //开始更新
//    return showDialog(
//      context: context,
//      barrierDismissible: false, // user must tap button!
////      child: DownloadProgressDialog(version, url),
//    );
  }

  void updateApk() async {
    if (await PermissionHandler()
            .checkPermissionStatus(PermissionGroup.storage) ==
        PermissionStatus.granted) {
      goToDownLoad();
    } else {
      await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      var isShow = await PermissionHandler()
          .shouldShowRequestPermissionRationale(PermissionGroup.storage);
      if (!isShow) {
        goToDownLoad();
      } else {
        await PermissionHandler().openAppSettings();
      }
    }
  }

  var url =
      'https://ydxffq.oss-cn-hangzhou.aliyuncs.com/ydxffqprod/app/upgrade/v1.1b/xiaoyinhao_1.1.apk';

  void goToDownLoad() async {
    Directory directory = await getApplicationDocumentsDirectory();
    if (!await directory.exists()) {
      directory.create();
      print("创建目录文件");
    } else {
      print("存在则不需要创建");
    }
    savepath = directory.path + "xiaoyinhao.apk";
    print(savepath);
    await Dio().download(url, savepath, onReceiveProgress: (count, totle) {
      double percentage =double.parse((count/totle).toString());
      print('下载进度：$percentage');
    }).whenComplete(() {
      Fluttertoast.showToast(msg: "下载成功");
      _installApk();
    });
  }

  ///安装app
  Future<Null> _installApk() async {
    await OpenFile.open(savepath);
  }

  ///检查是否有权限
  checkPermission() async {
    //检查是否已有读写内存权限
    PermissionStatus status = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);

    //判断如果还没拥有读写权限就申请获取权限
    if (status != PermissionStatus.granted) {
      var map = await PermissionHandler()
          .requestPermissions([PermissionGroup.storage]);
      if (map[PermissionGroup.storage] != PermissionStatus.granted) {
        return false;
      }
    }
  }
}
