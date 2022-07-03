import 'package:dartz/dartz.dart';
import 'package:home_decor/app/data/model/address.dart';
import 'package:home_decor/app/domain/repositories/address_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class GetLocalAddress implements UseCase<List<AddressModel>, NoParams> {
  late AddressRepository repository;
  GetLocalAddress(this.repository);

  @override
  Future<Either<Failure, List<AddressModel>>> call(NoParams params) async {
    return repository.getLocalAddress();
  }
}
