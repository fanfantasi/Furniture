import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final String title;

  PersistentHeader(this.title);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(children: [
        Row(
          children: [
            Container(
              width: 3,
              height: 20,
              color: (shrinkOffset == 0.0)
                  ? Theme.of(context).primaryColor
                  : Colors.black87,
            ),
            const SizedBox(
              width: 5.0,
            ),
            Flexible(
              child: Text(title,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          color: (shrinkOffset == 0.0)
                              ? Colors.black87
                              : Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold))
                  .tr(),
            ),
          ],
        ),
      ]),
    );
  }

  @override
  double get maxExtent => 25.0;

  @override
  double get minExtent => 25.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
