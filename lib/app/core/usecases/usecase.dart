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
  final bool? isChecked;
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
      required this.isChecked,
      required this.createdAt});
  @override
  List<Object> get props =>
      [id!, title!, subtitle!, desc!, image!, price!, point!, qty!, createdAt!];
}

class ParamsAddress extends Equatable {
  final int? id;
  final String? name;
  final String? phone;
  final String? province;
  final String? districts;
  final String? subdistricts;
  final String? village;
  final String? zipcode;
  final String? address;
  final String? other;
  final int? option;
  final int? status;
  final DateTime? createdAt;
  const ParamsAddress(
      {required this.id,
      required this.name,
      required this.phone,
      required this.province,
      required this.districts,
      required this.subdistricts,
      required this.village,
      required this.zipcode,
      required this.address,
      required this.other,
      required this.option,
      required this.status,
      required this.createdAt});
  @override
  List<Object> get props => [
        id!,
        name!,
        phone!,
        province!,
        districts!,
        subdistricts!,
        village!,
        zipcode!,
        address!,
        other!,
        option!,
        status!,
        createdAt!
      ];
}
