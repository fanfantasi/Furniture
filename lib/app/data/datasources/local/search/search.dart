import 'package:hive/hive.dart';

part 'search.g.dart';

@HiveType(adapterName: 'SearchAdapter', typeId: 0)
class SearchHive {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? keyword;

  @HiveField(2)
  DateTime? createdAt;

  SearchHive({this.id, this.keyword, this.createdAt});
}
