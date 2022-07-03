import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:home_decor/main.dart';
import '../../core/widgets/index.dart' as core_widgets;
import 'checkout_controller.dart';

class CheckoutScreen extends GetView<CheckoutController> {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        titleSpacing: 0,
        centerTitle: true,
        leading: IconButton(
            splashColor: Colors.transparent,
            onPressed: () => Get.back(),
            icon: const Icon(
              CupertinoIcons.back,
            )),
        title: const Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Theme.of(context).backgroundColor),
          child: Column(
            children: [
              core_widgets.HeadersWidget(title: 'address'.tr()),
              Obx(() {
                return Container(
                  child: Text('${controller.addressState.value}'),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
