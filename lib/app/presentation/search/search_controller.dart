import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/data/datasources/local/search_local_datasource.dart';
import 'package:home_decor/app/data/model/items.dart';
import 'package:home_decor/app/data/model/search.dart';
import 'package:home_decor/app/domain/usecases/items/get_remote_search.dart';
import 'package:home_decor/app/domain/usecases/search/clear_local_search.dart';
import 'package:home_decor/app/domain/usecases/search/delete_local_search.dart';
import 'package:home_decor/app/domain/usecases/search/get_local_single_search.dart';
import 'package:home_decor/app/domain/usecases/search/post_local_search.dart';
import 'package:home_decor/injector.dart';
import 'package:home_decor/main.dart';

import '../../core/errors/failure.dart';
import '../../core/network/network_info.dart';
import '../../core/usecases/usecase.dart';
import '../../data/datasources/local/favorite_local_datasource.dart';
import '../../domain/entities/items.dart';
import '../../domain/usecases/favorite/get_local_favorite.dart';
import '../../domain/usecases/items/get_remote_recommendation.dart';
import '../../domain/usecases/search/get_local_search.dart';

class SearchController extends GetxController {
  final searchController = TextEditingController();
  final searchText = ''.obs;
  void changesarch(string) => searchText.value = string;

  final network = Injector.resolve<NetworkInfoI>();
  final getRemoteRecommendation = Injector.resolve<GetRemoteRecommendation>();
  final getRemoteSearchItems = Injector.resolve<GetRemoteSearchItems>();
  final getLocalSearch = Injector.resolve<GetLocalSearch>();
  final getSingleLocalSearch = Injector.resolve<GetSingleLocalSearch>();
  final postLocalSearch = Injector.resolve<PostLocalSearch>();
  final deleteLocalSearch = Injector.resolve<DeleteLocalSearch>();
  final clearLocalSearch = Injector.resolve<ClearLocalSearch>();
  final getLocalFavorite = Injector.resolve<GetLocalFavorite>();
  final connectvityResult = ConnectivityResult.none.obs;
  int currentPageRecommendation = 0;
  int currentPageSearch = 0;
  RxBool gridOrList = true.obs;

  final viewState = ViewState.initial.obs;
  RxList<ResultItems> item = <ResultItems>[].obs;
  List<ResultItems> get items => List.from(item);

  List<ResultItems> localitem = [];
  List<ResultItems> get localitems => List.from(localitem);

  final searchState = ViewState.initial.obs;
  RxBool localData = true.obs;
  RxList<SearchModel> search = <SearchModel>[].obs;
  List<SearchModel> get searchs => List.from(search);
  RxList<ResultItems> searchResult = <ResultItems>[].obs;
  List<ResultItems> get searchResults => List.from(searchResult);

  @override
  void onInit() async {
    await Injector.resolve<SearchDataSource>().initDb();
    await Injector.resolve<FavoriteDataSource>().initDb();
    connectvityResult.value = await network.connectivityResult;
    localFetch();
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

    debounce(searchText, (_) async {
      _searchState(ViewState.busy);
      search.clear();
      if (searchText.value != '') {
        final result = await getRemoteSearchItems
            .call(Tuple2(currentPageSearch, searchText.value));
        result.fold((l) {
          _searchState(ViewState.error);
        }, (data) {
          for (var item in data) {
            search.add(SearchModel(
                id: item.id!, keyword: item.title!, createdAt: DateTime.now()));
          }
          localData.value = false;
          _searchState(ViewState.data);
        });
      } else {
        localFetch();
        localData.value = true;
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    _searchState(ViewState.initial);
    gridOrList.value = true;
    super.onClose();
  }

  Future<void> localFetch() async {
    _searchState(ViewState.busy);
    final result = await getLocalSearch.call(NoParams());
    result.fold((feilure) {}, (data) {
      if (data.length > 9) {
        for (var i = 0; i < 9; i++) {
          search.add(SearchModel(
              id: data[i].id,
              keyword: data[i].keyword,
              createdAt: data[i].createdAt));
        }
      } else {
        search.value = data;
      }
    });
    search.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    _searchState(ViewState.data);
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
    final result =
        await getRemoteRecommendation.call(currentPageRecommendation);
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

  Future<void> insertSearchData(string) async {
    if (string != '') {
      final res = await getSingleLocalSearch.call(string);
      res.fold((l) async {
        await postLocalSearch.call(ParamsSearch(
            id: Random().nextInt(100),
            keyword: string,
            createdAt: DateTime.now()));
        Future.delayed(const Duration(milliseconds: 300), () async {
          await remoteFetchSearch(string);
        });
      }, (r) async {
        Future.delayed(const Duration(milliseconds: 300), () async {
          await remoteFetchSearch(string);
        });
      });
      //
    }
  }

  Future<void> remoteFetchSearch(string) async {
    if (searchState.value == ViewState.busy) return;
    if (connectvityResult.value == ConnectivityResult.none) {
      Get.snackbar("Can't refresh when offline",
          "Please connect your device to wifi or mobile network",
          snackPosition: SnackPosition.TOP);
      return;
    }
    _searchState(ViewState.busy);
    final result =
        await getRemoteSearchItems.call(Tuple2(currentPageSearch, string));
    _handleFetchSearchResult(result);
  }

  void _handleFetchSearchResult(Either<Failure, List<ResultItems>> result) {
    result.fold((feilure) {
      _searchState(ViewState.error);
      Get.snackbar('Refresh failed!', "Can't load search items",
          snackPosition: SnackPosition.TOP);
    }, (data) async {
      searchResult.value = data;
      _handleItemsSearchResult();
      _searchState(ViewState.data);
    });
  }

  Future _handleItemsSearchResult() async {
    List<String> tempList = [];
    List<String> contList = [];
    for (var i = 0; i < searchResults.length; i++) {
      tempList.add(searchResults[i].id!.toString());
    }
    for (var i = 0; i < localitem.length; i++) {
      contList.add(localitem[i].id!.toString());
    }

    for (var el in tempList) {
      bool isContains = contList.any((e) => el.contains(e));

      if (!isContains) {
        final result =
            searchResult[searchResult.indexWhere((e) => e.id == int.parse(el))];
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
        searchResult[searchResult.indexWhere((e) => e.id == int.parse(el))] =
            res;
      } else {
        final result =
            searchResult[searchResult.indexWhere((e) => e.id == int.parse(el))];
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
        searchResult[searchResult.indexWhere((e) => e.id == int.parse(el))] =
            res;
      }
    }
  }

  Future<void> clearSearchData() async {
    _searchState(ViewState.busy);
    await clearLocalSearch.call(NoParams());
    search.clear();
    _searchState(ViewState.data);
  }

  Future<void> deleteSearchData({int? id}) async {
    await deleteLocalSearch.call(id!);
    search.removeWhere((e) => e.id == id);
  }

  void _setState(ViewState state) {
    viewState.value = state;
  }

  void _searchState(ViewState state) {
    searchState.value = state;
  }
}
