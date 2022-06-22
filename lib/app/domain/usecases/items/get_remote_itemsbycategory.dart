import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/items.dart';
import '../../repositories/items_repository.dart';

class GetRemoteItemsByCategory
    implements UseCase<List<ResultItems>, Tuple2<int, int>> {
  late ItemsRepository repository;
  GetRemoteItemsByCategory(this.repository);

  @override
  Future<Either<Failure, List<ResultItems>>> call(params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.itembycategoryRemote(
        page: params.value1, categoryid: params.value2);
  }
}
