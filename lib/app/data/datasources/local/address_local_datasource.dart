import 'package:home_decor/app/data/model/address.dart';

abstract class AddressDataSource {
  Future<bool> initDb();
  Future<bool> insertAddress(AddressModel item);
  Future<bool> deleteAllAddress();
  Future<bool> deleteAddress({int? id});
  Future<List<AddressModel>> getAddress();
  Future<AddressModel> getSingleAddress({int? id});
  Future<AddressModel> getSingleAddressUtama();
  Future<AddressModel> updateAddress({int? id, AddressModel? address});
}
