import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/repositories/search_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class ClearLocalSearch implements UseCase<bool, NoParams> {
  late SearchRepository repository;
  ClearLocalSearch(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.deleteAllSearch();
  }
}
