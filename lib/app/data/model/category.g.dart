// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map json) => CategoryModel(
      status: json['status'] as bool,
      result: json['result'] == null
          ? null
          : ResultCategoryModel.fromJson(
              Map<String, dynamic>.from(json['result'] as Map)),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.toJson(),
    };

ResultCategoryModel _$ResultCategoryModelFromJson(Map<String, dynamic> json) =>
    ResultCategoryModel(
      categoryid: json['categoryid'] as int?,
      category: json['category'] as String?,
      icon: json['icon'] as String?,
      banner: json['banner'] as String?,
      order: json['order'] as int?,
      routes: json['routes'] as String?,
    );

Map<String, dynamic> _$ResultCategoryModelToJson(
        ResultCategoryModel instance) =>
    <String, dynamic>{
      'categoryid': instance.categoryid,
      'category': instance.category,
      'routes': instance.routes,
      'icon': instance.icon,
      'banner': instance.banner,
      'order': instance.order,
    };
