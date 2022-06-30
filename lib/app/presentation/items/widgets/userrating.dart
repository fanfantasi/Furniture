import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart' hide Trans;
import 'package:home_decor/app/domain/entities/ratings.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../core/config/formatter.dart';

class UserRatingWidget extends StatelessWidget {
  const UserRatingWidget({Key? key, required this.resultRatings})
      : super(key: key);
  final List<ResultRatings> resultRatings;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: resultRatings.length,
      itemBuilder: (context, i) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
              child: ClipOval(
                  child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: resultRatings[i].avatar!,
                fit: BoxFit.fitWidth,
                imageErrorBuilder: (BuildContext context, Object obj, _) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(CupertinoIcons.person_alt_circle),
                  );
                },
              )),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  resultRatings[i].displayname!,
                  maxFontSize: 14,
                  minFontSize: 10,
                ),
                RatingBar.builder(
                  initialRating: double.parse(resultRatings[i].rating!),
                  minRating: 1,
                  itemSize: 12,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemCount: 5,
                  itemBuilder: (context, index) => Icon(
                      CupertinoIcons.star_fill,
                      color: Colors.amber.shade700),
                  onRatingUpdate: (rating) {},
                ),
                RichText(
                  text: TextSpan(
                    text: 'features'.tr(),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 12),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              ' ${Formatter.options(int.parse(resultRatings[i].features!))}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12))
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'quality'.tr(),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 12),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              ' ${Formatter.options(int.parse(resultRatings[i].quality!))}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12))
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width / 1.2,
                  child: AutoSizeText(
                    resultRatings[i].review!,
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    maxFontSize: 12,
                    minFontSize: 10,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
