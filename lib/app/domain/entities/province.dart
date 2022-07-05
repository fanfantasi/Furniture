import 'package:equatable/equatable.dart';
import 'package:home_decor/app/data/model/province.dart';

class Province extends Equatable {
  final bool status;
  final ResultProvinceModel? result;
  const Province({required this.status, required this.result});

  @override
  List<Object> get props => [status, result ?? ''];
}

class ResultProvince extends Equatable {
  final int? id;
  final String? prov;
  const ResultProvince({this.id, this.prov});

  @override
  List<Object> get props => [id!, prov!];
}
