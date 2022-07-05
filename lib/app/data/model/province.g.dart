// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProvinceModel _$ProvinceModelFromJson(Map json) => ProvinceModel(
      status: json['status'] as bool,
      result: json['result'] == null
          ? null
          : ResultProvinceModel.fromJson(
              Map<String, dynamic>.from(json['result'] as Map)),
    );

Map<String, dynamic> _$ProvinceModelToJson(ProvinceModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.toJson(),
    };

ResultProvinceModel _$ResultProvinceModelFromJson(Map<String, dynamic> json) =>
    ResultProvinceModel(
      id: json['id'] as int?,
      prov: json['prov'] as String?,
    );

Map<String, dynamic> _$ResultProvinceModelToJson(
        ResultProvinceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'prov': instance.prov,
    };
