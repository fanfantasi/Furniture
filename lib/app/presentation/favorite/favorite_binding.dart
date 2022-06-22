import 'package:get/get.dart';
import 'package:home_decor/app/presentation/favorite/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(
      () => FavoriteController(),
    );
  }
}
