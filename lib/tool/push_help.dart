/* 推送帮助类
 * @LastEditors: 陈胜辉
 * @Version: 版本号, YYYY-MM-DD
 * @param {type}
 * @return:
 * @Deprecated: 否
 */

import 'package:flutter/services.dart';
import 'package:flutter_app/util/toastUtil.dart';
import 'package:flutter_app/tool/channel_name.dart';

typedef _CallBack = void Function(String message);

/* MARK:推送监听
 * @LastEditors: 陈胜辉
 * @Version: 版本号, YYYY-MM-DD
 * @param {type}
 * @return:
 * @Deprecated: 否
 */
EventChannel listenPush(_CallBack callback) {
  //持续通信
  EventChannel eventChannel = EventChannel(ChannelName.push);
  eventChannel.receiveBroadcastStream('发送参数').listen((Object message) {
    callback(message);
  }, onError: (Object error) {
    showToast('推送监听出错');
  });

  return eventChannel;
}
