import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart' hide Trans;
import 'package:home_decor/app/presentation/items/item_controller.dart';
import 'package:home_decor/main.dart';
import 'package:like_button/like_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../core/config/formatter.dart';
import '../../core/widgets/itemheaders.dart';
import '../../core/widgets/index.dart' as core_widgets;
import 'widgets/itemgrid.dart';
import 'widgets/userrating.dart';

class ItemScreen extends GetView<ItemController> {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: true,
      body: Obx(() {
        switch (controller.viewState.value) {
          case ViewState.busy:
            return const core_widgets.LoadingWidget();

          case ViewState.error:
            return const core_widgets.ErrorWidget();

          case ViewState.data:
            return Stack(
              children: [
                CustomScrollView(
                  controller: controller.scrollViewController,
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverCustomHeaderDelegate(
                          collapsedHeight: 60,
                          controller: controller,
                          point: controller.resultItems.point!,
                          expandedHeight: 250,
                          paddingTop: 20,
                          title: controller.resultItems.title!),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      SizedBox(
                          height: 120,
                          width: Get.width - 20,
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    controller.resultItems.subtitle!
                                        .toUpperCase(),
                                    maxFontSize: 18,
                                    minFontSize: 12,
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  AutoSizeText(
                                      'Rp. ${Formatter.number(controller.resultItems.price!)}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      minFontSize: 12,
                                      maxFontSize: 14,
                                      style: TextStyle(
                                          color: Colors.red[400],
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700)),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            RatingBar.builder(
                                              initialRating: double.parse(
                                                  controller
                                                      .resultItems.ratings!),
                                              minRating: 1,
                                              itemSize: 16,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              ignoreGestures: true,
                                              itemCount: 5,
                                              itemBuilder: (context, index) =>
                                                  Icon(CupertinoIcons.star_fill,
                                                      color: Colors
                                                          .amber.shade700),
                                              onRatingUpdate: (rating) {},
                                            ),
                                            const SizedBox(
                                              width: 4,
                                            ),
                                            AutoSizeText(
                                              double.parse(controller
                                                      .resultItems.ratings!)
                                                  .toStringAsFixed(1),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              minFontSize: 14,
                                              maxFontSize: 16,
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: LikeButton(
                                          isLiked:
                                              controller.resultItems.favorite,
                                          onTap: controller.postFavorite,
                                          size: 22,
                                          circleColor: const CircleColor(
                                              start: Color(0xff00ddff),
                                              end: Color(0xff0099cc)),
                                          bubblesColor: const BubblesColor(
                                            dotPrimaryColor: Color(0xff33b5e5),
                                            dotSecondaryColor:
                                                Color(0xff0099cc),
                                          ),
                                          likeBuilder: (bool isLiked) {
                                            return Icon(
                                              CupertinoIcons.heart,
                                              color: isLiked
                                                  ? Colors.red
                                                  : Colors.grey,
                                              size: 18,
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ))),
                      Divider(
                          thickness: 8,
                          height: 10,
                          color: Theme.of(context).colorScheme.onSecondary),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: Theme.of(context).backgroundColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            core_widgets.HeadersWidget(
                                title: 'items desc'.tr()),
                            const Divider(),
                            ExpandText(
                              controller.resultItems.desc!,
                              maxLines: 4,
                              arrowColor:
                                  Theme.of(context).colorScheme.secondary,
                              expandWidth: true,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.left,
                              expandArrowStyle: ExpandArrowStyle.icon,
                            ),
                          ],
                        ),
                      ),
                      ratingItems(context),
                      Visibility(
                          visible: controller.isRelated.value,
                          child: relatedItems(context)),
                      Divider(
                          thickness: 8,
                          height: 10,
                          color: Theme.of(context).colorScheme.onSecondary),
                    ]))
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 42,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Colors.teal.shade400,
                        border: Border.all(
                            width: 1,
                            color: Theme.of(context).colorScheme.onSecondary)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width / 5,
                          child: RoundedLoadingButton(
                            animateOnTap: true,
                            child: Icon(CupertinoIcons.chat_bubble_text,
                                color: Theme.of(context).colorScheme.onPrimary),
                            controller: controller.chatController,
                            onPressed: () {
                              controller.chatController.reset();
                            },
                            borderRadius: 2,
                            valueColor: Theme.of(context).colorScheme.onPrimary,
                            successColor: Colors.teal.shade400,
                            errorColor: Colors.teal.shade400,
                            color: Colors.teal.shade400,
                            elevation: 0,
                          ),
                        ),
                        SizedBox(
                          width: Get.width / 4,
                          child: RoundedLoadingButton(
                            animateOnTap: true,
                            child: Icon(Icons.add_shopping_cart_rounded,
                                color: Theme.of(context).colorScheme.onPrimary),
                            controller: controller.addController,
                            onPressed: () => controller.addToCart(),
                            borderRadius: 2,
                            valueColor: Theme.of(context).colorScheme.onPrimary,
                            successColor: Colors.teal.shade400,
                            errorColor: Colors.teal.shade400,
                            color: Colors.teal.shade400,
                            elevation: 0,
                          ),
                        ),
                        Expanded(
                          child: RoundedLoadingButton(
                            animateOnTap: false,
                            child: const Text(
                              'shop now',
                              style: TextStyle(color: Colors.white),
                            ).tr(),
                            controller: controller.shopController,
                            onPressed: () => controller.shopNow(),
                            borderRadius: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                    visible: controller.changeState.value != ViewState.data,
                    child: const core_widgets.LoaderWidget()),
              ],
            );

          default:
            return const core_widgets.LoadingWidget();
        }
      }),
    );
  }

  Widget ratingItems(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Divider(
            thickness: 8,
            height: 10,
            color: Theme.of(context).colorScheme.onSecondary),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Theme.of(context).backgroundColor),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                core_widgets.Section(
                  title: 'ratingItems'.tr(),
                  onTap: () => print('data'),
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating:
                          double.parse(controller.resultItems.ratings!),
                      minRating: 1,
                      itemSize: 16,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      ignoreGestures: true,
                      itemCount: 5,
                      itemBuilder: (context, index) => Icon(
                          CupertinoIcons.star_fill,
                          color: Colors.amber.shade700),
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    AutoSizeText(
                        '${double.parse(controller.resultItems.ratings!).toStringAsFixed(1)} / 5',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        minFontSize: 12,
                        maxFontSize: 18,
                        style: TextStyle(
                            color: Colors.red[400],
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                Obx(() {
                  switch (controller.ratingsState.value) {
                    case ViewState.busy:
                      return const SizedBox(
                          height: 125, child: core_widgets.LoadingWidget());

                    case ViewState.error:
                      return const SizedBox(
                          height: 125, child: core_widgets.ErrorWidget());

                    case ViewState.data:
                      return UserRatingWidget(
                        resultRatings: controller.ratings,
                      );

                    default:
                      return const SizedBox(
                          height: 125, child: core_widgets.LoadingWidget());
                  }
                })
              ]),
        )
      ],
    );
  }

  Widget relatedItems(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Divider(
            thickness: 8,
            height: 10,
            color: Theme.of(context).colorScheme.onSecondary),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Theme.of(context).backgroundColor),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: core_widgets.Section(
                    title: 'related'.tr(),
                    onTap: () => print('data'),
                  ),
                ),
                const Divider(indent: 6),
                Obx(() {
                  switch (controller.relatedState.value) {
                    case ViewState.busy:
                      return MasonryGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 9 / 6,
                          crossAxisSpacing: 9 / 6,
                          primary: false,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
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
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          itemCount: controller.items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ItemGridWidget(
                              resultItems: controller.items[index],
                              controller: controller,
                            );
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
                }),
              ],
            )),
      ],
    );
  }
}
