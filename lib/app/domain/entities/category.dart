import 'package:equatable/equatable.dart';

import '../../data/model/category.dart';

class Category extends Equatable {
  final bool status;
  final ResultCategoryModel? result;
  const Category({required this.status, required this.result});

  @override
  List<Object> get props => [status, result ?? ''];
}

class ResultCategory extends Equatable {
  final int? categoryid;
  final String? category;
  final String? routes;
  final String? icon;
  final String? banner;
  final int? order;
  const ResultCategory(
      {this.categoryid,
      this.category,
      this.routes,
      this.icon,
      this.banner,
      this.order});

  @override
  List<Object> get props =>
      [categoryid!, category!, routes!, icon!, banner!, order!];
}
