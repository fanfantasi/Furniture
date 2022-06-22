import 'package:dartz/dartz.dart';
import '../../core/errors/failure.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';
import '../datasources/remote/category_remote_datasource.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({required this.remoteDataSource});
  // remote data source
  final CategoryRemoteDatasource remoteDataSource;

  @override
  Future<Either<Failure, List<ResultCategory>>> categoryRemote(
      {String? token}) async {
    try {
      final response = await remoteDataSource.categories();
      return response.fold((failure) => Left(failure), (category) async {
        if (category.isNotEmpty) {
          return Right(category);
        }
        return const Left(Failure('Can not find sliders right now'));
      });
    } on Exception catch (_) {
      return const Left(Failure('Something went wrong'));
    }
  }
}
