import 'package:hive/hive.dart';
import 'package:home_decor/app/data/datasources/local/search/search.dart';
import 'package:home_decor/app/data/datasources/local/search_local_datasource.dart';
import 'package:home_decor/app/data/model/search.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:path_provider/path_provider.dart';

class SearchDatasourceHiveImpl implements SearchDataSource {
  final _kSearchBoxName = 'search_box';

  @override
  Future<bool> deleteAllSearch() async {
    try {
      final searchBox = Hive.box<SearchHive>(_kSearchBoxName);
      await searchBox.clear();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<bool> deleteSearch({int? id}) async {
    try {
      final searchBox = Hive.box<SearchHive>(_kSearchBoxName);
      int index =
          searchBox.values.toList().indexWhere((element) => element.id == id);
      if (index != -1) {
        await searchBox.deleteAt(index);
      }
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<List<SearchModel>> getSearch() async {
    final searchBox = Hive.box<SearchHive>(_kSearchBoxName);
    return searchBox.values.map<SearchModel>((e) {
      return SearchModel(
          id: e.id!, keyword: e.keyword!, createdAt: e.createdAt!);
    }).toList();
  }

  @override
  Future<bool> initDb() async {
    try {
      if (!foundation.kIsWeb) {
        final appDocumentDir = await getApplicationDocumentsDirectory();
        Hive.init(appDocumentDir.path);
      }
      if (!Hive.isAdapterRegistered(2)) {
        Hive.registerAdapter(SearchAdapter());
      }
      if (!Hive.isBoxOpen(_kSearchBoxName)) {
        await Hive.openBox<SearchHive>(_kSearchBoxName);
      }

      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<bool> insertSearch(SearchModel search) async {
    try {
      final searchBox = Hive.box<SearchHive>(_kSearchBoxName);
      final converted = SearchHive(
          id: search.id, keyword: search.keyword, createdAt: search.createdAt);
      await searchBox.add(converted);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<SearchModel> getSingleSearch({String? keyword}) async {
    final itemBox = Hive.box<SearchHive>(_kSearchBoxName);
    return itemBox.values
        .map<SearchModel>((e) {
          return SearchModel(
              id: e.id!, keyword: e.keyword!, createdAt: e.createdAt!);
        })
        .toList()
        .firstWhere((element) =>
            element.keyword.toLowerCase() == keyword!.toLowerCase());
  }
}
