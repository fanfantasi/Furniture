import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:home_decor/app/data/model/kota.dart';

import '../../../core/errors/failure.dart';
import '../../api/api.dart';

class KotaRemoteDatasource {
  final RestClient client;
  KotaRemoteDatasource({required this.client});

  Future<Either<Failure, List<ResultKotaModel>>> kota({int? kdprov}) async {
    try {
      final prov = await client.kota(kdprov: kdprov);
      if (!prov['status']) {
        return Left(Failure(prov['message']));
      } else {
        return Right(List.from(prov['result'])
            .map((e) => ResultKotaModel.fromJson(e))
            .toList());
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }
}
