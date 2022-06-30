import 'package:hive/hive.dart';

part 'cart.g.dart';

@HiveType(adapterName: 'CartAdapter', typeId: 3)
class CartHive {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? subtitle;

  @HiveField(3)
  String? desc;

  @HiveField(4)
  String? image;

  @HiveField(5)
  int? price;

  @HiveField(6)
  int? point;

  @HiveField(7)
  int? qty;

  @HiveField(8)
  DateTime? createdAt;

  CartHive(
      {this.id,
      this.title,
      this.subtitle,
      this.desc,
      this.image,
      this.price,
      this.point,
      this.qty,
      this.createdAt});
}
