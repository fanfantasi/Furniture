import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:home_decor/app/core/config/formatter.dart';
import 'package:home_decor/app/domain/entities/items.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../routes/app_pages.dart';

class ItemsListWidget extends StatelessWidget {
  const ItemsListWidget({Key? key, required this.resultItems})
      : super(key: key);
  final ResultItems resultItems;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.item,
          arguments: resultItems.id!, preventDuplicates: false),
      child: Container(
        padding: const EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Theme.of(context).backgroundColor),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: resultItems.image!,
                  child: Container(
                      width: Get.width / 3.3,
                      height: Get.width / 5.1,
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
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width / 1.8,
                    child: AutoSizeText(
                      resultItems.title!.toUpperCase(),
                      minFontSize: 16,
                      maxFontSize: 20,
                      maxLines: 2,
                      style: TextStyle(
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.background),
                    ),
                  ),
                  SizedBox(
                    width: Get.width / 2,
                    child: AutoSizeText(resultItems.subtitle!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        minFontSize: 12,
                        maxFontSize: 14,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 2.0),
                    width: Get.width / 2,
                    child: AutoSizeText(
                        'Rp. ${Formatter.number(resultItems.price!)}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        minFontSize: 12,
                        maxFontSize: 14,
                        style: const TextStyle(
                            color: Color(0xFFe2262f),
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
