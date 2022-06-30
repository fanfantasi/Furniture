import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class ParamsFavorite extends Equatable {
  final int? id;
  final int? categoryid;
  final String? title;
  final String? subtitle;
  final String? desc;
  final String? link;
  final int? status;
  final int? active;
  final int? view;
  final String? ratings;
  final String? recommend;
  final String? image;
  final int? point;
  final String? createdAt;
  final int? price;
  final bool? favorite;
  const ParamsFavorite(
      {required this.id,
      required this.categoryid,
      required this.title,
      required this.subtitle,
      required this.desc,
      required this.link,
      required this.status,
      required this.active,
      required this.view,
      required this.ratings,
      required this.recommend,
      required this.image,
      required this.point,
      required this.createdAt,
      required this.price,
      required this.favorite});
  @override
  List<Object> get props => [
        id!,
        categoryid!,
        title!,
        subtitle!,
        desc!,
        link!,
        status!,
        active!,
        view!,
        ratings!,
        recommend!,
        image!,
        point!,
        price!,
        favorite!,
      ];
}

class ParamsSearch extends Equatable {
  final int? id;
  final String? keyword;
  final DateTime? createdAt;
  const ParamsSearch(
      {required this.id, required this.keyword, required this.createdAt});
  @override
  List<Object> get props => [id!, keyword!, createdAt!];
}

class ParamsCart extends Equatable {
  final int? id;
  final String? title;
  final String? subtitle;
  final String? desc;
  final String? image;
  final int? price;
  final int? point;
  final int? qty;
  final DateTime? createdAt;
  const ParamsCart(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.desc,
      required this.image,
      required this.price,
      required this.point,
      required this.qty,
      required this.createdAt});
  @override
  List<Object> get props =>
      [id!, title!, subtitle!, desc!, image!, price!, point!, qty!, createdAt!];
}
