import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          title: const Text('page not found').tr(),
        ),
        body: SizedBox(
          height: Get.height,
          width: double.infinity,
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/icons/ic-bg.png',
                  scale: 2,
                  color: Theme.of(context).primaryColor.withOpacity(.1),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      'assets/icons/ic-sad.png',
                      scale: 4,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'page not found',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ).tr(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'page not found desc',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ).tr(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
