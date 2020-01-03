import 'package:json_annotation/json_annotation.dart';
part 'order_detail.g.dart';

@JsonSerializable()
class OrderDetail {
  String key;

  OrderDetail({
    this.key,
  });
  //反序列化
  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return _$OrderDetailFromJson(json);
  }

  //序列化
  Map<String, dynamic> toJson() {
    return _$OrderDetailToJson(this);
  }
}
