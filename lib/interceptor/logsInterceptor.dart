import 'package:dio/dio.dart';

// TODO: 打印以后需要处理为只有DEBUG模式下打印
class LogsInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print(
        "=========================================接口请求 开始====================================================");
    print("请求baseUrl：${options.baseUrl}");
    print("请求url：${options.path}");
    print("请求头: " + options.headers.toString());
    print("请求方式: " + options.method.toString());
    if (options.data != null) {
      print('请求data参数: ' + options.data.toString());
    }
    if (options.queryParameters != null) {
      print('请求queryParameters参数: ' + options.queryParameters.toString());
    }
    print(
        "=========================================接口请求 结束====================================================");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError e) {
    print("请求异常: " + e.toString());
    print("请求异常信息: " + e.response?.toString() ?? "");
    return super.onError(e);
  }
}
