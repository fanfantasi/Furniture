import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointWidget extends StatelessWidget {
  const PointWidget({Key? key, required this.point}) : super(key: key);
  final int point;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          CupertinoIcons.star_circle_fill,
          size: 12,
          color: Theme.of(context).colorScheme.background,
        ),
        const SizedBox(
          width: 5.0,
        ),
        AutoSizeText(
          point.toString(),
          maxFontSize: 12,
          minFontSize: 10,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(
          width: 5.0,
        ),
        AutoSizeText(
          'Poin',
          maxFontSize: 12,
          minFontSize: 10,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ],
    );
  }
}
