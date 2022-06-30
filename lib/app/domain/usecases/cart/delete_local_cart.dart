import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/repositories/cart_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class DeleteLocalCart implements UseCase<bool, int> {
  late CartRepository repository;
  DeleteLocalCart(this.repository);

  @override
  Future<Either<Failure, bool>> call(params) async {
    return repository.deleteCart(id: params);
  }
}
