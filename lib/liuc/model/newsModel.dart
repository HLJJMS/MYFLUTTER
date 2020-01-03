//新闻模型类
class NewsModel {
  final String ctime; // 发布时间
  final String title; // 新闻标题
  final String description; // 新闻描述
  final String picUrl; // 新闻图片
  final String url; // 新闻详情url地址

  NewsModel({this.ctime, this.title, this.description, this.picUrl, this.url});

  // 工厂方法JSON转换模型对象
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
        ctime: json['ctime'],
        title: json['title'],
        description: json['description'],
        picUrl: json['picUrl'],
        url: json['url']);
  }
}
