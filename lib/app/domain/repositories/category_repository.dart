import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<ResultCategory>>> categoryRemote();
}
