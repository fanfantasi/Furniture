import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart' hide Trans;
import 'package:home_decor/app/presentation/home/widgets/itemgrid.dart';
import 'package:home_decor/app/presentation/home/widgets/itemlist.dart';
import 'package:home_decor/main.dart';

import 'favorite_controller.dart';
import '../../core/widgets/index.dart' as core_widgets;

class FavoriteScreen extends GetView<FavoriteController> {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: .2,
          title: AutoSizeText(
            'favorite'.tr(),
            maxFontSize: 18,
            minFontSize: 14,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w700,
                letterSpacing: 0,
                fontSize: 18),
          ),
          actions: [
            core_widgets.AnimatedToggle(
              values: const [
                CupertinoIcons.square_grid_2x2,
                CupertinoIcons.list_bullet
              ],
              onToggleCallback: (value) {
                if (value == 0) {
                  controller.gridOrList.value = true;
                } else {
                  controller.gridOrList.value = false;
                }
              },
              buttonColor: Colors.blue.shade400,
              backgroundColor: Theme.of(context).colorScheme.background,
              textColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
        body: Obx(() {
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
              return MasonryGridView.count(
                crossAxisCount: (controller.gridOrList.value) ? 2 : 1,
                mainAxisSpacing: 9 / 6,
                crossAxisSpacing: 9 / 6,
                primary: false,
                physics: const BouncingScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                itemCount: controller.items.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Obx(
                      () => (controller.gridOrList.value)
                          ? ItemGridWidget(
                              resultItems: controller.items[index],
                            )
                          : ItemsListWidget(
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
        }));
  }
}
