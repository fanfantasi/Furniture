import 'package:dartz/dartz.dart';
import 'package:home_decor/app/data/datasources/remote/province_remote_datasource.dart';
import 'package:home_decor/app/domain/entities/province.dart';
import 'package:home_decor/app/domain/repositories/province_repository.dart';
import '../../core/errors/failure.dart';

class ProvinceRepositoryImpl implements ProvinceRepository {
  ProvinceRepositoryImpl({required this.remoteDataSource});
  // remote data source
  final ProvinceRemoteDatasource remoteDataSource;

  @override
  Future<Either<Failure, List<ResultProvince>>> provinceRemote() async {
    try {
      final response = await remoteDataSource.province();
      return response.fold((failure) => Left(failure), (prov) async {
        if (prov.isNotEmpty) {
          return Right(prov);
        }
        return const Left(Failure('Can not find province right now'));
      });
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }
}
