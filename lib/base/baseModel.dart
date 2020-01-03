//状态模型类
import 'package:dio/dio.dart';

// 自定义拦截器拦截处理
// 接口返回数据模型
class ResultModel {
  // 状态码
  final ResultCode code;
  // 成功加载数据
  final Map<String, dynamic> data;

  final Headers headers;

  ResultModel(this.code, this.data, this.headers);
}

// 根据返回封装的数据模型
class DataModel {
  final int code;
  final String msg;
  dynamic data;

  DataModel({this.code, this.msg, this.data});

  //TODO 工厂方法JSON转换模型对象
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      code: json['code'],
      msg: json['msg'],
      data: json['data'],
    );
  }
}

//所有接口统一错误码
// 状态码类型
enum ResultCode {
  success, // 成功
  fail, // 请求失败
  error, // 服务器错误
  login, // 登陆错误
  upgrade, // 升级
}

// 状态错误码
class StatusCode {
  //正常返回是
  static const SUCCESS = 200;
  //内部服务器错误
  static const ERROR = 100;
  // 接口暂时关闭维护中，请注意相关公告
  static const CLOSE = 110;
  // IP请求来源受限
  static const LIMITED = 120;
  // API调用频率超限
  static const FREQUENCY = 130;

  /* ----- 业务错误码 ----- */
  // key错误或为空
  static const KEY_ERROR = 230;
  // 缺少key参数
  static const NO_KEY = 240;
  // 数据查询失败
  static const QUERY_ERROR = 240;
}
