import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:home_decor/app/data/model/promo.dart';

import '../../../core/errors/failure.dart';
import '../../api/api.dart';

class PromoRemoteDatasource {
  final RestClient client;
  PromoRemoteDatasource({required this.client});

  Future<Either<Failure, List<ResultPromoModel>>> promo() async {
    try {
      final sliders = await client.promo();
      if (!sliders['status']) {
        return Left(Failure(sliders['message']));
      } else {
        return Right(List.from(sliders['result'])
            .map((e) => ResultPromoModel.fromJson(e))
            .toList());
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }
}
