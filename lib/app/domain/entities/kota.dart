import 'package:equatable/equatable.dart';
import 'package:home_decor/app/data/model/kota.dart';

class Kota extends Equatable {
  final bool status;
  final ResultKotaModel? result;
  const Kota({required this.status, required this.result});

  @override
  List<Object> get props => [status, result ?? ''];
}

class ResultKota extends Equatable {
  final int? id;
  final int? provid;
  final String? kota;
  const ResultKota({this.id, this.provid, this.kota});

  @override
  List<Object> get props => [id!, provid!, kota!];
}
