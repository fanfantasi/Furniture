import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entities/items.dart';

abstract class ItemsRepository {
  Future<Either<Failure, List<ResultItems>>> referenceRemote({int? page});
  Future<Either<Failure, List<ResultItems>>> recomendationRemote({int? page});
  Future<Either<Failure, List<ResultItems>>> itembycategoryRemote(
      {int? page, int? categoryid});

  Future<Either<Failure, List<ResultItems>>> searchitemsRemote(
      {int? page, String? search});
}
