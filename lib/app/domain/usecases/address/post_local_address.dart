import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/repositories/address_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class PostSingleLocalAddress implements UseCase<bool, ParamsAddress> {
  late AddressRepository repository;
  PostSingleLocalAddress(this.repository);

  @override
  Future<Either<Failure, bool>> call(params) async {
    return repository.insertAddress(params: params);
  }
}
