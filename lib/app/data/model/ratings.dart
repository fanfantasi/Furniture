import 'package:home_decor/app/domain/entities/ratings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ratings.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class RatingsModel extends Ratings {
  const RatingsModel(
      {required bool status, required ResultRatingsModel? result})
      : super(status: status, result: result);

  factory RatingsModel.fromJson(Map<String, dynamic> json) =>
      _$RatingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultRatingsModel extends ResultRatings {
  const ResultRatingsModel(
      {int? id,
      String? displayname,
      String? avatar,
      String? rating,
      String? features,
      String? quality,
      String? review,
      DateTime? createdAt})
      : super(
            id: id,
            displayname: displayname,
            avatar: avatar,
            rating: rating,
            features: features,
            quality: quality,
            review: review,
            createdAt: createdAt);

  factory ResultRatingsModel.fromJson(Map<String, dynamic> json) =>
      _$ResultRatingsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultRatingsModelToJson(this);
}
