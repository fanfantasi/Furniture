import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/entities/items.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/favorite_repository.dart';

class GetLocalFavorite implements UseCase<List<ResultItems>, NoParams> {
  late FavoriteRepository repository;
  GetLocalFavorite(this.repository);

  @override
  Future<Either<Failure, List<ResultItems>>> call(NoParams params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.getLocalFavorite();
  }
}
