import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PesanScreen extends StatelessWidget {
  const PesanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: .2,
        title: AutoSizeText(
          'message'.tr(),
          maxFontSize: 18,
          minFontSize: 14,
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w700,
              letterSpacing: 0,
              fontSize: 18),
        ),
      ),
    );
  }
}
