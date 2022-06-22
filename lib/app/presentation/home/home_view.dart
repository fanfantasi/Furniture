import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart' hide Trans;
import 'package:home_decor/app/presentation/home/home_controller.dart';
import 'package:home_decor/app/routes/app_pages.dart';
import 'package:home_decor/main.dart';
import 'package:shimmer/shimmer.dart';
import '../../core/conditional/conditional.dart';
import 'widgets/appbar.dart';
import '../../core/widgets/index.dart' as core_widgets;
import 'widgets/balance.dart';
import 'widgets/itemgrid.dart';
import 'widgets/topmenus.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: RefreshIndicator(
          child: CustomScrollView(
            controller: controller.scrollViewController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverCustomHeaderDelegateSwiper(
                    collapsedHeight: 42,
                    expandedHeight: 115,
                    paddingTop: 30,
                    controller: controller),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                //Balance
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Container(
                      margin: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.2),
                            blurRadius: 4.0,
                            spreadRadius: 0.0,
                            offset: const Offset(
                              1.0,
                              1.0,
                            ),
                          )
                        ],
                      ),
                      child: BalanceWidget(
                        subLocality: '0',
                        controller: controller,
                      ),
                    )),
                //Event & Promo
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TopMenusWidget(
                    homeController: controller,
                  ),
                ),

                Container(
                    color: Colors.grey.withOpacity(.1),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        core_widgets.Section(
                          title: 'promotions'.tr(),
                          onTap: () => print('data'),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Obx(() {
                              switch (controller.promoState.value) {
                                case ViewState.busy:
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      width: Get.width,
                                      height: 105,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                  );

                                case ViewState.error:
                                  return Container(
                                    height: 105,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.blue,
                                        image: const DecorationImage(
                                            image: AssetImage(
                                                'assets/icons/no-image.png'),
                                            fit: BoxFit.cover)),
                                  );

                                case ViewState.data:
                                  return SizedBox(
                                    height: 105,
                                    width: Get.width,
                                    child: Swiper(
                                      autoplay: true,
                                      curve: Curves.bounceInOut,
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        return GestureDetector(
                                          onTap: () => Get.toNamed(Routes.promo,
                                              arguments: controller.promos[i]),
                                          child: Container(
                                            height: 105,
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                image: DecorationImage(
                                                    image: Conditional()
                                                        .getProvider(controller
                                                            .promos[i].image!),
                                                    fit: BoxFit.cover)),
                                          ),
                                        );
                                      },
                                      itemCount: controller.promos.length,
                                      loop: true,
                                      pagination: const SwiperPagination(
                                          margin: EdgeInsets.all(1),
                                          builder: SwiperPagination.dots,
                                          alignment: Alignment.bottomRight),
                                    ),
                                  );

                                default:
                                  return Shimmer.fromColors(
                                    baseColor: Colors.grey.shade300,
                                    highlightColor: Colors.grey.shade100,
                                    child: Container(
                                      width: Get.width,
                                      height: 105,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                              }
                            }))
                      ],
                    )),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
                  child: core_widgets.Section(
                    title: 'featured products'.tr(),
                    onTap: () => print('data'),
                  ),
                ),
                Obx(() {
                  switch (controller.viewState.value) {
                    case ViewState.busy:
                      return MasonryGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 9 / 6,
                          crossAxisSpacing: 9 / 6,
                          primary: false,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          itemCount: 8,
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: core_widgets.ShimmerItem(
                                  width: Get.width,
                                ),
                              ));

                    case ViewState.data:
                      return MasonryGridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 9 / 6,
                        crossAxisSpacing: 9 / 6,
                        primary: false,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8.0),
                        itemCount: controller.items.length,
                        itemBuilder: (BuildContext context, int index) =>
                            Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Obx(
                                  () => ItemGridWidget(
                                    resultItems: controller.items[index],
                                  ),
                                )),
                      );
                    default:
                      return MasonryGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 9 / 6,
                          crossAxisSpacing: 9 / 6,
                          primary: false,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          itemCount: 8,
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: core_widgets.ShimmerItem(
                                  width: Get.width,
                                ),
                              ));
                  }
                }),
              ]))
            ],
          ),
          onRefresh: () => controller.onRefresh()),
    );
  }
}
