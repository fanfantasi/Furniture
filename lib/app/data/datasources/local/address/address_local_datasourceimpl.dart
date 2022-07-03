import 'package:home_decor/app/data/datasources/local/address/address.dart';
import 'package:home_decor/app/data/datasources/local/address_local_datasource.dart';
import 'package:home_decor/app/data/model/address.dart';
import 'dart:async';
import 'package:flutter/foundation.dart' as foundation;
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class AddressDatasourceHiveImpl implements AddressDataSource {
  final _kAddressBoxName = 'address_box';

  @override
  Future<bool> deleteAddress({int? id}) async {
    try {
      final addressBox = Hive.box<AddressHive>(_kAddressBoxName);
      int index =
          addressBox.values.toList().indexWhere((element) => element.id == id);
      if (index != -1) {
        await addressBox.deleteAt(index);
      }
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<bool> deleteAllAddress() async {
    try {
      final addressBox = Hive.box<AddressHive>(_kAddressBoxName);
      await addressBox.clear();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<List<AddressModel>> getAddress() async {
    final cartBox = Hive.box<AddressHive>(_kAddressBoxName);
    return cartBox.values.map<AddressModel>((e) {
      return AddressModel(
          id: e.id!,
          name: e.name!,
          phone: e.phone!,
          province: e.province!,
          districts: e.districts!,
          subdistricts: e.subdistricts!,
          village: e.village!,
          zipcode: e.zipcode!,
          address: e.address!,
          other: e.other!,
          option: e.option!,
          status: e.status!,
          createdAt: e.createdAt!);
    }).toList();
  }

  @override
  Future<AddressModel> getSingleAddress({int? id}) async {
    final cartBox = Hive.box<AddressHive>(_kAddressBoxName);
    return cartBox.values
        .map<AddressModel>((e) {
          return AddressModel(
              id: e.id!,
              name: e.name!,
              phone: e.phone!,
              province: e.province!,
              districts: e.districts!,
              subdistricts: e.subdistricts!,
              village: e.village!,
              zipcode: e.zipcode!,
              address: e.address!,
              other: e.other!,
              option: e.option!,
              status: e.status!,
              createdAt: e.createdAt!);
        })
        .toList()
        .firstWhere((element) => element.id == id!);
  }

  @override
  Future<bool> initDb() async {
    try {
      if (!foundation.kIsWeb) {
        final appDocumentDir = await getApplicationDocumentsDirectory();
        Hive.init(appDocumentDir.path);
      }
      if (!Hive.isAdapterRegistered(5)) {
        Hive.registerAdapter(AddressAdapter());
      }
      if (!Hive.isBoxOpen(_kAddressBoxName)) {
        await Hive.openBox<AddressHive>(_kAddressBoxName);
      }

      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<bool> insertAddress(AddressModel address) async {
    try {
      final addressBox = Hive.box<AddressHive>(_kAddressBoxName);
      final converted = AddressHive(
          id: address.id,
          name: address.name,
          phone: address.phone,
          province: address.province,
          districts: address.districts,
          subdistricts: address.subdistricts,
          village: address.village,
          zipcode: address.zipcode,
          address: address.address,
          other: address.other,
          option: address.option,
          status: address.status,
          createdAt: address.createdAt);
      await addressBox.add(converted);

      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<AddressModel> updateAddress({int? id, AddressModel? address}) async {
    final addressBox = Hive.box<AddressHive>(_kAddressBoxName);
    int i =
        addressBox.values.toList().indexWhere((element) => element.id == id);
    if (i != -1) {
      AddressHive converted = addressBox.values
          .map<AddressHive>((e) {
            return AddressHive(
                id: e.id!,
                name: address!.name,
                phone: address.phone,
                province: address.province,
                districts: address.districts,
                subdistricts: address.subdistricts,
                village: address.village,
                zipcode: address.zipcode,
                address: address.address,
                other: address.other,
                option: address.option,
                status: address.status,
                createdAt: e.createdAt);
          })
          .toList()
          .firstWhere((element) => element.id == id!);
      await addressBox.putAt(i, converted);
    }

    return addressBox.values
        .map<AddressModel>((e) {
          return AddressModel(
              id: e.id!,
              name: e.name!,
              phone: e.phone!,
              province: e.province!,
              districts: e.districts!,
              subdistricts: e.subdistricts!,
              village: e.village!,
              zipcode: e.zipcode!,
              address: e.address!,
              other: e.other!,
              option: e.option!,
              status: e.status!,
              createdAt: e.createdAt!);
        })
        .toList()
        .firstWhere((element) => element.id == id!);
  }

  @override
  Future<AddressModel> getSingleAddressUtama() async {
    final addressBox = Hive.box<AddressHive>(_kAddressBoxName);
    return addressBox.values
        .map<AddressModel>((e) {
          return AddressModel(
              id: e.id!,
              name: e.name!,
              phone: e.phone!,
              province: e.province!,
              districts: e.districts!,
              subdistricts: e.subdistricts!,
              village: e.village!,
              zipcode: e.zipcode!,
              address: e.address!,
              other: e.other!,
              option: e.option!,
              status: e.status!,
              createdAt: e.createdAt!);
        })
        .toList()
        .firstWhere((element) => element.status == 1);
  }
}
