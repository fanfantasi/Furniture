import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({Key? key, required this.width}) : super(key: key);
  // final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Shimmer.fromColors(
        baseColor: Theme.of(context).colorScheme.onSecondary,
        highlightColor: Theme.of(context).colorScheme.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: width / 2.1,
                height: width / 2.8,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(4.0),
                    color: Theme.of(context).colorScheme.onSecondary)),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
            ),
            Container(
              height: 8.0,
              width: width / 2.5,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
            ),
            Container(
              width: width / 4,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              height: 8.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
            ),
            SizedBox(
              width: width / 2.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    height: 12.0,
                    width: width / 4.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    height: 12.0,
                    width: width / 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
