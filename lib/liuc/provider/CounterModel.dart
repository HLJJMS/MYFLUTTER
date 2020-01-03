import 'package:flutter/cupertino.dart';
import 'package:flutter_app/liuc/model/OneModel.dart';
import 'package:flutter_app/liuc/model/weatherModel.dart';

class CounterModel with ChangeNotifier {
  int _count = 0;
  int get value => _count;
  // 天气MODEL
  WeatherModel _weatherModel;
  // 获取天气数据
  WeatherModel get getWeatherModel => _weatherModel;
  // 设置天气数据
  setWeatherMOdel(WeatherModel om) {
    _weatherModel = om;
  }

  // 修改天气提示数据
  void setTips(String tips) {
    _weatherModel.tips = tips;
    notifyListeners();
  }

  // 累计共享count值
  void increment() {
    _count++;
    notifyListeners();
  }
}
