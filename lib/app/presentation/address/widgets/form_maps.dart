import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class FormMapsWidget extends StatelessWidget {
  const FormMapsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: .5,
        titleSpacing: 0,
        leading: IconButton(
            splashColor: Colors.transparent,
            onPressed: () => Get.back(),
            icon: const Icon(
              CupertinoIcons.back,
            )),
        title: Text('province'.tr()),
      ),
    );
  }
}
