import 'package:dartz/dartz.dart';
import 'package:home_decor/app/data/model/search.dart';
import 'package:home_decor/app/domain/repositories/search_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class GetLocalSearch implements UseCase<List<SearchModel>, NoParams> {
  late SearchRepository repository;
  GetLocalSearch(this.repository);

  @override
  Future<Either<Failure, List<SearchModel>>> call(NoParams params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.getLocalSearch();
  }
}
