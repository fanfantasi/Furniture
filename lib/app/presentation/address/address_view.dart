import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:home_decor/app/presentation/address/address_controller.dart';
import 'package:home_decor/app/routes/app_pages.dart';
import 'package:home_decor/main.dart';
import '../../core/widgets/index.dart' as core_widgets;

class AddressScreen extends GetView<AddressController> {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: .5,
          titleSpacing: 0,
          leading: IconButton(
              splashColor: Colors.transparent,
              onPressed: () => Get.back(),
              icon: const Icon(
                CupertinoIcons.back,
              )),
          title: Text('address'.tr()),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                switch (controller.viewState.value) {
                  case ViewState.busy:
                    return const core_widgets.LoadingWidget();

                  case ViewState.error:
                    return const core_widgets.ErrorWidget();

                  case ViewState.data:
                    if (controller.getaddress.isEmpty) {
                      return Container(
                        height: Get.height - (Get.width),
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        color: Theme.of(context).colorScheme.onPrimary,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on_outlined,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 32),
                              const SizedBox(
                                height: 12.0,
                              ),
                              AutoSizeText(
                                'No Results Found',
                                maxFontSize: 16,
                                minFontSize: 12,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.getaddress.length,
                      itemBuilder: (context, i) {
                        return Container(
                          height: Get.height - (Get.width - 160),
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/ic-empty.png',
                                  scale: 2,
                                ),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                AutoSizeText(
                                  'No Results Found',
                                  maxFontSize: 16,
                                  minFontSize: 12,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );

                  default:
                    return const core_widgets.LoadingWidget();
                }
              }),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.addAddress),
                child: Container(
                    color: Theme.of(context).colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 4.0),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    height: 42,
                    width: Get.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AutoSizeText(
                          'add address'.tr(),
                          maxFontSize: 16,
                          minFontSize: 12,
                        ),
                        Icon(
                          CupertinoIcons.add,
                          size: 18,
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
