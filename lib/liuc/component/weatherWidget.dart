import 'package:flutter/material.dart';
import 'package:flutter_app/liuc/model/weatherModel.dart';
import 'package:flutter_app/liuc/provider/CounterModel.dart';
import 'package:provider/provider.dart';

class WeatherWidget extends StatelessWidget {
  // 测试本父子组件间状态管理
  String noticeTxt;

  WeatherWidget({Key key, this.noticeTxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.bold,
    );
    return Consumer<CounterModel>(
      builder: (context, CounterModel counter, _) => Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: 60,
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "今天 ${counter.getWeatherModel?.date} ${counter.getWeatherModel?.week} ${counter.getWeatherModel?.weather} 最高温度:${counter.getWeatherModel?.highest}",
                style: textStyle),
            Text("${counter.getWeatherModel?.tips}", style: textStyle),
            Text(this.noticeTxt ?? "初始化", style: textStyle),
          ],
        ),
      ),
    );
  }
}
