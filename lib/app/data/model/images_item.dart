import 'package:home_decor/app/domain/entities/images_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'images_item.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ImagesItemModel extends ImagesItem {
  const ImagesItemModel(
      {required bool status, required ResultImagesItemModel? result})
      : super(status: status, result: result);

  factory ImagesItemModel.fromJson(Map<String, dynamic> json) =>
      _$ImagesItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesItemModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultImagesItemModel extends ResultImagesItem {
  const ResultImagesItemModel({int? id, int? itemid, String? image})
      : super(id: id, itemid: itemid, image: image);

  factory ResultImagesItemModel.fromJson(Map<String, dynamic> json) =>
      _$ResultImagesItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultImagesItemModelToJson(this);
}
