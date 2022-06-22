import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategoryWidget extends StatelessWidget {
  const ShimmerCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Shimmer.fromColors(
            baseColor: Theme.of(context).colorScheme.onSecondary,
            highlightColor: Theme.of(context).colorScheme.surface,
            child: Column(
              children: [
                Container(
                  width: 32.0,
                  height: 32.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                ),
                Container(
                  width: Get.width / 7,
                  height: 12.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            )));
  }
}

class ErrorCategoryWidget extends StatelessWidget {
  const ErrorCategoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              width: 32.0,
              height: 32.0,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              child: Icon(Icons.offline_bolt, color: Colors.blue.shade700),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
            ),
            SizedBox(
              width: Get.width / 7,
              child: const Center(
                child: Text('Data Error',
                    style: TextStyle(fontSize: 12, color: Colors.white)),
              ),
            ),
          ],
        ));
  }
}
