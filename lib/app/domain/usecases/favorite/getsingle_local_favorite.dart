import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/items.dart';
import '../../repositories/favorite_repository.dart';

class GetSingleLocalFavorite implements UseCase<ResultItems, int> {
  late FavoriteRepository repository;
  GetSingleLocalFavorite(this.repository);

  @override
  Future<Either<Failure, ResultItems>> call(params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.singlefavoriteLocal(id: params);
  }
}
