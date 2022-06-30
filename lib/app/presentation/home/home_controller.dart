import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/data/model/items.dart';
import 'package:home_decor/app/domain/entities/promo.dart';
import 'package:home_decor/app/domain/usecases/category/get_remote_category.dart';
import 'package:home_decor/app/domain/usecases/favorite/get_local_favorite.dart';
import 'package:home_decor/app/domain/usecases/promo/get_remote_promo.dart';
import 'package:home_decor/injector.dart';
import '../../../main.dart';
import '../../core/errors/failure.dart';
import '../../core/network/network_info.dart';
import '../../core/usecases/usecase.dart';
import '../../data/datasources/local/favorite_local_datasource.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/items.dart';
import '../../domain/usecases/items/get_remote_items.dart';

class HomeController extends GetxController {
  final scrollViewController = ScrollController();
  final focusNode = FocusNode();
  int currentPage = 0;

  final network = Injector.resolve<NetworkInfoI>();
  final getRemoteItems = Injector.resolve<GetRemoteItems>();
  final getLocalFavorite = Injector.resolve<GetLocalFavorite>();
  final getRemoteCategory = Injector.resolve<GetRemoteCategory>();
  final getRemotePromo = Injector.resolve<GetRemotePromo>();
  final connectvityResult = ConnectivityResult.none.obs;

  final categoryState = ViewState.initial.obs;
  List<ResultCategory> category = [];
  List<ResultCategory> get catgories => List.from(category);

  final promoState = ViewState.initial.obs;
  List<ResultPromo> promo = [];
  List<ResultPromo> get promos => List.from(promo);

  final viewState = ViewState.initial.obs;
  RxList<ResultItems> item = <ResultItems>[].obs;
  List<ResultItems> get items => List.from(item);

  List<ResultItems> localitem = [];
  List<ResultItems> get localitems => List.from(localitem);

  @override
  void onInit() async {
    connectvityResult.value = await network.connectivityResult;
    await Injector.resolve<FavoriteDataSource>().initDb();
    if (connectvityResult.value == ConnectivityResult.none) {
      Get.snackbar("Can't refresh when offline",
          "Please connect your device to wifi or mobile network",
          snackPosition: SnackPosition.TOP);
    } else {
      await categoryRemoteFetch();
      await promoRemoteFetch();
      await remoteFetch();
    }

    network.onConnectivityChanged.listen((event) async {
      connectvityResult.value = event;
      if (event != ConnectivityResult.none) {
        // if ((item.isEmpty)) {
        //   await categoryRemoteFetch();
        //   await promoRemoteFetch();
        //   await remoteFetch();
        // }
      }
    });
    super.onInit();
  }

  Future<void> categoryRemoteFetch() async {
    if (categoryState.value == ViewState.busy) return;
    if (connectvityResult.value == ConnectivityResult.none) {
      Get.snackbar("Can't refresh when offline",
          "Please connect your device to wifi or mobile network",
          snackPosition: SnackPosition.TOP);
      return;
    }
    _setCategoryState(ViewState.busy);
    final result = await getRemoteCategory.call(NoParams());
    _handleCategoryFetchResult(result);
  }

  void _handleCategoryFetchResult(
      Either<Failure, List<ResultCategory>> result) {
    result.fold((feilure) {
      _setCategoryState(ViewState.error);
      Get.snackbar('Refresh failed!', "Can't load category",
          snackPosition: SnackPosition.TOP);
    }, (data) {
      category = data;
      _setCategoryState(ViewState.data);
    });
  }

  Future<void> promoRemoteFetch() async {
    if (promoState.value == ViewState.busy) return;
    if (connectvityResult.value == ConnectivityResult.none) {
      Get.snackbar("Can't refresh when offline",
          "Please connect your device to wifi or mobile network",
          snackPosition: SnackPosition.TOP);
      return;
    }
    _setPromoState(ViewState.busy);
    final result = await getRemotePromo.call(NoParams());
    _handlePromoFetchResult(result);
  }

  void _handlePromoFetchResult(Either<Failure, List<ResultPromo>> result) {
    result.fold((feilure) {
      _setPromoState(ViewState.error);
      Get.snackbar('Refresh failed!', "Can't load promo",
          snackPosition: SnackPosition.TOP);
    }, (data) {
      promo = data;
      _setPromoState(ViewState.data);
    });
  }

  Future<void> remoteFetch() async {
    if (viewState.value == ViewState.busy) return;
    if (connectvityResult.value == ConnectivityResult.none) {
      Get.snackbar("Can't refresh when offline",
          "Please connect your device to wifi or mobile network",
          snackPosition: SnackPosition.TOP);
      return;
    }
    _setState(ViewState.busy);
    final result = await getRemoteItems.call(currentPage);
    _handleFetchResult(result);
  }

  void _handleFetchResult(Either<Failure, List<ResultItems>> result) {
    result.fold((feilure) {
      _setState(ViewState.error);
      Get.snackbar('Refresh failed!', "Can't load items",
          snackPosition: SnackPosition.TOP);
    }, (data) async {
      final local = await getLocalFavorite.call(NoParams());
      local.fold((l) => null, (r) => localitem = r);

      item.value = data;
      _handleItemsResult();

      _setState(ViewState.data);
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

  Future<void> onRefresh() async {
    await remoteFetch();
  }

  void _setPromoState(ViewState state) {
    promoState.value = state;
  }

  void _setCategoryState(ViewState state) {
    categoryState.value = state;
  }

  void _setState(ViewState state) {
    viewState.value = state;
  }
}
