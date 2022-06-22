import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/category.dart';

part 'category.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class CategoryModel extends Category {
  const CategoryModel(
      {required bool status, required ResultCategoryModel? result})
      : super(status: status, result: result);

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultCategoryModel extends ResultCategory {
  const ResultCategoryModel(
      {int? categoryid,
      String? category,
      String? icon,
      String? banner,
      int? order,
      String? routes})
      : super(
            categoryid: categoryid,
            category: category,
            icon: icon,
            banner: banner,
            order: order,
            routes: routes);

  factory ResultCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ResultCategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultCategoryModelToJson(this);
}
