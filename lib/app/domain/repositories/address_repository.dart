import 'package:dartz/dartz.dart';
import 'package:home_decor/app/core/usecases/usecase.dart';
import 'package:home_decor/app/data/model/address.dart';

import '../../core/errors/failure.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<AddressModel>>> getLocalAddress();
  Future<Either<Failure, bool>> deleteAddress({int? id});
  Future<Either<Failure, bool>> deleteAllAddress();
  Future<Either<Failure, bool>> insertAddress({ParamsAddress params});
  Future<Either<Failure, AddressModel>> getSingleAddress({int? id});
  Future<Either<Failure, AddressModel>> getSingleAddressUtama();
  Future<Either<Failure, AddressModel>> updateAddress(
      {int? id, ParamsAddress params});
}
