// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KelModel _$KelModelFromJson(Map json) => KelModel(
      status: json['status'] as bool,
      result: json['result'] == null
          ? null
          : ResultKelModel.fromJson(
              Map<String, dynamic>.from(json['result'] as Map)),
    );

Map<String, dynamic> _$KelModelToJson(KelModel instance) => <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.toJson(),
    };

ResultKelModel _$ResultKelModelFromJson(Map<String, dynamic> json) =>
    ResultKelModel(
      id: json['id'] as int?,
      kecid: json['kecid'] as int?,
      kel: json['kel'] as String?,
    );

Map<String, dynamic> _$ResultKelModelToJson(ResultKelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kecid': instance.kecid,
      'kel': instance.kel,
    };
