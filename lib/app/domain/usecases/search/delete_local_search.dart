import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/repositories/search_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class DeleteLocalSearch implements UseCase<bool, int> {
  late SearchRepository repository;
  DeleteLocalSearch(this.repository);

  @override
  Future<Either<Failure, bool>> call(params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.deleteSearch(id: params);
  }
}
