import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:home_decor/app/data/model/province.dart';

import '../../../core/errors/failure.dart';
import '../../api/api.dart';

class ProvinceRemoteDatasource {
  final RestClient client;
  ProvinceRemoteDatasource({required this.client});

  Future<Either<Failure, List<ResultProvinceModel>>> province() async {
    try {
      final prov = await client.province();
      if (!prov['status']) {
        return Left(Failure(prov['message']));
      } else {
        return Right(List.from(prov['result'])
            .map((e) => ResultProvinceModel.fromJson(e))
            .toList());
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }
}
