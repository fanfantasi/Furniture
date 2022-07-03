import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart' hide Trans;
import 'package:home_decor/app/presentation/address/address_controller.dart';
import '../../../core/widgets/index.dart' as core_widgets;

class FormAddWidget extends GetView<AddressController> {
  const FormAddWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: .5,
        titleSpacing: 0,
        leading: IconButton(
            splashColor: Colors.transparent,
            onPressed: () => Get.back(),
            icon: const Icon(
              CupertinoIcons.back,
            )),
        title: Text('add address'.tr()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).colorScheme.onSecondary,
              width: Get.width,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'contact',
                style: TextStyle(
                    fontSize: 12,
                    letterSpacing: -0.7,
                    wordSpacing: 1,
                    color: Theme.of(context).colorScheme.primary),
              ).tr(),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12.0),
              child: Column(
                children: [
                  core_widgets.LabeledText(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'fullname required'.tr()),
                    ]),
                    label: 'fullname'.tr(),
                    controller: controller.fullnameController,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  core_widgets.LabeledText(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'phone required'.tr()),
                    ]),
                    label: 'phone'.tr(),
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                  )
                ],
              ),
            ),
            Container(
              color: Theme.of(context).colorScheme.onSecondary,
              width: Get.width,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'address',
                style: TextStyle(
                    fontSize: 12,
                    letterSpacing: -0.7,
                    wordSpacing: 1,
                    color: Theme.of(context).colorScheme.primary),
              ).tr(),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12.0),
              child: Column(
                children: [
                  core_widgets.LabeledText(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'province required'.tr()),
                    ]),
                    label: 'province'.tr(),
                    controller: controller.fullnameController,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  core_widgets.LabeledText(
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'home required'.tr()),
                    ]),
                    label: 'home'.tr(),
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  core_widgets.LabeledText(
                    label: 'other'.tr(),
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                  )
                ],
              ),
            ),
            Container(
              color: Theme.of(context).colorScheme.onSecondary,
              width: Get.width,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'settings',
                style: TextStyle(
                    fontSize: 12,
                    letterSpacing: -0.7,
                    wordSpacing: 1,
                    color: Theme.of(context).colorScheme.primary),
              ).tr(),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'flag as',
                        style: TextStyle(
                            fontSize: 12,
                            letterSpacing: -0.7,
                            wordSpacing: 1,
                            color: Theme.of(context).colorScheme.primary),
                      ).tr(),
                      core_widgets.AnimatedToggleText(
                        width: 130,
                        values: const ['house', 'office'],
                        onToggleCallback: (value) {
                          // setState(() {
                          //   _toggleValue = value;
                          // });
                        },
                        buttonColor: const Color(0xFF0A3157),
                        backgroundColor:
                            Theme.of(context).colorScheme.onSecondary,
                        textColor: const Color(0xFFFFFFFF),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'primary address',
                        style: TextStyle(
                            fontSize: 12,
                            letterSpacing: -0.7,
                            wordSpacing: 1,
                            color: Theme.of(context).colorScheme.primary),
                      ).tr(),
                      core_widgets.AnimatedToggleText(
                        width: 115,
                        values: const ['yes', 'no'],
                        onToggleCallback: (value) {
                          // setState(() {
                          //   _toggleValue = value;
                          // });
                        },
                        buttonColor: Theme.of(context).colorScheme.background,
                        backgroundColor:
                            Theme.of(context).colorScheme.onSecondary,
                        textColor: const Color(0xFFFFFFFF),
                      ),
                    ],
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
