import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/entities/kel.dart';
import '../../core/errors/failure.dart';

abstract class KelRepository {
  Future<Either<Failure, List<ResultKel>>> kelRemote({int? kdkec});
}
