import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart' hide Trans;
import 'package:home_decor/app/presentation/search/search_controller.dart';
import 'package:home_decor/main.dart';
import '../../../core/widgets/index.dart' as core_widgets;
import '../../home/widgets/itemgrid.dart';
import '../../home/widgets/itemlist.dart';

class SearchResultScreen extends GetView<SearchController> {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leading: IconButton(
            splashColor: Colors.transparent,
            onPressed: () => Get.back(),
            icon: const Icon(
              CupertinoIcons.back,
            )),
        elevation: .2,
        title: AutoSizeText(
          'search result'.tr(),
          maxFontSize: 18,
          minFontSize: 14,
          style: const TextStyle(
              fontWeight: FontWeight.w700, letterSpacing: 0, fontSize: 18),
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
            backgroundColor: const Color(0xFFB5C1CC),
            textColor: const Color(0xFFFFFFFF),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(() {
          switch (controller.searchState.value) {
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
                  itemCount: controller.searchResults.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Obx(
                          () => (controller.gridOrList.value)
                              ? ItemGridWidget(
                                  resultItems: controller.searchResults[index],
                                )
                              : ItemsListWidget(
                                  resultItems: controller.searchResults[index],
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
      ),
    );
  }
}
