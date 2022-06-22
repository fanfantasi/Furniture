// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsModel _$ItemsModelFromJson(Map json) => ItemsModel(
      status: json['status'] as bool,
      result: json['result'] == null
          ? null
          : ResultItemsModel.fromJson(
              Map<String, dynamic>.from(json['result'] as Map)),
    );

Map<String, dynamic> _$ItemsModelToJson(ItemsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.toJson(),
    };

ResultItemsModel _$ResultItemsModelFromJson(Map<String, dynamic> json) =>
    ResultItemsModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      desc: json['desc'] as String?,
      link: json['link'] as String?,
      status: json['status'] as int?,
      active: json['active'] as int?,
      view: json['view'] as int?,
      image: json['image'] as String?,
      ratings: json['ratings'] as String?,
      recommend: json['recommend'] as String?,
      point: json['point'] as int?,
      createdAt: json['createdAt'] as String?,
      price: json['price'] as int?,
      favorite: json['favorite'] as bool? ?? false,
    );

Map<String, dynamic> _$ResultItemsModelToJson(ResultItemsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'desc': instance.desc,
      'link': instance.link,
      'status': instance.status,
      'active': instance.active,
      'view': instance.view,
      'ratings': instance.ratings,
      'recommend': instance.recommend,
      'image': instance.image,
      'point': instance.point,
      'createdAt': instance.createdAt,
      'favorite': instance.favorite,
      'price': instance.price,
    };
