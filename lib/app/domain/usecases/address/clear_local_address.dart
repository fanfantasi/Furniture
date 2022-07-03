import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/repositories/address_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class ClearLocalAddress implements UseCase<bool, NoParams> {
  late AddressRepository repository;
  ClearLocalAddress(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return repository.deleteAllAddress();
  }
}
