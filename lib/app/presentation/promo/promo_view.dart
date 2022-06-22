import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/presentation/promo/promo_controller.dart';

import '../../core/widgets/itemheaders.dart';

class PromoScreen extends GetView<PromoController> {
  const PromoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
                collapsedHeight: 60,
                imgUrl: controller.promo.image!,
                expandedHeight: 160,
                paddingTop: 20,
                title: controller.promo.title!),
          ),
        ],
      ),
    );
  }
}
