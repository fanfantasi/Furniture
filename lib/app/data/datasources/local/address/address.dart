import 'package:hive/hive.dart';

part 'address.g.dart';

@HiveType(adapterName: 'AddressAdapter', typeId: 5)
class SearchHive {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  String? phone;

  @HiveField(3)
  String? province;

  @HiveField(4)
  String? districts;

  @HiveField(5)
  String? subdistricts;

  @HiveField(6)
  String? village;

  @HiveField(7)
  String? zipcode;

  @HiveField(8)
  String? address;

  @HiveField(9)
  String? other;

  //Atur sebagai : 1: rumah, 2: Kantor
  @HiveField(10)
  int? option;

  //Atur Sebagai alamat utama : 1: Utama, 2: Lainnya
  @HiveField(11)
  int? status;

  @HiveField(12)
  DateTime? createdAt;

  SearchHive(
      {this.id,
      this.name,
      this.phone,
      this.province,
      this.districts,
      this.subdistricts,
      this.village,
      this.zipcode,
      this.address,
      this.other,
      this.option,
      this.status,
      this.createdAt});
}
