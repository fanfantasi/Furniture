import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../repositories/cart_repository.dart';

class ClearLocalCart implements UseCase<bool, NoParams> {
  late CartRepository repository;
  ClearLocalCart(this.repository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return repository.deleteAllCart();
  }
}
