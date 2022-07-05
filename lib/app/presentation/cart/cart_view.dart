import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:home_decor/app/core/config/formatter.dart';
import 'package:home_decor/app/presentation/cart/cart_controller.dart';
import 'package:home_decor/app/routes/app_pages.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../core/widgets/index.dart' as core_widgets;
import 'widgets/point.dart';
import 'widgets/qty.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
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
        title: Text('my shoping cart'.tr()),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              _onMenuItemSelected(value as String);
            },
            offset: Offset(0.0, AppBar().preferredSize.height),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            itemBuilder: (ctx) => [
              _buildPopupMenuItem('clear cart', CupertinoIcons.delete, 'clear'),
              _buildPopupMenuItem('help', CupertinoIcons.book_solid, 'help')
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Theme.of(context).backgroundColor),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  core_widgets.HeadersWidget(title: 'shoping cart'.tr()),
                  Center(
                      child: Obx(
                    () => AutoSizeText(
                      ' ( ${controller.carts.length} items)',
                      maxFontSize: 14,
                      minFontSize: 12,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Obx(() => ListView.separated(
                      separatorBuilder: (context, index) =>
                          const Divider(indent: 40, height: 8),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.carts.length,
                      itemBuilder: (context, i) {
                        return Container(
                          height: 90,
                          padding: const EdgeInsets.only(top: 4.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Transform.translate(
                                offset: const Offset(-10, 0),
                                child: Checkbox(
                                  checkColor: Colors.white,
                                  value: controller.carts[i].isChecked,
                                  onChanged: (bool? value) {
                                    controller.updatechecked(
                                        cartSelected: controller.carts[i],
                                        isChecked: value);
                                  },
                                ),
                              ),
                              Transform.translate(
                                offset: const Offset(-10, 0),
                                child: Container(
                                  height: 80,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: .5,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: controller.carts[i].image,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: Get.width / 1.9,
                                          child: AutoSizeText(
                                            controller.carts[i].title,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            maxFontSize: 14,
                                            minFontSize: 12,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: InkResponse(
                                            onTap: () async {
                                              await Get.dialog(AlertDialog(
                                                title:
                                                    const Text('delete').tr(),
                                                content:
                                                    const Text('delete desc')
                                                        .tr(),
                                                actions: [
                                                  TextButton.icon(
                                                      onPressed: () => Get.back(
                                                          result: false),
                                                      icon: const Icon(
                                                          Icons.cancel,
                                                          color: Colors.red),
                                                      label: const Text(
                                                        "no",
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ).tr()),
                                                  TextButton.icon(
                                                      onPressed: () {
                                                        Get.back();
                                                        controller.deleteitem(
                                                            cartSelected:
                                                                controller
                                                                    .carts[i]);
                                                      },
                                                      icon: const Icon(
                                                          Icons.check_rounded,
                                                          color: Colors.blue),
                                                      label: const Text(
                                                        "yes",
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ).tr())
                                                ],
                                              ));
                                            },
                                            child: Icon(CupertinoIcons.delete,
                                                size: 16,
                                                color: Colors.red.shade400),
                                          ),
                                        ),
                                      ],
                                    ),
                                    PointWidget(
                                        point: controller.carts[i].point),
                                    AutoSizeText(
                                        'Rp. ${Formatter.number(controller.carts[i].price)}',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        minFontSize: 12,
                                        maxFontSize: 14,
                                        style: const TextStyle(
                                            color: Color(0xFFe2262f),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      width: Get.width / 1.8,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: QtyWidget(
                                          cartModel: controller.carts[i],
                                          controller: controller,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )),
              ),
              const Divider(height: 8)
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => Container(
            height: 48,
            width: Get.width,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                border: Border.all(
                    width: 1,
                    color: Theme.of(context).colorScheme.onSecondary)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const AutoSizeText(
                        'Subtotal : ',
                        minFontSize: 12,
                        maxFontSize: 14,
                      ),
                      AutoSizeText(
                          'Rp. ${Formatter.number(controller.subtotal)}',
                          minFontSize: 12,
                          maxFontSize: 16,
                          style: const TextStyle(
                              color: Color(0xFFe2262f),
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                )),
                SizedBox(
                  width: Get.width * 0.3,
                  child: RoundedLoadingButton(
                    animateOnTap: true,
                    disabledColor: Theme.of(context).colorScheme.onSecondary,
                    child: const Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white),
                    ),
                    controller: controller.checkoutController,
                    onPressed: () {
                      if (controller.subtotal > 0) {
                        controller.checkoutController.reset();
                        Get.toNamed(Routes.checkout);
                      } else {
                        controller.checkoutController.error();
                        Future.delayed(const Duration(milliseconds: 800),
                            () => controller.checkoutController.reset());
                      }
                    },
                    // borderRadius: 2,
                    loaderSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          )),
    );
  }

  PopupMenuItem _buildPopupMenuItem(
      String title, IconData iconData, String position) {
    return PopupMenuItem(
      value: position,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            color: Colors.black,
          ),
          Text(title.tr()),
        ],
      ),
    );
  }

  _onMenuItemSelected(String value) async {
    if (value == 'clear') {
      await Get.dialog(AlertDialog(
        title: const Text('delete').tr(),
        content: const Text('delete desc').tr(),
        actions: [
          TextButton.icon(
              onPressed: () => Get.back(result: false),
              icon: const Icon(Icons.cancel, color: Colors.red),
              label: const Text(
                "no",
                style: TextStyle(color: Colors.red),
              ).tr()),
          TextButton.icon(
              onPressed: () {
                Get.back();
                controller.clearItems();
              },
              icon: const Icon(Icons.check_rounded, color: Colors.blue),
              label: const Text(
                "yes",
                style: TextStyle(color: Colors.blue),
              ).tr())
        ],
      ));
    }
  }
}
