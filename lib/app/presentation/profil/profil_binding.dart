import 'package:get/get.dart';

import 'profil_controller.dart';

class ProfilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilController>(
      () => ProfilController(),
    );
  }
}
