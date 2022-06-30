// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingsModel _$RatingsModelFromJson(Map json) => RatingsModel(
      status: json['status'] as bool,
      result: json['result'] == null
          ? null
          : ResultRatingsModel.fromJson(
              Map<String, dynamic>.from(json['result'] as Map)),
    );

Map<String, dynamic> _$RatingsModelToJson(RatingsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.toJson(),
    };

ResultRatingsModel _$ResultRatingsModelFromJson(Map<String, dynamic> json) =>
    ResultRatingsModel(
      id: json['id'] as int?,
      displayname: json['displayname'] as String?,
      avatar: json['avatar'] as String?,
      rating: json['rating'] as String?,
      features: json['features'] as String?,
      quality: json['quality'] as String?,
      review: json['review'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ResultRatingsModelToJson(ResultRatingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayname': instance.displayname,
      'avatar': instance.avatar,
      'rating': instance.rating,
      'features': instance.features,
      'quality': instance.quality,
      'review': instance.review,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
