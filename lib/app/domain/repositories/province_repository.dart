import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/entities/province.dart';

import '../../core/errors/failure.dart';

abstract class ProvinceRepository {
  Future<Either<Failure, List<ResultProvince>>> provinceRemote();
}
