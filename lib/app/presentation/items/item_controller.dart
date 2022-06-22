import 'package:get/get.dart';
import 'package:home_decor/app/core/usecases/usecase.dart';
import 'package:home_decor/app/domain/entities/items.dart';
import 'package:home_decor/app/domain/usecases/favorite/post_local_favorite.dart';
import 'package:home_decor/app/presentation/category/category_controller.dart';
import 'package:home_decor/app/presentation/favorite/favorite_controller.dart';
import 'package:home_decor/app/presentation/home/home_controller.dart';
import 'package:home_decor/app/routes/app_pages.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../injector.dart';
import '../../data/model/items.dart';
import '../../domain/usecases/favorite/delete_local_favorite.dart';

class ItemController extends GetxController {
  late ResultItems resultItems;
  final addController = RoundedLoadingButtonController();

  final postLocalFavorite = Injector.resolve<PostLocalFavorite>();
  final deleteLocalFavorite = Injector.resolve<DeleteLocalFavorite>();

  @override
  void onInit() {
    resultItems = Get.arguments;
    super.onInit();
  }

  Future<bool> postFavorite(bool isLiked) async {
    if (isLiked) {
      await deleteLocalFavorite.call(resultItems.id!);
      ResultItemsModel res = ResultItemsModel(
          id: resultItems.id,
          title: resultItems.title,
          subtitle: resultItems.subtitle,
          desc: resultItems.desc,
          link: resultItems.link,
          status: resultItems.status,
          active: resultItems.active,
          view: resultItems.view,
          ratings: resultItems.ratings,
          recommend: resultItems.recommend,
          image: resultItems.image,
          point: resultItems.point,
          createdAt: resultItems.createdAt,
          price: resultItems.price,
          favorite: false);
      if (Get.previousRoute == Routes.category) {
        Get.find<CategoryController>().item[Get.find<CategoryController>()
            .item
            .indexWhere((e) => e.id == resultItems.id)] = res;
      }

      Get.find<HomeController>().item[Get.find<HomeController>()
          .item
          .indexWhere((e) => e.id == resultItems.id)] = res;

      //Get Favorite
      Get.find<FavoriteController>().countItem.value -= 1;
    } else {
      await postLocalFavorite.call(ParamsFavorite(
          id: resultItems.id,
          title: resultItems.title,
          subtitle: resultItems.subtitle,
          desc: resultItems.desc,
          link: resultItems.link,
          status: resultItems.status,
          active: resultItems.active,
          view: resultItems.view,
          ratings: resultItems.ratings,
          recommend: resultItems.recommend,
          image: resultItems.image,
          point: resultItems.point,
          createdAt: resultItems.createdAt,
          price: resultItems.price,
          favorite: true));
      ResultItemsModel res = ResultItemsModel(
          id: resultItems.id,
          title: resultItems.title,
          subtitle: resultItems.subtitle,
          desc: resultItems.desc,
          link: resultItems.link,
          status: resultItems.status,
          active: resultItems.active,
          view: resultItems.view,
          ratings: resultItems.ratings,
          recommend: resultItems.recommend,
          image: resultItems.image,
          point: resultItems.point,
          createdAt: resultItems.createdAt,
          price: resultItems.price,
          favorite: true);
      if (Get.previousRoute == Routes.category) {
        Get.find<CategoryController>().item[Get.find<CategoryController>()
            .item
            .indexWhere((e) => e.id == resultItems.id)] = res;
      }

      Get.find<HomeController>().item[Get.find<HomeController>()
          .item
          .indexWhere((e) => e.id == resultItems.id)] = res;

      //Get Favorite
      Get.find<FavoriteController>().countItem.value += 1;
    }
    return !isLiked;
  }
}
