import 'package:home_decor/app/data/model/items.dart';
import 'dart:async';
import 'package:flutter/foundation.dart' as foundation;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../favorite_local_datasource.dart';
import 'favorite.dart';

class FavoriteDatasourceHiveImpl implements FavoriteDataSource {
  final _kFavoriteBoxName = 'favorite_box';

  @override
  Future<bool> deleteAllFavorite() {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteFavorite({int? id}) async {
    try {
      final itemBox = Hive.box<FavoriteHive>(_kFavoriteBoxName);
      int index =
          itemBox.values.toList().indexWhere((element) => element.id == id);
      if (index != -1) {
        await itemBox.deleteAt(index);
      }
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<List<ResultItemsModel>> getFavorite() async {
    final itemsBox = Hive.box<FavoriteHive>(_kFavoriteBoxName);
    return itemsBox.values.map<ResultItemsModel>((e) {
      return ResultItemsModel(
          id: e.id,
          title: e.title,
          subtitle: e.subtitle,
          desc: e.desc,
          link: e.link,
          status: e.status,
          active: e.active,
          image: e.image,
          view: e.view,
          ratings: e.rating,
          recommend: e.recommend,
          point: e.point,
          price: e.price,
          favorite: true);
    }).toList();
  }

  @override
  Future<bool> initDb() async {
    try {
      if (!foundation.kIsWeb) {
        final appDocumentDir = await getApplicationDocumentsDirectory();
        Hive.init(appDocumentDir.path);
      }
      if (!Hive.isAdapterRegistered(7)) {
        Hive.registerAdapter(FavoriteAdapter());
      }
      if (!Hive.isBoxOpen(_kFavoriteBoxName)) {
        await Hive.openBox<FavoriteHive>(_kFavoriteBoxName);
      }

      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<bool> insertFavorite(ResultItemsModel item) async {
    try {
      final itemsBox = Hive.box<FavoriteHive>(_kFavoriteBoxName);
      final converted = FavoriteHive(
          id: item.id,
          title: item.title,
          subtitle: item.subtitle,
          desc: item.desc,
          link: item.link,
          status: item.status,
          active: item.active,
          view: item.view,
          image: item.image,
          rating: item.ratings,
          recommend: item.recommend,
          point: item.point,
          price: item.price,
          favorite: item.favorite);
      await itemsBox.add(converted);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<ResultItemsModel> getSingleFavorite({int? id}) async {
    final itemBox = Hive.box<FavoriteHive>(_kFavoriteBoxName);
    return itemBox.values
        .map<ResultItemsModel>((e) {
          return ResultItemsModel(
              id: e.id,
              title: e.title,
              subtitle: e.subtitle,
              desc: e.desc,
              link: e.link,
              status: e.status,
              active: e.active,
              image: e.image,
              view: e.view,
              ratings: e.rating,
              recommend: e.recommend,
              point: e.point,
              price: e.price,
              favorite: e.favorite!);
        })
        .toList()
        .firstWhere((element) => element.id == id);
  }
}
