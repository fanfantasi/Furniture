import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/repositories/address_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../../data/model/address.dart';

class UpdateSingleLocalAddress
    implements UseCase<AddressModel, Tuple2<int, ParamsAddress>> {
  late AddressRepository repository;
  UpdateSingleLocalAddress(this.repository);

  @override
  Future<Either<Failure, AddressModel>> call(params) async {
    return repository.updateAddress(id: params.value1, params: params.value2);
  }
}
