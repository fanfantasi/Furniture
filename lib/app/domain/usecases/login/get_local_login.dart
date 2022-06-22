import 'package:dartz/dartz.dart';
import 'package:home_decor/app/core/errors/failure.dart';
import 'package:home_decor/app/core/usecases/usecase.dart';
import 'package:home_decor/app/domain/entities/login_user.dart';
import 'package:home_decor/app/domain/repositories/login_repository.dart';

class GetLocalLogin implements UseCase<List<Userlogin>, NoParams> {
  late LoginRepository repository;
  GetLocalLogin(this.repository);

  @override
  Future<Either<Failure, List<Userlogin>>> call(NoParams params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.checklogin();
  }
}
