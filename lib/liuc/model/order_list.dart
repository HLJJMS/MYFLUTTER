import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_app/liuc/model/order_detail.dart';
part 'order_list.g.dart';

@JsonSerializable()
class OrderList {
  int order_count;
  List<OrderDetail> order_list;

  OrderList({
    this.order_count,
    this.order_list,
  });
  //反序列化
  factory OrderList.fromJson(Map<String, dynamic> json) {
    return _$OrderListFromJson(json);
  }

  //序列化
  Map<String, dynamic> toJson() {
    return _$OrderListToJson(this);
  }
}
