import 'package:dio/dio.dart';
import 'package:flutter_app/base/baseModel.dart';

//响应拦截器功能开发
class ResponseInterceptor extends InterceptorsWrapper {
  @override
  // Future onRequest(RequestOptions options) async {
  //   try {
  //     print('1');
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future onError(DioError err) async {
    print(err);
    //请求失败
    return ResultModel(
      ResultCode.fail,
      null,
      null,
    );
  }

  Future onResponse(Response response) async {
    // RequestOptions option = response.request;
    try {
      // 如果接口响应成功
      if (response.statusCode == 200) {
        int code = response.data['code'];

        switch (code) {
          //请求成功
          case StatusCode.SUCCESS:
            return ResultModel(
              ResultCode.success,
              response.data,
              response.headers,
            );
            break;
          default:
            //接口统一错误
            switch (response.data['code']) {
              //登陆错误
              case StatusCode.KEY_ERROR:
              case StatusCode.NO_KEY:
                return ResultModel(
                  ResultCode.login,
                  response.data,
                  response.headers,
                );
                break;
              default:
                //服务器失败
                return ResultModel(
                  ResultCode.error,
                  response.data,
                  response.headers,
                );
            }
        }
      }
      //请求失败
      return ResultModel(
        ResultCode.fail,
        null,
        response.headers,
      );
    } catch (e) {
      //请求失败
      print("响应异常: " + e.toString());
      return ResultModel(
        ResultCode.fail,
        null,
        response.headers,
      );
    }
  }
}
