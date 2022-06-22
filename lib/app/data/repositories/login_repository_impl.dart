import 'package:home_decor/app/core/errors/failure.dart';
import 'package:home_decor/app/data/datasources/local/login_local_datasource.dart';
import 'package:home_decor/app/domain/entities/login_user.dart';
import 'package:home_decor/app/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginLocalDataSource localDatasource;
  LoginRepositoryImpl({required this.localDatasource});

  @override
  Future<Either<Failure, List<Userlogin>>> checklogin() async {
    final users = await localDatasource.getUser();
    if (users.isEmpty) {
      return const Left(Failure('No internet connection'));
    }
    return Right(users);
  }

  @override
  Future<Either<Failure, List<Userlogin>>> login(
      {String? email, String? password}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> logout() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Userlogin>>> registration(
      {String? uid, String? email, String? displayname, String? avatar}) {
    throw UnimplementedError();
  }
}
