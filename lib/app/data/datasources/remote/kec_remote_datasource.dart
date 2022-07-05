import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:home_decor/app/data/model/kec.dart';

import '../../../core/errors/failure.dart';
import '../../api/api.dart';

class KecRemoteDatasource {
  final RestClient client;
  KecRemoteDatasource({required this.client});

  Future<Either<Failure, List<ResultKecModel>>> kec({int? kdkota}) async {
    try {
      final prov = await client.kec(kdkota: kdkota);
      if (!prov['status']) {
        return Left(Failure(prov['message']));
      } else {
        return Right(List.from(prov['result'])
            .map((e) => ResultKecModel.fromJson(e))
            .toList());
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }
}
