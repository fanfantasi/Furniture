import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/data/model/cart.dart';
import 'package:home_decor/app/presentation/cart/cart_controller.dart';

class QtyWidget extends StatelessWidget {
  const QtyWidget({Key? key, required this.cartModel, required this.controller})
      : super(key: key);
  final CartModel cartModel;
  final CartController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkResponse(
            onTap: () {
              controller.updateqty(
                  cartSelected: cartModel, qty: cartModel.qty - 1);
            },
            child: Icon(CupertinoIcons.minus_circle,
                size: 18, color: Theme.of(context).colorScheme.secondary),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            constraints: const BoxConstraints(
                minWidth: 44, maxWidth: 84, minHeight: 18, maxHeight: 26),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary,
                border: Border.all(
                    width: .5,
                    color: Theme.of(context).colorScheme.onSecondary),
                borderRadius: BorderRadius.circular(8)),
            child: Center(child: AutoSizeText(cartModel.qty.toString())),
          ),
          InkResponse(
            onTap: () {
              controller.updateqty(
                  cartSelected: cartModel, qty: cartModel.qty + 1);
            },
            child: Icon(CupertinoIcons.plus_app,
                size: 18, color: Theme.of(context).colorScheme.secondary),
          )
        ],
      ),
    );
  }
}
