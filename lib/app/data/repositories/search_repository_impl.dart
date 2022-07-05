import 'package:home_decor/app/core/usecases/usecase.dart';
import 'package:home_decor/app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:home_decor/app/data/datasources/local/search_local_datasource.dart';
import 'package:home_decor/app/data/model/search.dart';

import '../../domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({required this.localDataSource});
  final SearchDataSource localDataSource;

  @override
  Future<Either<Failure, bool>> deleteAllSearch() async {
    try {
      final bool = await localDataSource.deleteAllSearch();
      return Right(bool);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteSearch({int? id}) async {
    try {
      final bool = await localDataSource.deleteSearch(id: id);
      return Right(bool);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<SearchModel>>> getLocalSearch() async {
    final items = await localDataSource.getSearch();
    return Right(items);
  }

  @override
  Future<Either<Failure, bool>> insertSearch({ParamsSearch? params}) async {
    try {
      final bool = await localDataSource.insertSearch(SearchModel(
          id: params!.id!,
          keyword: params.keyword!,
          createdAt: params.createdAt!));
      return Right(bool);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, SearchModel>> getSingleSearch(
      {String? keyword}) async {
    try {
      final item = await localDataSource.getSingleSearch(keyword: keyword);
      return Right(item);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }
}
