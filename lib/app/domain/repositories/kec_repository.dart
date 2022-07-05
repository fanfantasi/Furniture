import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/entities/kec.dart';
import '../../core/errors/failure.dart';

abstract class KecRepository {
  Future<Either<Failure, List<ResultKec>>> kecRemote({int? kdkota});
}
