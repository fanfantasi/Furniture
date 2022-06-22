// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromoModel _$PromoModelFromJson(Map json) => PromoModel(
      status: json['status'] as bool,
      result: json['result'] == null
          ? null
          : ResultPromoModel.fromJson(
              Map<String, dynamic>.from(json['result'] as Map)),
    );

Map<String, dynamic> _$PromoModelToJson(PromoModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.toJson(),
    };

ResultPromoModel _$ResultPromoModelFromJson(Map<String, dynamic> json) =>
    ResultPromoModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      desc: json['desc'] as String?,
      date: json['date'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ResultPromoModelToJson(ResultPromoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'date': instance.date,
      'image': instance.image,
    };
