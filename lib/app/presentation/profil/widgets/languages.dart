import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:home_decor/app/presentation/profil/profil_controller.dart';

class LanguageScreen extends GetView<ProfilController> {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'select language',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ).tr(),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: controller.languages.length,
        itemBuilder: (BuildContext context, int index) {
          return _itemList(context, controller.languages[index], index);
        },
      ),
    );
  }

  Widget _itemList(BuildContext context, d, index) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.language,
            size: 22,
          ),
          horizontalTitleGap: 10,
          title: Text(
            d,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          onTap: () async {
            if (d == 'English') {
              var locale = const Locale('en', 'US');
              await context.setLocale(locale);
              Get.updateLocale(locale);
            } else if (d == 'Indonesia') {
              var locale = const Locale('id', 'ID');
              await context.setLocale(locale);
              Get.updateLocale(locale);
            }
            Get.back();
          },
        ),
        Divider(
          height: 0,
          indent: 50,
          color: Colors.grey[400],
        )
      ],
    );
  }
}
