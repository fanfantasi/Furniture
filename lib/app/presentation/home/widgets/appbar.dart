import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:home_decor/app/core/widgets/topbar.dart';
import 'package:home_decor/app/routes/app_pages.dart';

import '../home_controller.dart';

class SliverCustomHeaderDelegateSwiper extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final HomeController controller;
  const SliverCustomHeaderDelegateSwiper(
      {Key? key,
      required this.collapsedHeight,
      required this.expandedHeight,
      required this.paddingTop,
      required this.controller});

  @override
  double get minExtent => collapsedHeight + paddingTop;

  @override
  double get maxExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Color makeStickyHeaderBgColor(shrinkOffset) {
    int alpha = 0;
    // if (ThemeService().isSaveDarkMode()) {
    // } else {
    //   alpha =
    //       (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();
    // }

    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha =
          (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: maxExtent,
      width: Get.width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              padding: const EdgeInsets.only(bottom: 0.0),
              color: Theme.of(context).backgroundColor,
              child: const TopBar()),
          Positioned(
              top: (shrinkOffset <= 50) ? 0 : maxExtent,
              left: 0,
              right: 0,
              child: Container(
                color: makeStickyHeaderBgColor(shrinkOffset),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 35),
                child: SizedBox(
                  height: 52.0,
                  child: AutoSizeText(
                    "find your favorite".tr(),
                    minFontSize: 16,
                    maxFontSize: 20,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              )),
          Positioned(
            top: (shrinkOffset <= 42) ? 44 : 0,
            left: 0,
            right: 0,
            child: Container(
              color: makeStickyHeaderBgColor(shrinkOffset), // Background color
              child: SafeArea(
                bottom: false,
                child: SizedBox(
                  height: 48.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            makeStickyHeaderBgColor(shrinkOffset),
                            Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(.7),
                          ],
                          stops: const [
                            0.0,
                            1.0
                          ],
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          tileMode: TileMode.repeated),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 4),
                    child: SizedBox(
                      height: 18,
                      width: Get.width / 1.25,
                      child: TextField(
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 16),
                        cursorColor: Colors.black87,
                        focusNode: controller.focusNode,
                        onTap: () {
                          controller.focusNode.unfocus();
                          Get.toNamed(Routes.search,
                              arguments: controller.items);
                        },
                        decoration: InputDecoration(
                          hintText: "search".tr(),
                          hintStyle: const TextStyle(color: Colors.black54),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black54,
                            size: 20,
                          ),
                          filled: true,
                          isDense: true,
                          fillColor: Colors.white.withOpacity(.8),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade100,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              borderSide: BorderSide(
                                color: Colors.grey.shade200,
                              )),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              borderSide: BorderSide(
                                  color: Colors.grey.shade100, width: .8)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
