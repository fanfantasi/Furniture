import 'package:dartz/dartz.dart';
import 'package:home_decor/app/data/model/address.dart';
import 'package:home_decor/app/domain/repositories/address_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class GetSingleLocalAddressUtama implements UseCase<AddressModel, NoParams> {
  late AddressRepository repository;
  GetSingleLocalAddressUtama(this.repository);

  @override
  Future<Either<Failure, AddressModel>> call(NoParams params) async {
    return repository.getSingleAddressUtama();
  }
}
