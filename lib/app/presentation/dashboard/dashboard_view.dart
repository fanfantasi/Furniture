import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/presentation/dashboard/dashboard_controller.dart';
import 'package:home_decor/app/presentation/pesan/pesan_view.dart';

import '../favorite/favorite_view.dart';
import '../home/home_view.dart';
import '../profil/profil_view.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        key: controller.scaffoldKey,
        onWillPop: controller.onWillPop,
        child: Scaffold(
          body: Obx(() => activeScreen()),
          bottomNavigationBar: Obx(() => _bottonNavigationBar(context)),
        ));
  }

  Widget activeScreen() {
    switch (controller.selectedIndex.value) {
      case 0:
        return const HomeView();
      case 1:
        return const FavoriteScreen();
      case 2:
        return const PesanScreen();
      case 3:
        return const ProfilScreen();
      default:
        return const HomeView();
    }
  }

  AnimatedBottomNavigationBar _bottonNavigationBar(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: controller.iconList.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive
            ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
            : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor;

        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              controller.iconList[index],
              size: 20,
              color: color,
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                controller.textList[index],
                style: TextStyle(color: color, fontSize: 14),
              ),
            )
          ],
        );
      },
      gapLocation: GapLocation.none,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      activeIndex: controller.selectedIndex.value,
      splashSpeedInMilliseconds: 200,
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      splashColor: Theme.of(context).primaryColor,
      onTap: (index) => controller.onMenuTapped(index),
    );
  }
}
