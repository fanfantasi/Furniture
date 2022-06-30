import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../../entities/images_item.dart';
import '../../repositories/items_repository.dart';

class GetRemoteImagesItem implements UseCase<List<ResultImagesItem>, int> {
  late ItemsRepository repository;
  GetRemoteImagesItem(this.repository);

  @override
  Future<Either<Failure, List<ResultImagesItem>>> call(params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.imagesitem(itemid: params);
  }
}
