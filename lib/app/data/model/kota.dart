import 'package:home_decor/app/domain/entities/kota.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kota.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class KotaModel extends Kota {
  const KotaModel({required bool status, required ResultKotaModel? result})
      : super(status: status, result: result);

  factory KotaModel.fromJson(Map<String, dynamic> json) =>
      _$KotaModelFromJson(json);

  Map<String, dynamic> toJson() => _$KotaModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultKotaModel extends ResultKota {
  const ResultKotaModel({int? id, int? provid, String? kota})
      : super(id: id, provid: provid, kota: kota);

  factory ResultKotaModel.fromJson(Map<String, dynamic> json) =>
      _$ResultKotaModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultKotaModelToJson(this);
}
