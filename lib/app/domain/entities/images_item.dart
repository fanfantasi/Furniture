import 'package:equatable/equatable.dart';
import 'package:home_decor/app/data/model/images_item.dart';

class ImagesItem extends Equatable {
  final bool status;
  final ResultImagesItemModel? result;
  const ImagesItem({required this.status, required this.result});

  @override
  List<Object> get props => [status, result ?? ''];
}

class ResultImagesItem extends Equatable {
  final int? id;
  final int? itemid;
  final String? image;
  const ResultImagesItem({this.id, this.itemid, this.image});

  @override
  List<Object> get props => [id!, itemid!, image!];
}
