import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:home_decor/app/presentation/items/item_controller.dart';
import 'package:home_decor/main.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../core/config/formatter.dart';
import '../../../domain/entities/items.dart';

class ItemGridWidget extends StatelessWidget {
  const ItemGridWidget(
      {Key? key, required this.resultItems, required this.controller})
      : super(key: key);
  final ResultItems resultItems;
  final ItemController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        controller.setChangeState(ViewState.busy);
        controller.scrollToTop();
        await controller.fetchItemById(itemid: resultItems.id);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Theme.of(context).backgroundColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: UniqueKey(),
                  child: Container(
                      width: Get.width / 2.2,
                      height: Get.width / 2.8,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border:
                              Border.all(color: Colors.grey.withOpacity(.1)),
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.grey.withOpacity(.05)),
                      child: (resultItems.image!.isNotEmpty)
                          ? FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: resultItems.image!,
                              fit: BoxFit.fitWidth,
                            )
                          : Image.asset('assets/icons/no-image.jpg',
                              width: Get.width / 2, fit: BoxFit.cover)),
                ),
                Visibility(
                  visible: resultItems.status == 1,
                  child: Positioned(
                      bottom: 5,
                      left: 5,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        height: 16,
                        width: Get.width / 10,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(.8)),
                        child: AutoSizeText(
                          'ads'.tr(),
                          minFontSize: 8,
                          maxFontSize: 9,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(.7)),
                        ),
                      )),
                ),
                Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Theme.of(context)
                              .colorScheme
                              .surface
                              .withOpacity(.2)),
                      child: Center(
                          child: Icon(
                        CupertinoIcons.heart,
                        size: 16,
                        color: (resultItems.favorite)
                            ? Colors.red.shade400
                            : Colors.grey.shade400,
                      )),
                    )),
                Positioned(
                    left: 5,
                    top: 5,
                    child: SizedBox(
                      width: Get.width / 2.5,
                      child: AutoSizeText(
                        resultItems.title!.toUpperCase(),
                        minFontSize: 16,
                        maxFontSize: 20,
                        maxLines: 2,
                        style: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.background),
                      ),
                    )),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      height: 22,
                      width: Get.width / 6,
                      decoration: BoxDecoration(
                          color: Colors.blue[400],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomRight: Radius.circular(4))),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Icon(
                            CupertinoIcons.star_circle_fill,
                            size: 12,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          AutoSizeText(
                            resultItems.point.toString(),
                            maxFontSize: 12,
                            minFontSize: 10,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const AutoSizeText(
                            'Poin',
                            maxFontSize: 12,
                            minFontSize: 10,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: Get.width / 2.2,
              child: AutoSizeText('Rp. ${Formatter.number(resultItems.price!)}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  minFontSize: 12,
                  maxFontSize: 14,
                  style: const TextStyle(
                      color: Color(0xFFe2262f),
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
            ),
            SizedBox(
              width: Get.width / 2.2,
              child: AutoSizeText(resultItems.subtitle!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  minFontSize: 10,
                  maxFontSize: 12,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }
}
