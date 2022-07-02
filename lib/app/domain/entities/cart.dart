import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final int id;
  final String title;
  final String subtitle;
  final String desc;
  final String image;
  final int price;
  final int point;
  final int qty;
  final bool isChecked;
  final DateTime createdAt;
  const Cart(
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
  List<Object> get props => [
        id,
        title,
        subtitle,
        desc,
        image,
        price,
        point,
        qty,
        isChecked,
        createdAt
      ];
}
