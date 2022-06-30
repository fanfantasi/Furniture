import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' hide Trans;
import 'package:home_decor/app/core/widgets/topbar.dart';
import 'package:home_decor/app/presentation/profil/profil_controller.dart';
import 'package:home_decor/app/routes/app_pages.dart';
import 'package:home_decor/app/theme/theme_service.dart';
import 'package:home_decor/main.dart';
import '../../core/widgets/index.dart' as core_widgets;

class ProfilScreen extends GetView<ProfilController> {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 115,
                pinned: true,
                backgroundColor: Theme.of(context).primaryColor,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    color: Theme.of(context).backgroundColor,
                    child: const TopBar(),
                  ),
                  centerTitle: false,
                  title: const Text('profile',
                          style: TextStyle(color: Colors.white))
                      .tr(),
                  titlePadding:
                      const EdgeInsets.only(left: 20, bottom: 10, right: 20),
                ),
              ),
              SliverToBoxAdapter(
                  child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 4, bottom: 20),
                child: Column(
                  children: [
                    Obx(() {
                      switch (controller.viewState.value) {
                        case ViewState.busy:
                          return Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              child: !controller.isSigningIn.value
                                  ? const GuestUserUI()
                                  : const UserUI());
                        case ViewState.data:
                          return Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              child: !controller.isSigningIn.value
                                  ? const GuestUserUI()
                                  : const UserUI());
                        default:
                          return Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              child: !controller.isSigningIn.value
                                  ? const GuestUserUI()
                                  : const UserUI());
                      }
                    }),
                    const core_widgets.DividerWidget(),
                    userProfile(context)
                  ],
                ),
              ))
            ],
          ),
        ));
  }

  Widget userProfile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: CircleAvatar(
              backgroundColor: Colors.pink.shade500,
              radius: 18,
              child: Icon(
                Icons.language,
                size: 28,
                color: Colors.pink.shade100,
              ),
            ),
            title: Text(
              'language'.tr(),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary),
            ),
            subtitle: Text('select language'.tr()),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () => Get.toNamed(Routes.languages),
          ),
          const core_widgets.DividerWidget(),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: CircleAvatar(
              backgroundColor: Colors.indigo.shade500,
              radius: 18,
              child: Icon(
                Icons.wb_sunny,
                size: 22,
                color: Colors.indigo.shade100,
              ),
            ),
            title: Text(
              'dark mode'.tr(),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary),
            ),
            subtitle: Text('dark mode desc'.tr()),
            trailing: Switch(
                activeColor: Theme.of(context).primaryColor,
                value: ThemeService().isSaveDarkMode(),
                onChanged: (bool bool) {
                  ThemeService().changeThemeMode();
                }),
          ),
          const core_widgets.DividerWidget(),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.teal.shade500,
                  radius: 18,
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    size: 22,
                    color: Colors.teal.shade100,
                  ),
                ),
                Obx(() => Visibility(
                      visible: controller.cartCounts > 0,
                      child: Positioned(
                          top: 0.0,
                          right: 0.0,
                          child: Container(
                            height: 14,
                            width: 14,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Center(
                              child: AutoSizeText(
                                '${(controller.cartCounts > 9 ? '9+' : controller.cartCounts)}',
                                maxFontSize: 10,
                                minFontSize: 8,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          )),
                    ))
              ],
            ),
            title: Text(
              'cart'.tr(),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary),
            ),
            subtitle: Text('help desc'.tr()),
          ),
          const core_widgets.DividerWidget(),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: CircleAvatar(
              backgroundColor: Colors.green.shade500,
              radius: 18,
              child: Icon(
                Icons.help,
                size: 22,
                color: Colors.green.shade100,
              ),
            ),
            title: Text(
              'help'.tr(),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary),
            ),
            subtitle: Text('help desc'.tr()),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: CircleAvatar(
              backgroundColor: Colors.red.shade500,
              radius: 18,
              child: Icon(
                Icons.logout,
                size: 22,
                color: Colors.red.shade100,
              ),
            ),
            title: Text(
              'logout',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary),
            ).tr(),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () async {
              await Get.dialog(AlertDialog(
                title: const Text('logout title').tr(),
                content: const Text('logout description').tr(),
                actions: [
                  TextButton.icon(
                      onPressed: () => Get.back(result: false),
                      icon: const Icon(Icons.cancel, color: Colors.red),
                      label: const Text(
                        "no",
                        style: TextStyle(color: Colors.red),
                      ).tr()),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.check_rounded, color: Colors.blue),
                      label: const Text(
                        "yes",
                        style: TextStyle(color: Colors.blue),
                      ).tr()),
                ],
              ));
            },
          ),
        ],
      ),
    );
  }
}

class GuestUserUI extends StatelessWidget {
  const GuestUserUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: CircleAvatar(
              backgroundColor: Colors.cyan.shade300,
              radius: 18,
              child: Icon(
                CupertinoIcons.person_alt_circle,
                size: 26,
                color: Colors.cyan.shade50,
              ),
            ),
            title: Text(
              'login',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary),
            ).tr(),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {}),
      ],
    );
  }
}

class UserUI extends StatelessWidget {
  const UserUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: const CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 18,
              child: Icon(
                CupertinoIcons.person_alt_circle,
                size: 26,
                color: Colors.white,
              ),
            ),
            title: Text(
              'login',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary),
            ).tr(),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {}),
      ],
    );
  }
}
