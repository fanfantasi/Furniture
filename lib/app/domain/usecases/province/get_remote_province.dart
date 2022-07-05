import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/entities/province.dart';
import 'package:home_decor/app/domain/repositories/province_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class GetRemoteProvince implements UseCase<List<ResultProvince>, NoParams> {
  late ProvinceRepository repository;
  GetRemoteProvince(this.repository);

  @override
  Future<Either<Failure, List<ResultProvince>>> call(NoParams params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.provinceRemote();
  }
}
