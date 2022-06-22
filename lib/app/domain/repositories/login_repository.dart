import 'package:dartz/dartz.dart';
import 'package:home_decor/app/core/errors/failure.dart';

import '../entities/login_user.dart';

abstract class LoginRepository {
  Future<Either<Failure, List<Userlogin>>> login(
      {String? email, String? password});
  Future<Either<Failure, List<Userlogin>>> registration(
      {String? uid, String? email, String? displayname, String? avatar});
  Future<Either<Failure, List<Userlogin>>> checklogin();
  Future<Either<Failure, bool>> logout();
}
