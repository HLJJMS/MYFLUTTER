import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

systemToast() {
  Fluttertoast.showToast(
    msg: "服务器暂无响应，请稍后重试！", // TODO: 以后统计加入配置文件中
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: Colors.black,
    textColor: Colors.white,
  );
}

showToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: Colors.black,
    textColor: Colors.white,
  );
}
