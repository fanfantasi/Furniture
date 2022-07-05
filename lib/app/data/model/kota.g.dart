// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kota.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KotaModel _$KotaModelFromJson(Map json) => KotaModel(
      status: json['status'] as bool,
      result: json['result'] == null
          ? null
          : ResultKotaModel.fromJson(
              Map<String, dynamic>.from(json['result'] as Map)),
    );

Map<String, dynamic> _$KotaModelToJson(KotaModel instance) => <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.toJson(),
    };

ResultKotaModel _$ResultKotaModelFromJson(Map<String, dynamic> json) =>
    ResultKotaModel(
      id: json['id'] as int?,
      provid: json['provid'] as int?,
      kota: json['kota'] as String?,
    );

Map<String, dynamic> _$ResultKotaModelToJson(ResultKotaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provid': instance.provid,
      'kota': instance.kota,
    };
