import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/search.dart';

part 'search.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class SearchModel extends Search {
  const SearchModel(
      {required int id, required String keyword, required DateTime createdAt})
      : super(id: id, keyword: keyword, createdAt: createdAt);

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}
