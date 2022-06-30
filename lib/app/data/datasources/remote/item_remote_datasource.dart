import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:home_decor/app/data/api/api.dart';
import 'package:home_decor/app/data/model/images_item.dart';

import '../../../core/errors/failure.dart';
import '../../model/items.dart';
import '../../model/ratings.dart';

class ItemsRemoteDatasource {
  final RestClient client;
  ItemsRemoteDatasource({required this.client});

  Future<Either<Failure, List<ResultItemsModel>>> items({int? page}) async {
    try {
      final items = await client.itemsreference(page: page);
      if (!items['status']) {
        return Left(Failure(items['message']));
      } else {
        return Right(List.from(items['result'])
            .map((e) => ResultItemsModel.fromJson(e))
            .toList());
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }

  Future<Either<Failure, List<ResultItemsModel>>> itemsbycategory(
      {int? page, int? categoryid}) async {
    try {
      final items =
          await client.itemsbycategory(page: page, categoryid: categoryid);
      if (!items['status']) {
        return Left(Failure(items['message']));
      } else {
        return Right(List.from(items['result'])
            .map((e) => ResultItemsModel.fromJson(e))
            .toList());
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }

  Future<Either<Failure, List<ResultItemsModel>>> itemsrelated(
      {int? page, int? categoryid, int? itemid}) async {
    try {
      final items = await client.itemsrelated(
          page: page, categoryid: categoryid, itemid: itemid);
      if (!items['status']) {
        return Left(Failure(items['message']));
      } else {
        return Right(List.from(items['result'])
            .map((e) => ResultItemsModel.fromJson(e))
            .toList());
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }

  Future<Either<Failure, List<ResultItemsModel>>> recomendation(
      {int? page}) async {
    try {
      final items = await client.itemsrecomendation(page: page);
      if (!items['status']) {
        return Left(Failure(items['message']));
      } else {
        return Right(List.from(items['result'])
            .map((e) => ResultItemsModel.fromJson(e))
            .toList());
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }

  Future<Either<Failure, List<ResultItemsModel>>> searchItems(
      {int? page, String? search}) async {
    try {
      final items = await client.itemsearch(page: page, search: search);
      if (!items['status']) {
        return Left(Failure(items['message']));
      } else {
        return Right(List.from(items['result'])
            .map((e) => ResultItemsModel.fromJson(e))
            .toList());
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }

  Future<Either<Failure, List<ResultImagesItemModel>>> imagesitem(
      {int? itemid}) async {
    try {
      final items = await client.imagesitem(itemid: itemid);
      if (!items['status']) {
        return Left(Failure(items['message']));
      } else {
        return Right(List.from(items['result'])
            .map((e) => ResultImagesItemModel.fromJson(e))
            .toList());
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }

  Future<Either<Failure, ResultItemsModel>> itembyid({int? itemid}) async {
    try {
      final items = await client.itembyid(itemid: itemid);
      if (!items['status']) {
        return Left(Failure(items['message']));
      } else {
        return Right(ResultItemsModel.fromJson(items['result']));
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }

  Future<Either<Failure, List<ResultRatingsModel>>> ratingsbyitem(
      {int? page, int? itemid}) async {
    try {
      final items = await client.ratingbyitem(page: page, itemid: itemid);
      if (!items['status']) {
        return Left(Failure(items['message']));
      } else {
        return Right(List.from(items['result'])
            .map((e) => ResultRatingsModel.fromJson(e))
            .toList());
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }
}
