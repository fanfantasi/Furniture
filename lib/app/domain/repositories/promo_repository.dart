import 'package:dartz/dartz.dart';
import 'package:home_decor/app/domain/entities/promo.dart';

import '../../core/errors/failure.dart';

abstract class PromoRepository {
  Future<Either<Failure, List<ResultPromo>>> promoRemote();
}
