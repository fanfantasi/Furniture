import 'package:get/get.dart';

import '../../domain/entities/promo.dart';

class PromoController extends GetxController {
  late ResultPromo promo;

  @override
  void onInit() {
    promo = Get.arguments;
    super.onInit();
  }
}
