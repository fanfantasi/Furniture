import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/favorite_repository.dart';

class PostLocalFavorite implements UseCase<bool, ParamsFavorite> {
  late FavoriteRepository repository;
  PostLocalFavorite(this.repository);

  @override
  Future<Either<Failure, bool>> call(ParamsFavorite params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.insertFavorite(params: params);
  }
}
