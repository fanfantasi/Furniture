import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/entities/promo.dart';
import 'package:home_decor/app/domain/repositories/promo_repository.dart';

import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class GetRemotePromo implements UseCase<List<ResultPromo>, NoParams> {
  late PromoRepository repository;
  GetRemotePromo(this.repository);

  @override
  Future<Either<Failure, List<ResultPromo>>> call(NoParams params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.promoRemote();
  }
}
