import 'package:home_decor/app/domain/entities/items.dart';
import 'package:json_annotation/json_annotation.dart';

part 'items.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ItemsModel extends Items {
  const ItemsModel({required bool status, required ResultItemsModel? result})
      : super(status: status, result: result);

  factory ItemsModel.fromJson(Map<String, dynamic> json) =>
      _$ItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultItemsModel extends ResultItems {
  const ResultItemsModel(
      {int? id,
      int? categoryid,
      String? title,
      String? subtitle,
      String? desc,
      String? link,
      int? status,
      int? active,
      int? view,
      String? image,
      String? ratings,
      String? recommend,
      int? point,
      String? createdAt,
      int? price,
      bool favorite = false})
      : super(
            id: id,
            categoryid: categoryid,
            title: title,
            subtitle: subtitle,
            desc: desc,
            link: link,
            status: status,
            active: active,
            view: view,
            image: image,
            ratings: ratings,
            recommend: recommend,
            point: point,
            createdAt: createdAt,
            price: price,
            favorite: favorite);

  factory ResultItemsModel.fromJson(Map<String, dynamic> json) =>
      _$ResultItemsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultItemsModelToJson(this);
}
