import 'package:get/get.dart';
import 'package:home_decor/app/presentation/search/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
  }
}
