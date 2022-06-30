import 'package:home_decor/app/domain/entities/images_item.dart';
import 'package:home_decor/app/domain/entities/items.dart';
import 'package:home_decor/app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/repositories/items_repository.dart';

import '../datasources/remote/index.dart';

class ItemsRepositoryImpl extends ItemsRepository {
  ItemsRepositoryImpl({required this.remoteDataSource});
  // remote data source
  final ItemsRemoteDatasource remoteDataSource;

  @override
  Future<Either<Failure, List<ResultItems>>> referenceRemote(
      {int? page}) async {
    try {
      final response = await remoteDataSource.items(page: page);
      return response.fold((failure) => Left(failure), (items) async {
        return Right(items);
      });
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, List<ResultItems>>> itembycategoryRemote(
      {int? page, int? categoryid}) async {
    try {
      final response = await remoteDataSource.itemsbycategory(
          page: page, categoryid: categoryid);
      return response.fold((failure) => Left(failure), (items) async {
        return Right(items);
      });
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, List<ResultItems>>> searchitemsRemote(
      {int? page, String? search}) async {
    try {
      final response =
          await remoteDataSource.searchItems(page: page, search: search);
      return response.fold((failure) => Left(failure), (items) async {
        return Right(items);
      });
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, List<ResultItems>>> recomendationRemote(
      {int? page}) async {
    try {
      final response = await remoteDataSource.recomendation(page: page);
      return response.fold((failure) => Left(failure), (items) async {
        return Right(items);
      });
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, List<ResultItems>>> itemrelatedRemote(
      {int? page, int? categoryid, int? itemid}) async {
    try {
      final response = await remoteDataSource.itemsrelated(
          page: page, categoryid: categoryid, itemid: itemid);
      return response.fold((failure) => Left(failure), (items) async {
        return Right(items);
      });
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, List<ResultImagesItem>>> imagesitem(
      {int? itemid}) async {
    try {
      final response = await remoteDataSource.imagesitem(itemid: itemid);
      return response.fold((failure) => Left(failure), (items) async {
        return Right(items);
      });
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }

  @override
  Future<Either<Failure, ResultItems>> itembyid({int? itemid}) async {
    try {
      final response = await remoteDataSource.itembyid(itemid: itemid);
      return response.fold((failure) => Left(failure), (items) async {
        return Right(items);
      });
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }
}
