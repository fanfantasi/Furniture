import 'package:home_decor/app/core/usecases/usecase.dart';
import 'package:home_decor/app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:home_decor/app/data/datasources/local/address_local_datasource.dart';
import 'package:home_decor/app/data/model/address.dart';
import 'package:home_decor/app/domain/repositories/address_repository.dart';

class AddressRepositoryImpl implements AddressRepository {
  AddressRepositoryImpl({required this.localDataSource});
  // local data source
  final AddressDataSource localDataSource;

  @override
  Future<Either<Failure, bool>> deleteAddress({int? id}) async {
    try {
      final bool = await localDataSource.deleteAddress(id: id);
      return Right(bool);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAllAddress() async {
    try {
      final bool = await localDataSource.deleteAllAddress();
      return Right(bool);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<AddressModel>>> getLocalAddress() async {
    final address = await localDataSource.getAddress();
    return Right(address);
  }

  @override
  Future<Either<Failure, AddressModel>> getSingleAddress({int? id}) async {
    try {
      final address = await localDataSource.getSingleAddress(id: id);
      return Right(address);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> insertAddress({ParamsAddress? params}) async {
    try {
      final bool = await localDataSource.insertAddress(AddressModel(
          id: params!.id!,
          name: params.name!,
          phone: params.phone!,
          province: params.province!,
          districts: params.districts!,
          subdistricts: params.subdistricts!,
          village: params.village!,
          zipcode: params.zipcode!,
          address: params.address!,
          other: params.other!,
          option: params.option!,
          status: params.status!,
          createdAt: params.createdAt!));
      return Right(bool);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, AddressModel>> updateAddress(
      {int? id, ParamsAddress? params}) async {
    try {
      final address = await localDataSource.updateAddress(
          id: id,
          address: AddressModel(
              id: params!.id!,
              name: params.name!,
              phone: params.phone!,
              province: params.province!,
              districts: params.districts!,
              subdistricts: params.subdistricts!,
              village: params.village!,
              zipcode: params.zipcode!,
              address: params.address!,
              other: params.other!,
              option: params.option!,
              status: params.status!,
              createdAt: params.createdAt!));
      return Right(address);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, AddressModel>> getSingleAddressUtama() async {
    try {
      final address = await localDataSource.getSingleAddressUtama();
      return Right(address);
    } catch (_) {
      return const Left(Failure('Address is Empty'));
    }
  }
}
