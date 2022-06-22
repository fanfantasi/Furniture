import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/items.dart';
import '../../repositories/items_repository.dart';

class GetRemoteSearchItems
    implements UseCase<List<ResultItems>, Tuple2<int, String>> {
  late ItemsRepository repository;
  GetRemoteSearchItems(this.repository);

  @override
  Future<Either<Failure, List<ResultItems>>> call(params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.searchitemsRemote(
        page: params.value1, search: params.value2);
  }
}
