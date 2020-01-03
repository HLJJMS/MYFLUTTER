/* MARK:
 * @Description: 出参拦截器
 * @Author: 陈胜辉
 * @Date: 2019-11-25 13:54:19
 * @Version: 版本号, YYYY-MM-DD
 * @LastEditors: 陈胜辉
 * @LastEditTime: 2019-11-26 16:42:38
 * @Deprecated: 否
 */
import 'package:dio/dio.dart';
import 'package:flutter_app/net_work/base/base_model.dart';

//响应拦截器功能开发
class ResponseInterceptor extends InterceptorsWrapper {
  @override
  Future onError(DioError err) async {
    try {
      //请求失败
      return handleFailModel();
    } catch (e) {
      return handleFailModel();
    }
  }

  Future onResponse(Response response) async {
    try {
      // 如果接口响应成功
      if (response.statusCode == 200) {
        // 回参数据
        Map data = response.data;

        //回参统一处理
        if (data.containsKey('newslist')) {
          data['data'] = data['newslist'];
        }

        // data['data']['order_list'] = [
        //   {'key': '2'},
        //   {'key': '3'},
        // ];

        // TODO 所有接口都有的行为在这里进行分类
        switch (data['code']) {
          //请求成功
          case StatusCode.SUCCESS:
            return ResultModel(
              ResultCode.success,
              response.data,
              response.headers,
            );
            break;
          //登陆错误
          case 300:
            return ResultModel(
              ResultCode.login,
              response.data,
              response.headers,
            );
            break;
          //.....
          default:
        }

        //服务器失败
        return ResultModel(
          ResultCode.error,
          response.data,
          response.headers,
        );
      }
      //请求失败
      return handleFailModel();
    } catch (e) {
      //请求失败
      return handleFailModel();
    }
  }

  // 处理错误
  ResultModel handleFailModel() {
    return ResultModel(
      ResultCode.fail,
      null,
      null,
    );
  }
}
