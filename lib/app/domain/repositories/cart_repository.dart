import 'package:dartz/dartz.dart';
import 'package:home_decor/app/core/usecases/usecase.dart';
import 'package:home_decor/app/data/model/cart.dart';

import '../../core/errors/failure.dart';

abstract class CartRepository {
  Future<Either<Failure, List<CartModel>>> getLocalCart();
  Future<Either<Failure, bool>> deleteCart({int? id});
  Future<Either<Failure, bool>> deleteAllCart();
  Future<Either<Failure, bool>> insertCart({ParamsCart params});
  Future<Either<Failure, CartModel>> getSingleCart({int? id});
  Future<Either<Failure, CartModel>> updateCart({int? id, int? qty});
  Future<Either<Failure, bool>> isChecked({int? id, bool? isChecked});
}
