import 'package:dartz/dartz.dart';
import 'package:home_decor/app/data/datasources/remote/index.dart';
import 'package:home_decor/app/domain/entities/promo.dart';
import 'package:home_decor/app/domain/repositories/promo_repository.dart';
import '../../core/errors/failure.dart';

class PromoRepositoryImpl implements PromoRepository {
  PromoRepositoryImpl({required this.remoteDataSource});
  // remote data source
  final PromoRemoteDatasource remoteDataSource;

  @override
  Future<Either<Failure, List<ResultPromo>>> promoRemote(
      {String? token}) async {
    try {
      final response = await remoteDataSource.promo();
      return response.fold((failure) => Left(failure), (promo) async {
        if (promo.isNotEmpty) {
          return Right(promo);
        }
        return const Left(Failure('Can not find promo right now'));
      });
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }
}
