import 'package:flutter_app/util/httpUtil.dart';

// 环境
enum _Env {
  //开发
  dev,
  //测试
  test,
  //发布
  production,
  //自定义
  custom,
}

// 整体环境
mixin _Server_env {
  //切换环境 设置这里
  static const _Env type = _Env.dev;
}

// JAVA地址
mixin _Server_java {
  static const type = sunkuo;

  static const dev = 'http://api.tianapi.com/';
  static const sunkuo = 'http://192.168.1.1';
  static const sunxuyang = 'http://192.168.1.2';
}

// PHP地址
mixin _Server_php {
  static const type = liuchao;

  static const dev = 'http://192.168.1.1';
  static const liuchao = 'http://192.168.1.1';
  static const tongzhiqiang = 'http://192.168.1.2';
}

// 协议地址
mixin _Server_agreement {
  static const type = xieyi;

  static const dev = 'http://192.168.1.1';
  static const xieyi = 'http://192.168.1.1';
  static const tongzhiqiang = 'http://192.168.1.2';
}

// H5地址
mixin _Server_h5 {
  static const type = gaoqiang;

  static const dev = 'http://192.168.1.1';
  static const gaoqiang = 'http://192.168.1.1';
  static const jisheng = 'http://192.168.1.2';
}

class Config {
  //超时
  static const CONNECT_TIMEOUT = 15000;

  //获取JAVA主机地址
  static String getJAVA() {
    switch (_Server_env.type) {
      case _Env.dev:
        return _Server_java.dev;
      case _Env.test:
        return _Server_java.dev;
      case _Env.production:
        return _Server_java.dev;
      default:
        //默认自定义环境
        return _Server_java.type;
    }
  }

  //获取PHP主机地址
  static String getPHP() {
    switch (_Server_env.type) {
      case _Env.dev:
        return _Server_php.dev;
      case _Env.test:
        return _Server_php.dev;
      case _Env.production:
        return _Server_php.dev;
      default:
        //默认自定义环境
        return _Server_php.type;
    }
  }

  //获取协议主机地址
  static String getAgreement() {
    switch (_Server_env.type) {
      case _Env.dev:
        return _Server_agreement.dev;
      case _Env.test:
        return _Server_agreement.dev;
      case _Env.production:
        return _Server_agreement.dev;
      default:
        //默认自定义环境
        return _Server_agreement.type;
    }
  }

  //获取H5主机地址
  static String getH5() {
    switch (_Server_env.type) {
      case _Env.dev:
        return _Server_h5.dev;
      case _Env.test:
        return _Server_h5.dev;
      case _Env.production:
        return _Server_h5.dev;
      default:
        //默认自定义环境
        return _Server_h5.type;
    }
  }
}
