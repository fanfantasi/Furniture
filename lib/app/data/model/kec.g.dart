// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kec.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KecModel _$KecModelFromJson(Map json) => KecModel(
      status: json['status'] as bool,
      result: json['result'] == null
          ? null
          : ResultKecModel.fromJson(
              Map<String, dynamic>.from(json['result'] as Map)),
    );

Map<String, dynamic> _$KecModelToJson(KecModel instance) => <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.toJson(),
    };

ResultKecModel _$ResultKecModelFromJson(Map<String, dynamic> json) =>
    ResultKecModel(
      id: json['id'] as int?,
      kotaid: json['kotaid'] as int?,
      kec: json['kec'] as String?,
    );

Map<String, dynamic> _$ResultKecModelToJson(ResultKecModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kotaid': instance.kotaid,
      'kec': instance.kec,
    };
