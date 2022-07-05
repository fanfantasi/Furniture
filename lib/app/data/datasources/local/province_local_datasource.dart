import 'package:home_decor/app/data/model/province.dart';

abstract class ProvinceDataSource {
  Future<bool> initDb();
  Future<bool> insertProvince(List<ResultProvinceModel> provinceModel);
  Future<bool> deleteAllProvince();
  Future<List<ResultProvinceModel>> getProvince();
  Future<List<ResultProvinceModel>> getSearchProvince({String? keyword});
  Future<ResultProvinceModel> getSingleProvince({int? id});
}
