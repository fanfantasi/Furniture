import 'package:home_decor/app/domain/entities/kel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kel.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class KelModel extends Kel {
  const KelModel({required bool status, required ResultKelModel? result})
      : super(status: status, result: result);

  factory KelModel.fromJson(Map<String, dynamic> json) =>
      _$KelModelFromJson(json);

  Map<String, dynamic> toJson() => _$KelModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultKelModel extends ResultKel {
  const ResultKelModel({int? id, int? kecid, String? kel})
      : super(id: id, kecid: kecid, kel: kel);

  factory ResultKelModel.fromJson(Map<String, dynamic> json) =>
      _$ResultKelModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultKelModelToJson(this);
}
