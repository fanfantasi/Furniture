import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/items.dart';
import '../../repositories/items_repository.dart';

class GetRemoteItems implements UseCase<List<ResultItems>, int> {
  late ItemsRepository repository;
  GetRemoteItems(this.repository);

  @override
  Future<Either<Failure, List<ResultItems>>> call(params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.referenceRemote(page: params);
  }
}
