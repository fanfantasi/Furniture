import 'package:home_decor/app/core/usecases/usecase.dart';
import 'package:home_decor/app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:home_decor/app/data/model/cart.dart';

import '../../domain/repositories/cart_repository.dart';
import '../datasources/local/cart_local_datasoure.dart';

class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl({required this.localDataSource});
  // local data source
  final CartDataSource localDataSource;

  @override
  Future<Either<Failure, bool>> deleteAllCart() async {
    try {
      final bool = await localDataSource.deleteAllCart();
      return Right(bool);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCart({int? id}) async {
    try {
      final bool = await localDataSource.deleteCart(id: id);
      return Right(bool);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<CartModel>>> getLocalCart() async {
    final items = await localDataSource.getCart();
    return Right(items);
  }

  @override
  Future<Either<Failure, CartModel>> getSingleCart({int? id}) async {
    try {
      final item = await localDataSource.getSingleCart(id: id);
      return Right(item);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> insertCart({ParamsCart? params}) async {
    try {
      final bool = await localDataSource.insertCart(CartModel(
          id: params!.id!,
          title: params.title!,
          subtitle: params.subtitle!,
          desc: params.desc!,
          image: params.image!,
          price: params.price!,
          point: params.point!,
          qty: params.qty!,
          createdAt: params.createdAt!));
      return Right(bool);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, CartModel>> updateCart({int? id, int? qty}) async {
    try {
      final item = await localDataSource.updateCart(id: id, qty: qty);
      return Right(item);
    } catch (_) {
      return const Left(Failure('No internet connection'));
    }
  }
}
