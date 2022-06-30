import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/repositories/cart_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../../data/model/cart.dart';

class GetLocalCart implements UseCase<List<CartModel>, NoParams> {
  late CartRepository repository;
  GetLocalCart(this.repository);

  @override
  Future<Either<Failure, List<CartModel>>> call(NoParams params) async {
    return repository.getLocalCart();
  }
}
