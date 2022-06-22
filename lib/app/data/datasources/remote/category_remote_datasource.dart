import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/errors/failure.dart';
import '../../api/api.dart';
import '../../model/category.dart';

class CategoryRemoteDatasource {
  final RestClient client;
  CategoryRemoteDatasource({required this.client});

  Future<Either<Failure, List<ResultCategoryModel>>> categories() async {
    try {
      final sliders = await client.category();
      if (!sliders['status']) {
        return Left(Failure(sliders['message']));
      } else {
        return Right(List.from(sliders['result'])
            .map((e) => ResultCategoryModel.fromJson(e))
            .toList());
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }
}
