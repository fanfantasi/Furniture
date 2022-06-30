import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/items.dart';
import '../../repositories/items_repository.dart';

class GetRemoteItemsRelated
    implements UseCase<List<ResultItems>, Tuple3<int, int, int>> {
  late ItemsRepository repository;
  GetRemoteItemsRelated(this.repository);

  @override
  Future<Either<Failure, List<ResultItems>>> call(params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.itemrelatedRemote(
        page: params.value1, categoryid: params.value2, itemid: params.value3);
  }
}
