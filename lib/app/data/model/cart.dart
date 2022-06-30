import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/cart.dart';

part 'cart.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class CartModel extends Cart {
  const CartModel(
      {required int id,
      required String title,
      required String subtitle,
      required String desc,
      required String image,
      required int price,
      required int point,
      required int qty,
      required DateTime createdAt})
      : super(
            id: id,
            title: title,
            subtitle: subtitle,
            desc: desc,
            image: image,
            price: price,
            point: point,
            qty: qty,
            createdAt: createdAt);

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
