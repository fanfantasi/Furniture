import 'package:get/get.dart';
import 'package:home_decor/app/presentation/category/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
  }
}
