import 'package:dartz/dartz.dart';
import 'package:home_decor/app/data/model/cart.dart';
import 'package:home_decor/app/domain/repositories/cart_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class UpdatetLocalCart implements UseCase<CartModel, Tuple2<int, int>> {
  late CartRepository repository;
  UpdatetLocalCart(this.repository);

  @override
  Future<Either<Failure, CartModel>> call(params) async {
    return repository.updateCart(id: params.value1, qty: params.value2);
  }
}
