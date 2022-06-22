import 'package:home_decor/app/data/model/search.dart';

abstract class SearchDataSource {
  Future<bool> initDb();
  Future<bool> insertSearch(SearchModel search);
  Future<bool> deleteAllSearch();
  Future<bool> deleteSearch({int? id});
  Future<List<SearchModel>> getSearch();
  Future<SearchModel> getSingleSearch({String? keyword});
}
