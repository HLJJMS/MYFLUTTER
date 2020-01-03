class OneModel {
  final int oneid; // id
  final String word; // 文字
  final String wordfrom; // 标题
  final String imgurl; // 新闻图片地址
  final String imgauthor; // 新闻图片作者
  final String date; // 新闻日期

  OneModel(
      {this.oneid = 0,
      this.word = "",
      this.wordfrom = "",
      this.imgurl = "",
      this.imgauthor = "",
      this.date = ""});

  // 工厂方法JSON转换模型对象
  factory OneModel.fromJson(Map<String, dynamic> json) {
    return OneModel(
        oneid: json['oneid'],
        word: json['word'],
        wordfrom: json['wordfrom'],
        imgurl: json['imgurl'],
        imgauthor: json['imgauthor'],
        date: json['date']);
  }
}
