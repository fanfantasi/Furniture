import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:home_decor/app/data/model/kel.dart';

import '../../../core/errors/failure.dart';
import '../../api/api.dart';

class KelRemoteDatasource {
  final RestClient client;
  KelRemoteDatasource({required this.client});

  Future<Either<Failure, List<ResultKelModel>>> kec({int? kdkec}) async {
    try {
      final prov = await client.kel(kdkec: kdkec);
      if (!prov['status']) {
        return Left(Failure(prov['message']));
      } else {
        return Right(List.from(prov['result'])
            .map((e) => ResultKelModel.fromJson(e))
            .toList());
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }
}
