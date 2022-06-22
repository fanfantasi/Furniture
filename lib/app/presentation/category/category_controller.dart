import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/data/model/items.dart';
import 'package:home_decor/app/domain/usecases/items/get_remote_itemsbycategory.dart';
import 'package:home_decor/injector.dart';
import 'package:home_decor/main.dart';

import '../../core/errors/failure.dart';
import '../../core/network/network_info.dart';
import '../../core/usecases/usecase.dart';
import '../../data/datasources/local/favorite_local_datasource.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/items.dart';
import '../../domain/usecases/favorite/get_local_favorite.dart';

enum ViewSection { filter, sort, gridorlist }

class CategoryController extends GetxController {
  late ResultCategory category;
  final scrollViewController = ScrollController();
  int currentPage = 0;
  RxBool gridOrList = true.obs;
  RxBool sortUp = false.obs;

  final viewSection = ViewSection.gridorlist.obs;

  final network = Injector.resolve<NetworkInfoI>();
  final getRemoteItemsByCategory = Injector.resolve<GetRemoteItemsByCategory>();
  final getLocalFavorite = Injector.resolve<GetLocalFavorite>();
  final connectvityResult = ConnectivityResult.none.obs;

  final viewState = ViewState.initial.obs;
  RxList<ResultItems> item = <ResultItems>[].obs;
  List<ResultItems> get items => List.from(item);

  List<ResultItems> localitem = [];
  List<ResultItems> get localitems => List.from(localitem);

  @override
  void onInit() async {
    category = Get.arguments;
    connectvityResult.value = await network.connectivityResult;
    await Injector.resolve<FavoriteDataSource>().initDb();
    if (connectvityResult.value == ConnectivityResult.none) {
      Get.snackbar("Can't refresh when offline",
          "Please connect your device to wifi or mobile network",
          snackPosition: SnackPosition.TOP);
    } else {
      Future.delayed(const Duration(milliseconds: 300), () async {
        await remoteFetch();
      });
    }

    network.onConnectivityChanged.listen((event) async {
      connectvityResult.value = event;
      if (event != ConnectivityResult.none) {
        // if ((item.isEmpty)) {
        //   await remoteFetch();
        // }
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    gridOrList.value = true;
    super.onClose();
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
    final result = await getRemoteItemsByCategory
        .call(Tuple2(currentPage, category.categoryid!));
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

  Future<void> sortItems() async {
    _setState(ViewState.busy);
    if (sortUp.value) {
      item.sort(
        (a, b) => b.title!.toLowerCase().compareTo(a.title!.toLowerCase()),
      );
    } else {
      item.sort(
        (a, b) => a.title!.toLowerCase().compareTo(b.title!.toLowerCase()),
      );
    }
    _setState(ViewState.data);
  }

  Future<void> onRefresh() async {
    await remoteFetch();
  }

  void _setState(ViewState state) {
    viewState.value = state;
  }

  void setViewSection(ViewSection state) {
    viewSection.value = state;
  }
}
