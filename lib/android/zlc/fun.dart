import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/android/zlc/Container.dart';
import 'package:flutter_app/android/zlc/InheritedWidget.dart';
import 'package:flutter_app/android/zlc/MyPaint.dart';
import 'package:flutter_app/android/zlc/SomeContainer.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class FunPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ExerciseMainPage();
}

class ExerciseMainPage extends State<FunPage> with TickerProviderStateMixin {
  var savepath;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("一些功能实现"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            child: MaterialButton(
              child: Text("拨打电话"),
              onPressed: () {
                getcall();
              },
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: MaterialButton(
              child: Text("获取权限"),
              onPressed: () {
                getCameraPerssion();
              },
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: MaterialButton(
              child: Text("在线升级app"),
              onPressed: () {
                updateApk();
              },
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: MaterialButton(
              child: Text("单击两次返回应用"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyPaintExercise()));
              },
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: MaterialButton(
              child: Text("inheritedWidget的使用"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyInheritedWidget()));
              },
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: MaterialButton(
              child: Text("某些容器类的组件的使用"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyContainerWidget()));
              },
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: MaterialButton(
              child: Text("容器嵌套"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SomeContainerWidget()));
              },
            ),
          ),
        ],
      ),
    );
  }

//打电话权限
  Future getcall() async {
    var permission =
        await PermissionHandler().checkPermissionStatus(PermissionGroup.phone);
    if (permission != PermissionStatus.granted) {
      await PermissionHandler().requestPermissions([PermissionGroup.phone]);
      var isShow = await PermissionHandler()
          .shouldShowRequestPermissionRationale(PermissionGroup.phone);
      if (!isShow) {
        if (PermissionStatus.granted ==
            await PermissionHandler()
                .checkPermissionStatus(PermissionGroup.phone)) {
          launchTelURL("110");
        }
      } else {
        await PermissionHandler().openAppSettings();
      }
    } else {
      launchTelURL("110");
    }
  }

  //获取相机权限
  getCameraPerssion() async {
    if (await PermissionHandler()
            .checkPermissionStatus(PermissionGroup.camera) ==
        PermissionStatus.granted) {
    } else {
      await PermissionHandler().requestPermissions([PermissionGroup.camera]);
      if (!await PermissionHandler()
          .shouldShowRequestPermissionRationale(PermissionGroup.camera)) {
      } else {}
    }
  }

  /// 调起拨号页
  static void launchTelURL(String phone) async {
    String url = 'tel:' + phone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

//下载安装apk
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
      print("count:$count totle:$totle");
    }).whenComplete(() {
      _installApk();
      Fluttertoast.showToast(msg: "下载成功");
    });
  }

  ///安装app
  Future<Null> _installApk() async {
    await OpenFile.open(savepath);
  }

  //调用原生方法与原生进行交互
  getReactMethod() {}
}
