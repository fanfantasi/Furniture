// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map json) => SearchModel(
      id: json['id'] as int,
      keyword: json['keyword'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'keyword': instance.keyword,
      'createdAt': instance.createdAt.toIso8601String(),
    };
