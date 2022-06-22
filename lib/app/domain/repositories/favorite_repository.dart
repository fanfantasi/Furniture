import 'package:dartz/dartz.dart';
import 'package:home_decor/app/core/usecases/usecase.dart';

import '../../core/errors/failure.dart';
import '../entities/items.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, ResultItems>> singlefavoriteLocal({int? id});
  Future<Either<Failure, List<ResultItems>>> getLocalFavorite();
  Future<Either<Failure, bool>> deleteFavorite({int? id});
  Future<Either<Failure, bool>> insertFavorite({ParamsFavorite params});
}
