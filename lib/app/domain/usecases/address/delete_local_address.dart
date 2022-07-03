import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/repositories/address_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class DeleteLocalAddress implements UseCase<bool, int> {
  late AddressRepository repository;
  DeleteLocalAddress(this.repository);

  @override
  Future<Either<Failure, bool>> call(params) async {
    return repository.deleteAddress(id: params);
  }
}
