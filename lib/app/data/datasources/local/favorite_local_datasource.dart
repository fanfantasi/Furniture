import 'package:home_decor/app/data/model/items.dart';

abstract class FavoriteDataSource {
  Future<bool> initDb();
  Future<bool> insertFavorite(ResultItemsModel item);
  Future<bool> deleteAllFavorite();
  Future<bool> deleteFavorite({int? id});
  Future<List<ResultItemsModel>> getFavorite();
  Future<ResultItemsModel> getSingleFavorite({int? id});
}
