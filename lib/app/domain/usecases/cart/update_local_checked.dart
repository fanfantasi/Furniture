import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/repositories/cart_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class UpdatetLocalChecked implements UseCase<bool, Tuple2<int, bool>> {
  late CartRepository repository;
  UpdatetLocalChecked(this.repository);

  @override
  Future<Either<Failure, bool>> call(params) async {
    return repository.isChecked(id: params.value1, isChecked: params.value2);
  }
}
