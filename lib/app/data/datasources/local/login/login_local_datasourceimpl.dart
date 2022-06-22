import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:home_decor/app/data/model/login_user.dart';
import 'package:path_provider/path_provider.dart';

import '../login_local_datasource.dart';
import 'login.dart';

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final kLoginBoxName = 'login_box';

  @override
  Future<bool> deleteDb() async {
    try {
      final userBox = Hive.box<LoginHive>(kLoginBoxName);
      await userBox.clear();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<List<LoginuserModel>> getUser() async {
    final loginBox = Hive.box<LoginHive>(kLoginBoxName);
    return loginBox.values.map<LoginuserModel>((e) {
      return LoginuserModel(
          uid: e.uid!,
          token: e.token!,
          pin: e.pin!,
          displayname: e.displayname!,
          email: e.email!,
          telp: e.telp!,
          active: e.active!,
          level: e.level!,
          avatar: e.avatar!);
    }).toList();
  }

  @override
  Future<bool> initDb() async {
    try {
      if (!foundation.kIsWeb) {
        final appDocumentDir = await getApplicationDocumentsDirectory();
        Hive.init(appDocumentDir.path);
      }

      if (!Hive.isAdapterRegistered(0)) {
        Hive.registerAdapter(LoginAdapter());
      }

      if (!Hive.isBoxOpen(kLoginBoxName)) {
        await Hive.openBox<LoginHive>(kLoginBoxName);
      }

      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<bool> insertUser(List<LoginuserModel> user) async {
    try {
      final userBox = Hive.box<LoginHive>(kLoginBoxName);
      await userBox.clear();
      final converted = user
          .map((e) => LoginHive(
                uid: e.uid,
                pin: e.pin,
                token: e.token,
                displayname: e.displayname,
                email: e.email,
                telp: e.telp,
                active: e.active,
                level: e.level,
                avatar: e.avatar,
              ))
          .toList();
      await userBox.addAll(converted);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<bool> updateUser(
      {String? uid,
      String? pin,
      String? displayname,
      String? telp,
      String? path}) async {
    try {
      final userBox = Hive.box<LoginHive>(kLoginBoxName);
      final user = userBox.values.last;
      final _usersData = LoginHive(
        uid: uid,
        pin: pin,
        token: user.token,
        displayname: displayname,
        email: user.email,
        telp: telp,
        active: user.active,
        level: user.level,
        avatar: path,
      );
      await userBox.putAt(0, _usersData);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
