import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/entities/ratings.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/items_repository.dart';

class GetRemoteRatings
    implements UseCase<List<ResultRatings>, Tuple2<int, int>> {
  late ItemsRepository repository;
  GetRemoteRatings(this.repository);

  @override
  Future<Either<Failure, List<ResultRatings>>> call(params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.ratingsbyitem(page: params.value1, itemid: params.value2);
  }
}
