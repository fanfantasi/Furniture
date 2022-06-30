import 'package:hive/hive.dart';

part 'favorite.g.dart';

@HiveType(adapterName: 'FavoriteAdapter', typeId: 7)
class FavoriteHive {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? subtitle;

  @HiveField(3)
  String? desc;

  @HiveField(4)
  String? link;

  @HiveField(6)
  int? status;

  @HiveField(7)
  int? active;

  @HiveField(8)
  String? image;

  @HiveField(9)
  int? view;

  @HiveField(10)
  String? rating;

  @HiveField(11)
  String? recommend;

  @HiveField(12)
  int? point;

  @HiveField(13)
  int? price;

  @HiveField(14)
  bool? favorite;

  @HiveField(15)
  int? categoryid;

  FavoriteHive(
      {this.id,
      this.title,
      this.subtitle,
      this.desc,
      this.link,
      this.status,
      this.active,
      this.image,
      this.view,
      this.rating,
      this.recommend,
      this.point,
      this.price,
      this.favorite,
      this.categoryid});
}
