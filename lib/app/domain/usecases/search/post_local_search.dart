import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/repositories/search_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class PostLocalSearch implements UseCase<bool, ParamsSearch> {
  late SearchRepository repository;
  PostLocalSearch(this.repository);

  @override
  Future<Either<Failure, bool>> call(ParamsSearch params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.insertSearch(params: params);
  }
}
