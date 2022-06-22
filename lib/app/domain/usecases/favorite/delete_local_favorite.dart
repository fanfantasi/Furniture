import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/favorite_repository.dart';

class DeleteLocalFavorite implements UseCase<bool, int> {
  late FavoriteRepository repository;
  DeleteLocalFavorite(this.repository);

  @override
  Future<Either<Failure, bool>> call(params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.deleteFavorite(id: params);
  }
}
