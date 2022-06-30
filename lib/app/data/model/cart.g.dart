// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map json) => CartModel(
      id: json['id'] as int,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      desc: json['desc'] as String,
      image: json['image'] as String,
      price: json['price'] as int,
      point: json['point'] as int,
      qty: json['qty'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'desc': instance.desc,
      'image': instance.image,
      'price': instance.price,
      'point': instance.point,
      'qty': instance.qty,
      'createdAt': instance.createdAt.toIso8601String(),
    };
