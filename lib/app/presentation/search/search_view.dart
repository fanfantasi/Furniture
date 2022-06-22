import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart' hide Trans;
import 'package:home_decor/app/presentation/search/search_controller.dart';
import 'package:home_decor/app/routes/app_pages.dart';
import 'package:home_decor/main.dart';
import '../../core/widgets/index.dart' as core_widgets;
import '../home/widgets/itemgrid.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            searchBar(),
            IconButton(
                onPressed: () async {
                  await controller
                      .insertSearchData(controller.searchController.text);
                  await Get.toNamed(Routes.searchresult);
                },
                icon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.black54,
                ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Divider(height: .2),
            Obx(() {
              switch (controller.searchState.value) {
                case ViewState.busy:
                  return Container();

                default:
                  return ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, i) => const Divider(
                      indent: 12,
                      height: 1,
                    ),
                    itemCount: controller.searchs.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              controller.searchs[i].keyword,
                              maxFontSize: 14,
                              minFontSize: 12,
                              maxLines: 1,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            (controller.localData.value)
                                ? GestureDetector(
                                    onTap: () => controller.deleteSearchData(
                                        id: controller.searchs[i].id),
                                    child: const Icon(
                                      Icons.close,
                                      size: 16,
                                    ),
                                  )
                                : const Icon(
                                    Icons.arrow_forward,
                                    size: 16,
                                  )
                          ],
                        ),
                      );
                    },
                  );
              }
            }),
            Obx(() =>
                (controller.localData.value && controller.search.isNotEmpty)
                    ? Column(
                        children: [
                          const Divider(height: .2),
                          GestureDetector(
                            onTap: () => controller.clearSearchData(),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: AutoSizeText(
                                'Hapus riwayat pencarian',
                                maxFontSize: 14,
                                minFontSize: 12,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink()),
            Divider(
              thickness: 12,
              color: Colors.grey.withOpacity(.2),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
                    child: core_widgets.Section(
                      title: 'Recomendation Furniture',
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            itemCount: controller.items.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ItemGridWidget(
                                    resultItems: controller.items[index],
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
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: core_widgets.ShimmerItem(
                                    width: Get.width,
                                  ),
                                ));
                    }
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return SizedBox(
      height: 48.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: SizedBox(
          height: 18,
          width: Get.width / 1.35,
          child: TextField(
            style: const TextStyle(color: Colors.black87, fontSize: 16),
            cursorColor: Colors.black87,
            autofocus: true,
            controller: controller.searchController,
            onChanged: (String string) => controller.changesarch(string),
            onSubmitted: (value) => controller.insertSearchData(value),
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
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
                  borderSide:
                      BorderSide(color: Colors.grey.shade100, width: .8)),
            ),
          ),
        ),
      ),
    );
  }
}
