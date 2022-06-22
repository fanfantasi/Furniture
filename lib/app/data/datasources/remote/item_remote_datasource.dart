import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:home_decor/app/data/api/api.dart';

import '../../../core/errors/failure.dart';
import '../../model/items.dart';

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
}