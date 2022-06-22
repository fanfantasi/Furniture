import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/core/errors/failure.dart';
import 'package:home_decor/app/core/usecases/usecase.dart';
import 'package:home_decor/app/data/datasources/local/favorite_local_datasource.dart';
import 'package:home_decor/app/domain/entities/items.dart';
import 'package:home_decor/app/domain/usecases/favorite/get_local_favorite.dart';
import 'package:home_decor/injector.dart';
import 'package:home_decor/main.dart';

class FavoriteController extends GetxController {
  final getLocalFavorite = Injector.resolve<GetLocalFavorite>();

  final viewState = ViewState.initial.obs;
  RxList<ResultItems> item = <ResultItems>[].obs;
  List<ResultItems> get items => List.from(item);

  RxBool gridOrList = true.obs;
  RxInt countItem = 0.obs;
  @override
  void onInit() async {
    await Injector.resolve<FavoriteDataSource>().initDb();
    await localFetch();
    debounce(countItem, (_) async {
      await localFetch();
    });
    super.onInit();
  }

  @override
  void onClose() {
    gridOrList.value = true;
    super.onClose();
  }

  // feth data from local database
  Future<void> localFetch() async {
    if (viewState.value == ViewState.busy) return;
    _setState(ViewState.busy);
    final result = await getLocalFavorite.call(NoParams());
    _handleFetchResult(result, true);
  }

  // handle api fetch result
  void _handleFetchResult(Either<Failure, List<ResultItems>> result,
      [bool local = false]) {
    result.fold((feilure) {
      item.clear();
      _setState(ViewState.error);
    }, (data) {
      item.value = data;
      _setState(ViewState.data);
    });
  }

  void _setState(ViewState state) {
    viewState.value = state;
  }
}
