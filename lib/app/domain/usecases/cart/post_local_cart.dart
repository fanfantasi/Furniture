import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/repositories/cart_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class PostLocalCart implements UseCase<bool, ParamsCart> {
  late CartRepository repository;
  PostLocalCart(this.repository);

  @override
  Future<Either<Failure, bool>> call(ParamsCart params) async {
    return repository.insertCart(params: params);
  }
}
