import 'package:dartz/dartz.dart';
import 'package:home_decor/app/data/model/cart.dart';
import 'package:home_decor/app/domain/repositories/cart_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class GetSingleLocalCart implements UseCase<CartModel, int> {
  late CartRepository repository;
  GetSingleLocalCart(this.repository);

  @override
  Future<Either<Failure, CartModel>> call(params) async {
    return repository.getSingleCart(id: params);
  }
}
