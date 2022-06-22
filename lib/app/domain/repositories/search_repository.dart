import 'package:dartz/dartz.dart';
import 'package:home_decor/app/core/usecases/usecase.dart';
import 'package:home_decor/app/data/model/search.dart';

import '../../core/errors/failure.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchModel>>> getLocalSearch();
  Future<Either<Failure, bool>> deleteSearch({int? id});
  Future<Either<Failure, bool>> deleteAllSearch();
  Future<Either<Failure, bool>> insertSearch({ParamsSearch params});
  Future<Either<Failure, SearchModel>> getSingleSearch({String? keyword});
}
