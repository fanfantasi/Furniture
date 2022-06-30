// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void configureCore() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => Connectivity())
      ..registerSingleton<NetworkInfoI>(
          (c) => NetworkInfo(connectivity: c<Connectivity>()));
  }

  @override
  void configureLoginFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<LoginLocalDataSource>((c) => LoginLocalDataSourceImpl())
      ..registerFactory((c) => GetLocalLogin(c<LoginRepository>()))
      ..registerFactory<LoginRepository>((c) =>
          LoginRepositoryImpl(localDatasource: c<LoginLocalDataSource>()));
  }

  @override
  void configureCategoryFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory(
          (c) => CategoryRemoteDatasource(client: c<RestClient>()))
      ..registerFactory((c) => GetRemoteCategory(c<CategoryRepository>()))
      ..registerFactory<CategoryRepository>((c) => CategoryRepositoryImpl(
          remoteDataSource: c<CategoryRemoteDatasource>()));
  }

  @override
  void configurePromoFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => PromoRemoteDatasource(client: c<RestClient>()))
      ..registerFactory((c) => GetRemotePromo(c<PromoRepository>()))
      ..registerFactory<PromoRepository>((c) =>
          PromoRepositoryImpl(remoteDataSource: c<PromoRemoteDatasource>()));
  }

  @override
  void configureItemsFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => ItemsRemoteDatasource(client: c<RestClient>()))
      ..registerFactory((c) => GetRemoteItems(c<ItemsRepository>()))
      ..registerFactory((c) => GetRemoteItemsByCategory(c<ItemsRepository>()))
      ..registerFactory((c) => GetRemoteSearchItems(c<ItemsRepository>()))
      ..registerFactory((c) => GetRemoteRecommendation(c<ItemsRepository>()))
      ..registerFactory((c) => GetRemoteImagesItem(c<ItemsRepository>()))
      ..registerFactory((c) => GetRemoteItemsRelated(c<ItemsRepository>()))
      ..registerFactory((c) => GetRemoteItemByid(c<ItemsRepository>()))
      ..registerFactory((c) => GetRemoteRatings(c<ItemsRepository>()))
      ..registerFactory<ItemsRepository>((c) =>
          ItemsRepositoryImpl(remoteDataSource: c<ItemsRemoteDatasource>()))
      ..registerFactory<FavoriteDataSource>((c) => FavoriteDatasourceHiveImpl())
      ..registerFactory<FavoriteRepository>((c) =>
          FavoriteRepositoryImpl(localDataSource: c<FavoriteDataSource>()))
      ..registerFactory((c) => GetSingleLocalFavorite(c<FavoriteRepository>()))
      ..registerFactory((c) => GetLocalFavorite(c<FavoriteRepository>()))
      ..registerFactory((c) => DeleteLocalFavorite(c<FavoriteRepository>()))
      ..registerFactory((c) => PostLocalFavorite(c<FavoriteRepository>()));
  }

  @override
  void configureSearchFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<SearchDataSource>((c) => SearchDatasourceHiveImpl())
      ..registerFactory<SearchRepository>(
          (c) => SearchRepositoryImpl(localDataSource: c<SearchDataSource>()))
      ..registerFactory((c) => GetLocalSearch(c<SearchRepository>()))
      ..registerFactory((c) => GetSingleLocalSearch(c<SearchRepository>()))
      ..registerFactory((c) => DeleteLocalSearch(c<SearchRepository>()))
      ..registerFactory((c) => ClearLocalSearch(c<SearchRepository>()))
      ..registerFactory((c) => PostLocalSearch(c<SearchRepository>()));
  }
}
