import 'package:equatable/equatable.dart';
import 'package:home_decor/app/data/model/kec.dart';

class Kec extends Equatable {
  final bool status;
  final ResultKecModel? result;
  const Kec({required this.status, required this.result});

  @override
  List<Object> get props => [status, result ?? ''];
}

class ResultKec extends Equatable {
  final int? id;
  final int? kotaid;
  final String? kec;
  const ResultKec({this.id, this.kotaid, this.kec});

  @override
  List<Object> get props => [id!, kotaid!, kec!];
}
