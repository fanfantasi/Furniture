import 'package:home_decor/app/domain/entities/kec.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kec.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class KecModel extends Kec {
  const KecModel({required bool status, required ResultKecModel? result})
      : super(status: status, result: result);

  factory KecModel.fromJson(Map<String, dynamic> json) =>
      _$KecModelFromJson(json);

  Map<String, dynamic> toJson() => _$KecModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultKecModel extends ResultKec {
  const ResultKecModel({int? id, int? kotaid, String? kec})
      : super(id: id, kotaid: kotaid, kec: kec);

  factory ResultKecModel.fromJson(Map<String, dynamic> json) =>
      _$ResultKecModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultKecModelToJson(this);
}
