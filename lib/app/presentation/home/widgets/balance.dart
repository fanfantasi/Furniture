import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget(
      {Key? key, required this.subLocality, required this.controller})
      : super(key: key);
  final String? subLocality;
  final HomeController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 42,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width / 2.5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.star_circle_fill,
                        color: Theme.of(context).colorScheme.background,
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Poin Anda',
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    const TextSpan(
                                        text: '0',
                                        style: TextStyle(
                                            color: Color(0xFFe2262f),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800)),
                                    TextSpan(
                                        text: ' Poin',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary)),
                                  ],
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: VerticalDivider(
                    thickness: 1,
                  ),
                ),
                SizedBox(
                    width: Get.width / 2.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saldo',
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.account_balance_wallet_outlined,
                              color: Color(0xFFe2262f),
                              size: 16,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text('Rp. 0',
                                style: TextStyle(
                                    color: Color(0xFFe2262f),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600))
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
