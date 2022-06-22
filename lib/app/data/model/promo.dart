import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/promo.dart';

part 'promo.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class PromoModel extends Promo {
  const PromoModel({required bool status, required ResultPromoModel? result})
      : super(status: status, result: result);

  factory PromoModel.fromJson(Map<String, dynamic> json) =>
      _$PromoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PromoModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultPromoModel extends ResultPromo {
  const ResultPromoModel(
      {int? id, String? title, String? desc, String? date, String? image})
      : super(id: id, title: title, desc: desc, date: date, image: image);

  factory ResultPromoModel.fromJson(Map<String, dynamic> json) =>
      _$ResultPromoModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultPromoModelToJson(this);
}
