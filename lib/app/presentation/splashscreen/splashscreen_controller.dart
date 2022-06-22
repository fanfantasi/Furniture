import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:home_decor/app/core/network/network_info.dart';
import 'package:home_decor/injector.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../routes/app_pages.dart';

class SplashscreenController extends GetxController {
  //Network Info
  final network = Injector.resolve<NetworkInfoI>();

  RxString version = ''.obs;
  RxString buildNumber = ''.obs;
  String packageName = '';
  final packageNameKey = "packageName";
  final getStorage = GetStorage();
  final connectvityResult = ConnectivityResult.none.obs;

  @override
  void onInit() async {
    _getVersion();

    connectvityResult.value = await network.connectivityResult;
    Timer(const Duration(milliseconds: 300), () async {
      Get.offAndToNamed(Routes.dashboard);
    });
    super.onInit();
  }

  void _getVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version.value = packageInfo.version;
    buildNumber.value = packageInfo.buildNumber;
    getStorage.write(packageNameKey, packageInfo.packageName);
  }
}
