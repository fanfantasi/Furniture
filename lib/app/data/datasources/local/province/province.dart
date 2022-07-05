import 'package:hive/hive.dart';

part 'province.g.dart';

@HiveType(adapterName: 'ProvinceAdapter', typeId: 6)
class ProvinceHive {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? prov;

  ProvinceHive({this.id, this.prov});
}
