import 'package:equatable/equatable.dart';

import '../../data/model/promo.dart';

class Promo extends Equatable {
  final bool status;
  final ResultPromoModel? result;
  const Promo({required this.status, required this.result});

  @override
  List<Object> get props => [status, result ?? ''];
}

class ResultPromo extends Equatable {
  final int? id;
  final String? title;
  final String? desc;
  final String? date;
  final String? image;
  const ResultPromo({this.id, this.title, this.desc, this.date, this.image});

  @override
  List<Object> get props => [id!, title!, desc!, date!, image!];
}
