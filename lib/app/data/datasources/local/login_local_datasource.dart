import 'package:home_decor/app/data/model/login_user.dart';

abstract class LoginLocalDataSource {
  Future<bool> initDb();
  Future<bool> deleteDb();
  Future<bool> insertUser(List<LoginuserModel> user);
  Future<bool> updateUser(
      {String? uid,
      String? pin,
      String? displayname,
      String? telp,
      String? path});
  Future<List<LoginuserModel>> getUser();
}
