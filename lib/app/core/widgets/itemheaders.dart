import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/routes/app_pages.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../presentation/items/item_controller.dart';

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final ItemController controller;
  final int? point;
  final String title;

  SliverCustomHeaderDelegate({
    required this.collapsedHeight,
    required this.expandedHeight,
    required this.paddingTop,
    required this.controller,
    this.point,
    required this.title,
  });

  @override
  double get minExtent => collapsedHeight + paddingTop;

  @override
  double get maxExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha =
        (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha =
          (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();
      return Color.fromARGB(alpha, 100, 100, 100);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: (shrinkOffset <= 50)
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: SizedBox(
        height: maxExtent,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: maxExtent,
                  width: Get.width,
                  child: (controller.images.isNotEmpty)
                      ? Swiper(
                          autoplay: false,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int i) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.imageview,
                                    arguments: controller.images[i].image!);
                              },
                              child: Hero(
                                  tag: 'zoom' + controller.images[i].image!,
                                  transitionOnUserGestures: true,
                                  child: FadeInImage.memoryNetwork(
                                    placeholder: kTransparentImage,
                                    image: controller.images[i].image!,
                                    fit: point == null
                                        ? BoxFit.cover
                                        : BoxFit.scaleDown,
                                  )),
                            );
                          },
                          itemCount: controller.images.length,
                          loop: false,
                          pagination: const SwiperPagination(
                              alignment: Alignment.bottomRight,
                              builder: SwiperPagination.fraction,
                              margin: EdgeInsets.only(bottom: 22)),
                        )
                      : FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: controller.resultItems.image!,
                          fit: point == null ? BoxFit.cover : BoxFit.scaleDown,
                        ),
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 42,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black45,
                            ],
                            stops: [
                              0.0,
                              1.0
                            ],
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            tileMode: TileMode.repeated),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: AutoSizeText(
                          title.toUpperCase(),
                          maxFontSize: 18,
                          minFontSize: 12,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    )),
              ],
            ),
            Visibility(
              visible: point != null,
              child: Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    height: 24,
                    width: Get.width / 5,
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
                          size: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        AutoSizeText(
                          point.toString(),
                          maxFontSize: 18,
                          minFontSize: 10,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const AutoSizeText(
                          'Poin',
                          maxFontSize: 18,
                          minFontSize: 14,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )),
            ),
            // Put your head back
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: makeStickyHeaderBgColor(shrinkOffset),
                ),
                child: SafeArea(
                  bottom: false,
                  child: SizedBox(
                    height: collapsedHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6.0),
                            margin: const EdgeInsets.only(left: 12.0),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.2),
                                borderRadius: BorderRadius.circular(25)),
                            child: Icon(
                              CupertinoIcons.chevron_back,
                              color:
                                  makeStickyHeaderTextColor(shrinkOffset, true),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8.0),
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: AutoSizeText(
                            title,
                            maxFontSize: 16,
                            maxLines: 2,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: makeStickyHeaderTextColor(
                                  shrinkOffset, false),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6.0),
                            margin: const EdgeInsets.only(left: 12.0),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.2),
                                borderRadius: BorderRadius.circular(25)),
                            child: Icon(
                              CupertinoIcons.arrowshape_turn_up_right,
                              color:
                                  makeStickyHeaderTextColor(shrinkOffset, true),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 6.0),
                            margin: const EdgeInsets.only(left: 12.0),
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.2),
                                borderRadius: BorderRadius.circular(25)),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color:
                                  makeStickyHeaderTextColor(shrinkOffset, true),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
