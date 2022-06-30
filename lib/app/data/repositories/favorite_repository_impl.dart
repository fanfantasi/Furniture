import 'package:home_decor/app/data/model/items.dart';
import 'package:home_decor/app/domain/entities/items.dart';

import 'package:home_decor/app/core/usecases/usecase.dart';

import 'package:home_decor/app/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/favorite_repository.dart';
import '../datasources/local/favorite_local_datasource.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  FavoriteRepositoryImpl({required this.localDataSource});
  // local data source
  final FavoriteDataSource localDataSource;

  @override
  Future<Either<Failure, bool>> deleteFavorite({int? id}) async {
    try {
      final bool = await localDataSource.deleteFavorite(id: id);
      return Right(bool);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<ResultItems>>> getLocalFavorite() async {
    final items = await localDataSource.getFavorite();
    return Right(items);
  }

  @override
  Future<Either<Failure, bool>> insertFavorite({ParamsFavorite? params}) async {
    try {
      final bool = await localDataSource.insertFavorite(ResultItemsModel(
          id: params!.id,
          categoryid: params.categoryid,
          title: params.title,
          subtitle: params.subtitle,
          desc: params.desc,
          link: params.link,
          status: params.status,
          active: params.active,
          view: params.view,
          ratings: params.ratings,
          recommend: params.recommend,
          image: params.image,
          point: params.point,
          createdAt: params.createdAt,
          price: params.price,
          favorite: true));
      return Right(bool);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, ResultItems>> singlefavoriteLocal({int? id}) async {
    try {
      final item = await localDataSource.getSingleFavorite(id: id);
      return Right(item);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }
}
