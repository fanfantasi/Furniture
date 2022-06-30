import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/presentation/category/category_controller.dart';
import 'package:home_decor/main.dart';

// import '../../core/widgets/itemheaders.dart';
import '../../core/widgets/index.dart' as core_widgets;
import '../home/widgets/itemgrid.dart';
import '../home/widgets/itemlist.dart';
import 'widgets/action_button.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        controller: controller.scrollViewController,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: core_widgets.SliverCustomHeaderCategoryDelegate(
                collapsedHeight: 60,
                imgUrl: controller.category.banner!,
                expandedHeight: 160,
                paddingTop: 20,
                title: controller.category.category!),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Theme.of(context).colorScheme.surface.withOpacity(.2),
                      blurRadius: 4.0,
                      spreadRadius: 0.0,
                      offset: const Offset(
                        1.0,
                        1.0,
                      ),
                    )
                  ],
                ),
                child: Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ActionButton(
                        title: 'Filter',
                        iconPath: CupertinoIcons.slider_horizontal_3,
                        onTap: () {
                          controller.setViewSection(ViewSection.filter);
                        },
                        active:
                            controller.viewSection.value == ViewSection.filter,
                      ),
                      const VerticalDivider(),
                      ActionButton(
                        title: 'Sort',
                        iconPath: (controller.sortUp.value)
                            ? CupertinoIcons.sort_up
                            : CupertinoIcons.sort_down,
                        onTap: () {
                          controller.sortUp.value = !controller.sortUp.value;
                          controller.setViewSection(ViewSection.sort);
                          controller.sortItems();
                        },
                        active:
                            controller.viewSection.value == ViewSection.sort,
                      ),
                      const VerticalDivider(),
                      ActionButton(
                        title: (controller.gridOrList.value) ? 'Grid' : 'List',
                        iconPath: (controller.gridOrList.value)
                            ? CupertinoIcons.square_grid_2x2
                            : CupertinoIcons.list_bullet,
                        active: controller.viewSection.value ==
                            ViewSection.gridorlist,
                        onTap: () {
                          controller.setViewSection(ViewSection.gridorlist);
                          controller.gridOrList.value =
                              !controller.gridOrList.value;
                        },
                      )
                    ],
                  ),
                )),
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
                      itemBuilder: (BuildContext context, int index) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: core_widgets.ShimmerItem(
                              width: Get.width,
                            ),
                          ));

                case ViewState.data:
                  if (controller.items.isEmpty) {
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
                                  color: Theme.of(context).colorScheme.primary),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return MasonryGridView.count(
                      crossAxisCount: (controller.gridOrList.value) ? 2 : 1,
                      mainAxisSpacing: 9 / 6,
                      crossAxisSpacing: 9 / 6,
                      primary: false,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      itemCount: controller.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Obx(
                              () => (controller.gridOrList.value)
                                  ? ItemGridWidget(
                                      resultItems: controller.items[index],
                                    )
                                  : ItemsListWidget(
                                      resultItems: controller.items[index],
                                    ),
                            ));
                      });
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
                      itemBuilder: (BuildContext context, int index) => Padding(
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
    );
  }
}
