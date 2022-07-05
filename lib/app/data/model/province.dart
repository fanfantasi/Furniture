import 'package:home_decor/app/domain/entities/province.dart';
import 'package:json_annotation/json_annotation.dart';

part 'province.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ProvinceModel extends Province {
  const ProvinceModel(
      {required bool status, required ResultProvinceModel? result})
      : super(status: status, result: result);

  factory ProvinceModel.fromJson(Map<String, dynamic> json) =>
      _$ProvinceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultProvinceModel extends ResultProvince {
  const ResultProvinceModel({int? id, String? prov})
      : super(id: id, prov: prov);

  factory ResultProvinceModel.fromJson(Map<String, dynamic> json) =>
      _$ResultProvinceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultProvinceModelToJson(this);
}
