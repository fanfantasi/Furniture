import 'package:dartz/dartz.dart';
import 'package:home_decor/app/data/model/search.dart';
import 'package:home_decor/app/domain/repositories/search_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class GetSingleLocalSearch implements UseCase<SearchModel, String> {
  late SearchRepository repository;
  GetSingleLocalSearch(this.repository);

  @override
  Future<Either<Failure, SearchModel>> call(params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.getSingleSearch(keyword: params);
  }
}
