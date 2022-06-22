import 'package:get/get.dart';

import 'pesan_controller.dart';

class PesanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PesanController>(
      () => PesanController(),
    );
  }
}
