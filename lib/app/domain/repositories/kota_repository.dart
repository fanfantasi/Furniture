import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/entities/kota.dart';

import '../../core/errors/failure.dart';

abstract class KotaRepository {
  Future<Either<Failure, List<ResultKota>>> kotaRemote({int? kdprov});
}
