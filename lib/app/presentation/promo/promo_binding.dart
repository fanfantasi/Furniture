import 'package:get/get.dart';
import 'package:home_decor/app/presentation/promo/promo_controller.dart';

class PromoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromoController>(
      () => PromoController(),
    );
  }
}
