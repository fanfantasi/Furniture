import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/routes/app_pages.dart';
import 'package:home_decor/main.dart';
import 'package:page_indicator/page_indicator.dart';

import '../../../core/widgets/shimmer_category.dart';
import '../home_controller.dart';
import 'headersitem.dart';

class TopMenusWidget extends StatefulWidget {
  const TopMenusWidget({Key? key, required this.homeController})
      : super(key: key);
  final HomeController homeController;
  @override
  State<TopMenusWidget> createState() => _TopMenusWidgetState();
}

class _TopMenusWidgetState extends State<TopMenusWidget> {
  late PageController controller;
  int perpage = 5;
  GlobalKey<PageContainerState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            )),
        // color: ,
        child: Obx(() {
          switch (widget.homeController.categoryState.value) {
            case ViewState.busy:
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      5, (index) => const ShimmerCategoryWidget()),
                ),
              );
            case ViewState.error:
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      List.generate(4, (index) => const ErrorCategoryWidget()),
                ),
              );
            case ViewState.data:
              return PageIndicatorContainer(
                key: key,
                padding: const EdgeInsets.only(bottom: 4.0, top: 4.0),
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(
                      (widget.homeController.catgories.length / perpage).ceil(),
                      (index) {
                    if (index == 0) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(perpage, (i) {
                          return GestureDetector(
                            onTap: () => Get.toNamed(Routes.category,
                                arguments: widget.homeController.catgories[i]),
                            child: HeaderItems(
                              images: widget.homeController.catgories[i].icon,
                              title:
                                  widget.homeController.catgories[i].category,
                            ),
                          );
                        }),
                      );
                    }
                    if (index != 0 &&
                        index <
                            (widget.homeController.catgories.length / perpage)
                                    .ceil() -
                                index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(perpage, (i) {
                          return GestureDetector(
                            onTap: () => Get.toNamed(Routes.category,
                                arguments: widget.homeController
                                    .catgories[(perpage * index) + i]),
                            child: HeaderItems(
                              images: widget.homeController
                                  .catgories[(perpage * index) + i].icon,
                              title: widget.homeController
                                  .catgories[(perpage * index) + i].category,
                            ),
                          );
                        }),
                      );
                    }

                    return Row(
                      mainAxisAlignment:
                          (widget.homeController.catgories.length % perpage ==
                                  0)
                              ? MainAxisAlignment.spaceBetween
                              : MainAxisAlignment.start,
                      children: List.generate(
                          (widget.homeController.catgories.length % perpage ==
                                  0)
                              ? 5
                              : widget.homeController.catgories.length %
                                  perpage, (i) {
                        return GestureDetector(
                          onTap: () => Get.toNamed(Routes.category,
                              arguments: widget.homeController
                                  .catgories[(perpage * index) + i]),
                          child: HeaderItems(
                            images: widget.homeController
                                .catgories[(perpage * index) + i].icon,
                            title: widget.homeController
                                .catgories[(perpage * index) + i].category,
                          ),
                        );
                      }),
                    );
                  }),
                  controller: controller,
                  reverse: false,
                ),
                indicatorSelectorColor: Colors.blueAccent,
                indicatorColor: Theme.of(context).colorScheme.onSecondary,
                align: IndicatorAlign.bottom,
                length:
                    (widget.homeController.catgories.length / perpage).ceil(),
                shape: IndicatorShape.circle(size: 8),
                indicatorSpace: 2.0,
              );

            default:
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      5, (index) => const ShimmerCategoryWidget()),
                ),
              );
          }
        }));
  }
}
