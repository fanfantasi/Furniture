import 'package:hive/hive.dart';
import 'package:home_decor/app/data/datasources/local/province/province.dart';
import 'package:home_decor/app/data/datasources/local/province_local_datasource.dart';
import 'package:home_decor/app/data/model/province.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:path_provider/path_provider.dart';

class ProvinceDatasourceHiveImpl implements ProvinceDataSource {
  final _kProvinceBoxName = 'province_box';

  @override
  Future<bool> deleteAllProvince() async {
    try {
      final provinceBox = Hive.box<ProvinceHive>(_kProvinceBoxName);
      await provinceBox.clear();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<List<ResultProvinceModel>> getProvince() async {
    final provinceBox = Hive.box<ProvinceHive>(_kProvinceBoxName);
    return provinceBox.values.map<ResultProvinceModel>((e) {
      return ResultProvinceModel(id: e.id, prov: e.prov!);
    }).toList();
  }

  @override
  Future<List<ResultProvinceModel>> getSearchProvince({String? keyword}) async {
    final provinceBox = Hive.box<ProvinceHive>(_kProvinceBoxName);
    return provinceBox.values
        .map<ResultProvinceModel>((e) {
          return ResultProvinceModel(id: e.id, prov: e.prov);
        })
        .toList()
        .where((element) =>
            element.prov!.toLowerCase().contains(keyword!.toLowerCase()))
        .toList();
  }

  @override
  Future<bool> initDb() async {
    try {
      if (!foundation.kIsWeb) {
        final appDocumentDir = await getApplicationDocumentsDirectory();
        Hive.init(appDocumentDir.path);
      }
      if (!Hive.isAdapterRegistered(6)) {
        Hive.registerAdapter(ProvinceAdapter());
      }
      if (!Hive.isBoxOpen(_kProvinceBoxName)) {
        await Hive.openBox<ProvinceHive>(_kProvinceBoxName);
      }

      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<bool> insertProvince(List<ResultProvinceModel> provinceModel) async {
    try {
      final provinceBox = Hive.box<ProvinceHive>(_kProvinceBoxName);
      provinceBox.clear();
      final converted = provinceModel
          .map((e) => ProvinceHive(id: e.id, prov: e.prov))
          .toList();
      await provinceBox.addAll(converted);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<ResultProvinceModel> getSingleProvince({int? id}) async {
    final provinceBox = Hive.box<ProvinceHive>(_kProvinceBoxName);
    return provinceBox.values
        .map<ResultProvinceModel>((e) {
          return ResultProvinceModel(id: e.id, prov: e.prov);
        })
        .toList()
        .firstWhere((element) => element.id == id);
  }
}
