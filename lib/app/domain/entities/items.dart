import 'package:equatable/equatable.dart';

import '../../data/model/items.dart';

class Items extends Equatable {
  final bool status;
  final ResultItemsModel? result;
  const Items({required this.status, required this.result});

  @override
  List<Object> get props => [status, result ?? ''];
}

class ResultItems extends Equatable {
  final int? id;
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
  final bool favorite;
  final int? price;
  const ResultItems(
      {this.id,
      this.title,
      this.subtitle,
      this.desc,
      this.link,
      this.status,
      this.active,
      this.view,
      this.ratings,
      this.recommend,
      this.createdAt,
      this.point,
      this.image,
      required this.favorite,
      this.price});

  @override
  List<Object> get props => [
        id!,
        title!,
        subtitle!,
        desc!,
        link!,
        status!,
        active!,
        view!,
        image!,
        ratings!,
        recommend!,
        createdAt!,
        favorite,
        price!,
      ];
}
