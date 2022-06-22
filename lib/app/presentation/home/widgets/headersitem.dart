import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderItems extends StatelessWidget {
  const HeaderItems({Key? key, required this.images, required this.title})
      : super(key: key);
  final String? images;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 6,
      height: 82,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: Theme.of(context).colorScheme.background,
            child: Container(
              margin: const EdgeInsets.all(3),
              height: Get.width / 4.5,
              width: Get.width / 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.onPrimary,
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(images!)),
              ),
            ),
          ),
          AutoSizeText(
            title!,
            maxFontSize: 11,
            minFontSize: 10,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 11, color: Theme.of(context).colorScheme.secondary),
          )
        ],
      ),
    );
  }
}
