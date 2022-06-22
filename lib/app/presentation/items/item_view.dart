import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/presentation/items/item_controller.dart';
import 'package:like_button/like_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../core/config/formatter.dart';
import '../../core/widgets/itemheaders.dart';
import '../../core/widgets/index.dart' as core_widgets;

class ItemScreen extends GetView<ItemController> {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
                collapsedHeight: 60,
                imgUrl: controller.resultItems.image!,
                point: controller.resultItems.point!,
                expandedHeight: 220,
                paddingTop: 20,
                title: controller.resultItems.title!),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Card(
              elevation: .4,
              child: SizedBox(
                  height: 120,
                  width: Get.width - 20,
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            controller.resultItems.subtitle!.toUpperCase(),
                            maxFontSize: 18,
                            minFontSize: 12,
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating: double.parse(
                                          controller.resultItems.ratings!),
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
                                      double.parse(
                                              controller.resultItems.ratings!)
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
                                  isLiked: controller.resultItems.favorite,
                                  onTap: controller.postFavorite,
                                  size: 22,
                                  circleColor: const CircleColor(
                                      start: Color(0xff00ddff),
                                      end: Color(0xff0099cc)),
                                  bubblesColor: const BubblesColor(
                                    dotPrimaryColor: Color(0xff33b5e5),
                                    dotSecondaryColor: Color(0xff0099cc),
                                  ),
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      CupertinoIcons.heart,
                                      color: isLiked ? Colors.red : Colors.grey,
                                      size: 18,
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ))),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 6.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Theme.of(context).backgroundColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const core_widgets.HeadersWidget(title: 'items desc'),
                  const Divider(),
                  ExpandText(
                    controller.resultItems.desc!,
                    maxLines: 4,
                    arrowColor: Theme.of(context).colorScheme.secondary,
                    expandWidth: true,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ]))
        ]),
        bottomNavigationBar: Container(
          height: 42,
          decoration: BoxDecoration(
              border: Border.all(
                  width: .5, color: Theme.of(context).colorScheme.onSecondary)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                child: RoundedLoadingButton(
                  animateOnTap: true,
                  child: Wrap(
                    children: [
                      Icon(CupertinoIcons.chat_bubble,
                          color: Theme.of(context).colorScheme.background)
                    ],
                  ),
                  controller: controller.addController,
                  onPressed: () {
                    controller.addController.reset();
                  },
                  borderRadius: 2,
                  valueColor: Theme.of(context).colorScheme.background,
                  width: Get.width / 4,
                  color: Theme.of(context).backgroundColor,
                  elevation: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: VerticalDivider(
                  color: Theme.of(context).colorScheme.surface,
                  width: 1,
                ),
              ),
              GestureDetector(
                child: RoundedLoadingButton(
                  animateOnTap: true,
                  child: Wrap(
                    children: const [
                      Icon(Icons.add_shopping_cart_rounded,
                          color: Color(0xFFe2262f))
                    ],
                  ),
                  controller: controller.addController,
                  onPressed: () {
                    controller.addController.reset();
                  },
                  borderRadius: 2,
                  valueColor: Theme.of(context).colorScheme.background,
                  width: Get.width / 4,
                  color: Theme.of(context).backgroundColor,
                  elevation: 1,
                ),
              ),
              Expanded(
                child: GestureDetector(
                  child: RoundedLoadingButton(
                    animateOnTap: true,
                    child: Wrap(
                      children: [
                        const Text(
                          'shop now',
                          style: TextStyle(color: Colors.white),
                        ).tr()
                      ],
                    ),
                    controller: controller.addController,
                    onPressed: () {
                      controller.addController.reset();
                    },
                    borderRadius: 2,
                    color: Theme.of(context).primaryColor,
                    elevation: 1,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
