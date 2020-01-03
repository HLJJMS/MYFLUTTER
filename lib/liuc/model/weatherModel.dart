class WeatherModel {
  final String date; // 时间
  final String week; // 星期
  final String weather; // 天气
  final String weatherimg; // 天气图标
  final String lowest; // 最高温

  final String highest; // 最低温
  final String wind; // 风向
  final String windspeed; // 风力
  final int air; // 空气质量指数
  final String air_level; // 空气质量等级
  String tips; // 天气状况提示

  WeatherModel({
    this.date,
    this.week,
    this.weather,
    this.weatherimg,
    this.lowest,
    this.highest,
    this.wind,
    this.windspeed,
    this.air,
    this.air_level,
    this.tips,
  });

  // 工厂方法JSON转换模型对象
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      date: json['date'],
      week: json['week'],
      weather: json['weather'],
      weatherimg: json['weatherimg'],
      lowest: json['lowest'],
      highest: json['highest'],
      wind: json['wind'],
      windspeed: json['windspeed'],
      air: json['air'],
      air_level: json['air_level'],
      tips: json['tips'],
    );
  }
}
