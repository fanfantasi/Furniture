import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/presentation/splashscreen/splashscreen_controller.dart';

class SplashScreen extends GetView<SplashscreenController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Center(
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 35, right: 35, top: 15),
                    child: Image.asset(
                      'assets/icons/ic-bg.png',
                      scale: 2,
                      color: Theme.of(context).primaryColor,
                    ))),
          ),
          Visibility(
            visible: controller.version.value != '' &&
                controller.buildNumber.value != '',
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                'Home Decor' +
                    controller.version.value +
                    ' (' +
                    controller.buildNumber.value +
                    ')',
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
