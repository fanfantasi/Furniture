import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/category.dart';
import '../../repositories/category_repository.dart';

class GetRemoteCategory implements UseCase<List<ResultCategory>, NoParams> {
  late CategoryRepository repository;
  GetRemoteCategory(this.repository);

  @override
  Future<Either<Failure, List<ResultCategory>>> call(NoParams params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.categoryRemote();
  }
}
