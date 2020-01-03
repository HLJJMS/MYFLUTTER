// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderList _$OrderListFromJson(Map<String, dynamic> json) {
  return OrderList(
    order_count: json['order_count'] as int,
    order_list: (json['order_list'] as List)
        ?.map((e) =>
            e == null ? null : OrderDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OrderListToJson(OrderList instance) => <String, dynamic>{
      'order_count': instance.order_count,
      'order_list': instance.order_list,
    };
