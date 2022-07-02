import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/core/errors/failure.dart';
import 'package:home_decor/app/core/network/network_info.dart';
import 'package:home_decor/app/core/usecases/usecase.dart';
import 'package:home_decor/app/data/datasources/local/favorite_local_datasource.dart';
import 'package:home_decor/app/domain/entities/images_item.dart';
import 'package:home_decor/app/domain/entities/items.dart';
import 'package:home_decor/app/domain/entities/ratings.dart';
import 'package:home_decor/app/domain/usecases/favorite/get_local_favorite.dart';
import 'package:home_decor/app/domain/usecases/favorite/post_local_favorite.dart';
import 'package:home_decor/app/domain/usecases/items/get_remote_images.dart';
import 'package:home_decor/app/domain/usecases/items/get_remote_itembyid.dart';
import 'package:home_decor/app/domain/usecases/items/get_remote_ratings.dart';
import 'package:home_decor/app/domain/usecases/items/get_remote_related.dart';
import 'package:home_decor/app/presentation/cart/cart_controller.dart';
import 'package:home_decor/app/presentation/category/category_controller.dart';
import 'package:home_decor/app/presentation/favorite/favorite_controller.dart';
import 'package:home_decor/app/presentation/home/home_controller.dart';
import 'package:home_decor/app/routes/app_pages.dart';
import 'package:home_decor/main.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../injector.dart';
import '../../data/model/items.dart';
import '../../domain/usecases/favorite/delete_local_favorite.dart';

class ItemController extends GetxController {
  final scrollViewController = ScrollController();
  int currentPage = 0;
  int currentPageRatings = 0;
  final shopController = RoundedLoadingButtonController();
  final addController = RoundedLoadingButtonController();
  final chatController = RoundedLoadingButtonController();

  final postLocalFavorite = Injector.resolve<PostLocalFavorite>();
  final deleteLocalFavorite = Injector.resolve<DeleteLocalFavorite>();

  final network = Injector.resolve<NetworkInfoI>();
  final getRemoteItemByid = Injector.resolve<GetRemoteItemByid>();
  final getLocalFavorite = Injector.resolve<GetLocalFavorite>();
  final getRemoteRatings = Injector.resolve<GetRemoteRatings>();
  final getRemoteItemsRelated = Injector.resolve<GetRemoteItemsRelated>();
  final getRemoteImagesItem = Injector.resolve<GetRemoteImagesItem>();
  final connectvityResult = ConnectivityResult.none.obs;

  final viewState = ViewState.initial.obs;
  final ratingsState = ViewState.initial.obs;
  final changeState = ViewState.data.obs;
  final relatedState = ViewState.initial.obs;
  final isRelated = false.obs;
  final imageState = ViewState.initial.obs;

  late ResultItems resultItems;

  RxList<ResultItems> item = <ResultItems>[].obs;
  List<ResultItems> get items => List.from(item);

  List<ResultImagesItem> image = [];
  List<ResultImagesItem> get images => List.from(image);

  List<ResultRatings> rating = [];
  List<ResultRatings> get ratings => List.from(rating);

  List<ResultItems> localitem = [];
  List<ResultItems> get localitems => List.from(localitem);

  RxInt get cartCounts => Get.find<CartController>().carts.length.obs;

  @override
  void onInit() async {
    await Injector.resolve<FavoriteDataSource>().initDb();
    connectvityResult.value = await network.connectivityResult;
    if (connectvityResult.value == ConnectivityResult.none) {
      Get.snackbar("Can't refresh when offline",
          "Please connect your device to wifi or mobile network",
          snackPosition: SnackPosition.TOP);
    } else {
      fetchItemById();
    }
    super.onInit();
  }

  Future<void> fetchItemById({int? itemid}) async {
    if (changeState.value == ViewState.data) {
      if (viewState.value == ViewState.busy) return;
      if (connectvityResult.value == ConnectivityResult.none) {
        Get.snackbar("Can't refresh when offline",
            "Please connect your device to wifi or mobile network",
            snackPosition: SnackPosition.TOP);
        return;
      }
      _setState(ViewState.busy);
      image.clear();
      final result = await getRemoteItemByid.call(itemid ?? Get.arguments);
      _handleFetchResult(result, false);
    } else {
      if (connectvityResult.value == ConnectivityResult.none) {
        Get.snackbar("Can't refresh when offline",
            "Please connect your device to wifi or mobile network",
            snackPosition: SnackPosition.TOP);
        return;
      }

      image.clear();
      final result = await getRemoteItemByid.call(itemid ?? Get.arguments);
      _handleFetchResult(result, true);
    }
  }

  void _handleFetchResult(Either<Failure, ResultItems> result,
      [loader = false]) {
    result.fold((feilure) {
      _setState(ViewState.error);
    }, (data) async {
      final local = await getLocalFavorite.call(NoParams());
      local.fold((l) => null, (r) => localitem = r);
      int idx = localitems.indexWhere((e) => e.id == data.id);
      if (idx != -1) {
        ResultItemsModel res = ResultItemsModel(
            id: data.id,
            categoryid: data.categoryid,
            title: data.title,
            subtitle: data.subtitle,
            desc: data.desc,
            link: data.link,
            status: data.status,
            active: data.active,
            view: data.view,
            ratings: data.ratings,
            recommend: data.recommend,
            image: data.image,
            point: data.point,
            createdAt: data.createdAt,
            price: data.price,
            favorite: true);
        resultItems = res;
      } else {
        resultItems = data;
      }

      await fetchRatings(itemid: data.id);

      await fetchImagesItem(itemid: data.id);
      if (loader) {
        setChangeState(ViewState.data);
      } else {
        _setState(ViewState.data);
      }
    });
  }

  Future<void> fetchRatings({int? itemid}) async {
    if (ratingsState.value == ViewState.busy) return;
    if (connectvityResult.value == ConnectivityResult.none) {
      return;
    }
    _ratingsState(ViewState.busy);
    final result = await getRemoteRatings
        .call(Tuple2(currentPageRatings, resultItems.id!));
    _handleFetchRatingsResult(result);
  }

  void _handleFetchRatingsResult(Either<Failure, List<ResultRatings>> result) {
    result.fold((feilure) {
      _ratingsState(ViewState.error);
    }, (data) async {
      rating = data;
      _ratingsState(ViewState.data);
    });
  }

  Future<void> fetchImagesItem({int? itemid}) async {
    final result = await getRemoteImagesItem.call(itemid!);
    result.fold((feilure) {
      image.add(ResultImagesItem(
          id: 0, itemid: resultItems.id, image: resultItems.image));
    }, (data) async {
      image.add(ResultImagesItem(
          id: 0, itemid: resultItems.id, image: resultItems.image));
      for (var item in data) {
        image.add(ResultImagesItem(
            id: item.id, itemid: item.itemid, image: item.image));
      }
      await fetchRelated(itemid: itemid);
    });
  }

  Future<void> fetchRelated({int? itemid}) async {
    if (relatedState.value == ViewState.busy) return;
    if (connectvityResult.value == ConnectivityResult.none) {
      Get.snackbar("Can't refresh when offline",
          "Please connect your device to wifi or mobile network",
          snackPosition: SnackPosition.TOP);
      return;
    }
    _relatedState(ViewState.busy);
    final result = await getRemoteItemsRelated
        .call(Tuple3(currentPage, resultItems.categoryid!, resultItems.id!));
    _handleFetchRelatedResult(result);
  }

  void _handleFetchRelatedResult(Either<Failure, List<ResultItems>> result) {
    result.fold((feilure) {
      _relatedState(ViewState.error);
      Get.snackbar('Refresh failed!', "Can't load items related",
          snackPosition: SnackPosition.TOP);
      isRelated.value = false;
    }, (data) async {
      item.value = data;
      _handleItemsResult();
      if (item.isNotEmpty) isRelated.value = true;
      _relatedState(ViewState.data);
    });
  }

  Future _handleItemsResult() async {
    List<String> tempList = [];
    List<String> contList = [];
    for (var i = 0; i < items.length; i++) {
      tempList.add(items[i].id!.toString());
    }
    for (var i = 0; i < localitem.length; i++) {
      contList.add(localitem[i].id!.toString());
    }

    for (var el in tempList) {
      bool isContains = contList.any((e) => el.contains(e));

      if (!isContains) {
        final result = item[item.indexWhere((e) => e.id == int.parse(el))];
        ResultItemsModel res = ResultItemsModel(
            id: result.id,
            categoryid: result.categoryid,
            title: result.title,
            subtitle: result.subtitle,
            desc: result.desc,
            link: result.link,
            status: result.status,
            active: result.active,
            view: result.view,
            ratings: result.ratings,
            recommend: result.recommend,
            image: result.image,
            point: result.point,
            createdAt: result.createdAt,
            price: result.price,
            favorite: false);
        item[item.indexWhere((e) => e.id == int.parse(el))] = res;
      } else {
        final result = item[item.indexWhere((e) => e.id == int.parse(el))];
        ResultItemsModel res = ResultItemsModel(
            id: result.id,
            categoryid: result.categoryid,
            title: result.title,
            subtitle: result.subtitle,
            desc: result.desc,
            link: result.link,
            status: result.status,
            active: result.active,
            view: result.view,
            ratings: result.ratings,
            recommend: result.recommend,
            image: result.image,
            point: result.point,
            createdAt: result.createdAt,
            price: result.price,
            favorite: true);
        item[item.indexWhere((e) => e.id == int.parse(el))] = res;
      }
    }
  }

  Future<bool> postFavorite(bool isLiked) async {
    if (isLiked) {
      await deleteLocalFavorite.call(resultItems.id!);
      ResultItemsModel res = ResultItemsModel(
          id: resultItems.id,
          categoryid: resultItems.categoryid,
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
          categoryid: resultItems.categoryid,
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
          categoryid: resultItems.categoryid,
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

  void addToCart() async {
    final cartController = Get.find<CartController>();
    final res = await cartController.postCart(cart: resultItems);
    if (res) {
      addController.success();
    } else {
      addController.error();
    }

    Future.delayed(const Duration(milliseconds: 300), () {
      addController.reset();
      // cartCount.value = Get.find<CartController>().carts.length;
    });
  }

  void scrollToTop() {
    scrollViewController.animateTo(0,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
  }

  void clearCart() async {
    Get.find<CartController>().clearCart();
    // cartCount.value = Get.find<CartController>().carts.length;
  }

  void _setState(ViewState state) {
    viewState.value = state;
  }

  void _ratingsState(ViewState state) {
    ratingsState.value = state;
  }

  void setChangeState(ViewState state) {
    changeState.value = state;
  }

  void _relatedState(ViewState state) {
    relatedState.value = state;
  }
}
