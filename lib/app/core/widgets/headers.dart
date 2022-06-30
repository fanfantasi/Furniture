import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HeadersWidget extends StatelessWidget {
  const HeadersWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: AutoSizeText(
        title,
        maxFontSize: 16,
        minFontSize: 12,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            letterSpacing: 1,
            color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}
