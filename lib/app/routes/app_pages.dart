import 'package:get/get.dart';
import 'package:home_decor/app/presentation/address/address_binding.dart';
import 'package:home_decor/app/presentation/address/address_view.dart';
import 'package:home_decor/app/presentation/address/widgets/form_add.dart';
import 'package:home_decor/app/presentation/cart/cart_view.dart';
import 'package:home_decor/app/presentation/category/category_view.dart';
import 'package:home_decor/app/presentation/checkout/checkout_binding.dart';
import 'package:home_decor/app/presentation/checkout/checkout_view.dart';
import 'package:home_decor/app/presentation/items/item_binding.dart';
import 'package:home_decor/app/presentation/profil/widgets/languages.dart';
import 'package:home_decor/app/presentation/promo/promo_binding.dart';
import 'package:home_decor/app/presentation/search/search_binding.dart';
import 'package:home_decor/app/presentation/search/search_view.dart';
import 'package:home_decor/app/presentation/search/widgets/search_result.dart';

import '../presentation/category/category_binding.dart';
import '../presentation/dashboard/dashboard_binding.dart';
import '../presentation/dashboard/dashboard_view.dart';
import '../presentation/items/item_view.dart';
import '../presentation/items/widgets/images_view.dart';
import '../presentation/promo/promo_view.dart';
import '../presentation/splashscreen/splashscreen_binding.dart';
import '../presentation/splashscreen/splashscreen_view.dart';
part 'app_routes.dart';

class AppPages {
  static const inital = Routes.splashscreen;

  static final routes = [
    GetPage(
        name: Routes.splashscreen,
        page: () => const SplashScreen(),
        binding: SplashscreenBinding()),
    GetPage(
        name: Routes.dashboard,
        page: () => const DashboardScreen(),
        binding: DashboardBinding()),
    GetPage(
        name: Routes.item,
        page: () => const ItemScreen(),
        binding: ItemBinding()),
    GetPage(
        name: Routes.category,
        page: () => const CategoryScreen(),
        binding: CategoryBinding()),
    GetPage(
        name: Routes.promo,
        page: () => const PromoScreen(),
        binding: PromoBinding()),
    GetPage(
        name: Routes.search,
        page: () => const SearchScreen(),
        binding: SearchBinding()),
    GetPage(
      name: Routes.searchresult,
      page: () => const SearchResultScreen(),
    ),
    GetPage(
        name: Routes.languages,
        page: () => const LanguageScreen(),
        fullscreenDialog: true),
    GetPage(
        name: Routes.imageview,
        fullscreenDialog: true,
        page: () => const ImagesView()),
    GetPage(
        name: Routes.cart,
        page: () => const CartScreen(),
        transition: Transition.cupertino),
    GetPage(
        name: Routes.checkout,
        page: () => const CheckoutScreen(),
        transition: Transition.cupertino,
        binding: CheckoutBinding()),
    GetPage(
        name: Routes.address,
        page: () => const AddressScreen(),
        transition: Transition.cupertino,
        binding: AddressBinding()),
    GetPage(
        name: Routes.addAddress,
        page: () => const FormAddWidget(),
        transition: Transition.cupertino),
  ];
}
