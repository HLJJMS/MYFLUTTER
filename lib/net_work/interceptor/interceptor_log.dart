/* MARK:
 * @Description: 日志拦截器
 * @Author: 陈胜辉
 * @Date: 2019-11-25 13:54:19
 * @Version: 版本号, YYYY-MM-DD
 * @LastEditors: 陈胜辉
 * @LastEditTime: 2019-11-25 14:54:11
 * @Deprecated: 否
 */
import 'package:dio/dio.dart';

// TODO: 打印以后需要处理为只有DEBUG模式下打印
class LogsInterceptor extends InterceptorsWrapper {
  //开始请求
  @override
  Future onRequest(RequestOptions options) {
    print("请求baseUrl：${options.baseUrl}");
    print("请求url：${options.path}");
    print("请求头: " + options.headers.toString());
    if (options.data != null) {
      print('请求参数: ' + options.data.toString());
    }
    return super.onRequest(options);
  }

  //请求结束
  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  //请求错误
  @override
  Future onError(DioError e) {
    print("请求异常: " + e.toString());
    print("请求异常信息: " + e.response?.toString() ?? "");
    return super.onError(e);
  }
}
