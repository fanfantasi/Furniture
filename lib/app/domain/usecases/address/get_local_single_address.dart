import 'package:dartz/dartz.dart';
import 'package:home_decor/app/data/model/address.dart';
import 'package:home_decor/app/domain/repositories/address_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class GetSingleLocalAddress implements UseCase<AddressModel, int> {
  late AddressRepository repository;
  GetSingleLocalAddress(this.repository);

  @override
  Future<Either<Failure, AddressModel>> call(params) async {
    return repository.getSingleAddress(id: params);
  }
}
