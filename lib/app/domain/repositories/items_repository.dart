import 'package:dartz/dartz.dart';
import 'package:home_decor/app/data/model/ratings.dart';
import 'package:home_decor/app/domain/entities/images_item.dart';

import '../../core/errors/failure.dart';
import '../entities/items.dart';

abstract class ItemsRepository {
  Future<Either<Failure, List<ResultItems>>> referenceRemote({int? page});
  Future<Either<Failure, List<ResultItems>>> recomendationRemote({int? page});
  Future<Either<Failure, List<ResultItems>>> itembycategoryRemote(
      {int? page, int? categoryid});
  Future<Either<Failure, List<ResultItems>>> itemrelatedRemote(
      {int? page, int? categoryid, int? itemid});
  Future<Either<Failure, List<ResultItems>>> searchitemsRemote(
      {int? page, String? search});
  Future<Either<Failure, List<ResultImagesItem>>> imagesitem({int? itemid});
  Future<Either<Failure, ResultItems>> itembyid({int? itemid});
  Future<Either<Failure, List<ResultRatingsModel>>> ratingsbyitem(
      {int? page, int? itemid});
}
