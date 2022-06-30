import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/items.dart';
import '../../repositories/items_repository.dart';

class GetRemoteItemByid implements UseCase<ResultItems, int> {
  late ItemsRepository repository;
  GetRemoteItemByid(this.repository);

  @override
  Future<Either<Failure, ResultItems>> call(params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.itembyid(itemid: params);
  }
}
