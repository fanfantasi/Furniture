import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:home_decor/app/data/datasources/local/favorite/favorite_local_datasourceimpl.dart';
import 'package:home_decor/app/data/datasources/local/favorite_local_datasource.dart';
import 'package:home_decor/app/data/datasources/local/search/search_local_datasourceimpl.dart';
import 'package:home_decor/app/data/datasources/local/search_local_datasource.dart';
import 'package:home_decor/app/data/datasources/remote/index.dart';
import 'package:home_decor/app/data/repositories/category_repository_impl.dart';
import 'package:home_decor/app/data/repositories/favorite_repository_impl.dart';
import 'package:home_decor/app/data/repositories/items_repository_impl.dart';
import 'package:home_decor/app/data/repositories/promo_repository_impl.dart';
import 'package:home_decor/app/data/repositories/search_repository_impl.dart';
import 'package:home_decor/app/domain/repositories/category_repository.dart';
import 'package:home_decor/app/domain/repositories/favorite_repository.dart';
import 'package:home_decor/app/domain/repositories/items_repository.dart';
import 'package:home_decor/app/domain/repositories/promo_repository.dart';
import 'package:home_decor/app/domain/repositories/search_repository.dart';
import 'package:home_decor/app/domain/usecases/category/get_remote_category.dart';
import 'package:home_decor/app/domain/usecases/favorite/delete_local_favorite.dart';
import 'package:home_decor/app/domain/usecases/favorite/get_local_favorite.dart';
import 'package:home_decor/app/domain/usecases/favorite/getsingle_local_favorite.dart';
import 'package:home_decor/app/domain/usecases/favorite/post_local_favorite.dart';
import 'package:home_decor/app/domain/usecases/items/get_remote_items.dart';
import 'package:home_decor/app/domain/usecases/items/get_remote_itemsbycategory.dart';
import 'package:home_decor/app/domain/usecases/items/get_remote_recommendation.dart';
import 'package:home_decor/app/domain/usecases/items/get_remote_search.dart';
import 'package:home_decor/app/domain/usecases/promo/get_remote_promo.dart';
import 'package:home_decor/app/domain/usecases/search/clear_local_search.dart';
import 'package:home_decor/app/domain/usecases/search/delete_local_search.dart';
import 'package:home_decor/app/domain/usecases/search/get_local_search.dart';
import 'package:home_decor/app/domain/usecases/search/get_local_single_search.dart';
import 'package:home_decor/app/domain/usecases/search/post_local_search.dart';
import 'package:kiwi/kiwi.dart';

import 'app/core/network/network_info.dart';
import 'app/data/api/api.dart';
import 'app/data/datasources/local/login/login_local_datasourceimpl.dart';
import 'app/data/datasources/local/login_local_datasource.dart';
import 'app/data/repositories/login_repository_impl.dart';
import 'app/domain/repositories/login_repository.dart';
import 'app/domain/usecases/login/get_local_login.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container = KiwiContainer();

  static final resolve = container.resolve;

  static void setup() {
    container = KiwiContainer();
    _$Injector().configure();
  }

  void configure() {
    configureCore();
    configureFeatureModule();
  }

  // Core module
  @Register.singleton(Connectivity)
  @Register.singleton(NetworkInfoI, from: NetworkInfo)
  void configureCore();

  //Feature module
  void configureFeatureModule() {
    configureLoginFeatureModuleFactories();
    configureFeatureModuleInstances();
    configureCategoryFeatureModuleFactories();
    configurePromoFeatureModuleFactories();
    configureItemsFeatureModuleFactories();
    configureSearchFeatureModuleFactories();
  }

  // Feature module instances
  void configureFeatureModuleInstances() {
    container.registerInstance(
        RestClient(Dio(BaseOptions(contentType: "application/json"))));
  }

  // Login Feature module factories
  @Register.factory(LoginLocalDataSource, from: LoginLocalDataSourceImpl)
  @Register.factory(GetLocalLogin)
  @Register.factory(LoginRepository, from: LoginRepositoryImpl)
  void configureLoginFeatureModuleFactories();

  //Category
  @Register.factory(CategoryRemoteDatasource)
  @Register.factory(GetRemoteCategory)
  @Register.factory(CategoryRepository, from: CategoryRepositoryImpl)
  void configureCategoryFeatureModuleFactories();

  //Category
  @Register.factory(PromoRemoteDatasource)
  @Register.factory(GetRemotePromo)
  @Register.factory(PromoRepository, from: PromoRepositoryImpl)
  void configurePromoFeatureModuleFactories();

  //Items
  @Register.factory(ItemsRemoteDatasource)
  @Register.factory(GetRemoteItems)
  @Register.factory(GetRemoteItemsByCategory)
  @Register.factory(GetRemoteSearchItems)
  @Register.factory(GetRemoteRecommendation)
  @Register.factory(ItemsRepository, from: ItemsRepositoryImpl)
  @Register.factory(FavoriteDataSource, from: FavoriteDatasourceHiveImpl)
  @Register.factory(FavoriteRepository, from: FavoriteRepositoryImpl)
  @Register.factory(GetSingleLocalFavorite)
  @Register.factory(GetLocalFavorite)
  @Register.factory(DeleteLocalFavorite)
  @Register.factory(PostLocalFavorite)
  void configureItemsFeatureModuleFactories();

  //Search
  @Register.factory(SearchDataSource, from: SearchDatasourceHiveImpl)
  @Register.factory(SearchRepository, from: SearchRepositoryImpl)
  @Register.factory(GetLocalSearch)
  @Register.factory(GetSingleLocalSearch)
  @Register.factory(DeleteLocalSearch)
  @Register.factory(ClearLocalSearch)
  @Register.factory(PostLocalSearch)
  void configureSearchFeatureModuleFactories();
}