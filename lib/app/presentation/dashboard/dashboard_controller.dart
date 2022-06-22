import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Trans;
import 'package:home_decor/app/core/config/constants.dart';

class DashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<IconData> iconList = [
    CupertinoIcons.home,
    CupertinoIcons.heart,
    CupertinoIcons.chat_bubble_text,
    CupertinoIcons.person_alt_circle,
  ];
  final List<String> textList = [
    "Home",
    "favorite".tr(),
    "message".tr(),
    "profile".tr()
  ];

  var timer = 0;
  void onMenuTapped(index) {
    selectedIndex.value = index;
  }

  Future<bool> onWillPop() async {
    if (selectedIndex.value != 0) {
      onMenuTapped(0);
      timer = 0;
    } else {
      timer = timer + 1;
      if (timer < 2) {
        Fluttertoast.showToast(
            msg: "Tap again to exit",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Constants.appThemeColor.withOpacity(.4),
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        return true;
      }
    }
    // ignore: null_check_always_fails
    return null!;
  }
}
