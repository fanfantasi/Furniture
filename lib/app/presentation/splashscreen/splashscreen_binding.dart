import 'package:get/get.dart';

import 'splashscreen_controller.dart';

class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(
      () => SplashscreenController(),
    );
  }
}
