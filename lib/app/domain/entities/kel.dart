import 'package:equatable/equatable.dart';
import 'package:home_decor/app/data/model/kel.dart';

class Kel extends Equatable {
  final bool status;
  final ResultKelModel? result;
  const Kel({required this.status, required this.result});

  @override
  List<Object> get props => [status, result ?? ''];
}

class ResultKel extends Equatable {
  final int? id;
  final int? kecid;
  final String? kel;
  const ResultKel({this.id, this.kecid, this.kel});

  @override
  List<Object> get props => [id!, kecid!, kel!];
}
