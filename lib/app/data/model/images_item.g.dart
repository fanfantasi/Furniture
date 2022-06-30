// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagesItemModel _$ImagesItemModelFromJson(Map json) => ImagesItemModel(
      status: json['status'] as bool,
      result: json['result'] == null
          ? null
          : ResultImagesItemModel.fromJson(
              Map<String, dynamic>.from(json['result'] as Map)),
    );

Map<String, dynamic> _$ImagesItemModelToJson(ImagesItemModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.toJson(),
    };

ResultImagesItemModel _$ResultImagesItemModelFromJson(
        Map<String, dynamic> json) =>
    ResultImagesItemModel(
      id: json['id'] as int?,
      itemid: json['itemid'] as int?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$ResultImagesItemModelToJson(
        ResultImagesItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemid': instance.itemid,
      'image': instance.image,
    };
