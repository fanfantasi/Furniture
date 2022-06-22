import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HeadersWidget extends StatelessWidget {
  const HeadersWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      child: Column(children: [
        Row(
          children: [
            Container(
              width: 2,
              height: 20,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 5.0,
            ),
            Flexible(
              child: AutoSizeText(title.tr(),
                  maxLines: 1,
                  minFontSize: 12,
                  maxFontSize: 16,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ]),
    );
  }
}
