import 'package:get/get.dart';
import 'package:home_decor/app/presentation/favorite/favorite_controller.dart';
import 'package:home_decor/app/presentation/pesan/pesan_controller.dart';

import '../cart/cart_controller.dart';
import '../home/home_controller.dart';
import '../profil/profil_controller.dart';
import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<FavoriteController>(
      () => FavoriteController(),
    );
    Get.lazyPut<PesanController>(
      () => PesanController(),
    );
    Get.lazyPut<ProfilController>(
      () => ProfilController(),
    );
    Get.put(
      CartController(),
    );
  }
}
