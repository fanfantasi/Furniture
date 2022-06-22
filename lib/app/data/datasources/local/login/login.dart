import 'package:hive/hive.dart';

part 'login.g.dart';

@HiveType(adapterName: 'LoginAdapter', typeId: 0)
class LoginHive {
  @HiveField(0)
  String? uid;

  @HiveField(1)
  String? token;

  @HiveField(2)
  String? pin;

  @HiveField(3)
  String? displayname;

  @HiveField(4)
  String? email;

  @HiveField(5)
  String? telp;

  @HiveField(6)
  int? active;

  @HiveField(7)
  int? level;

  @HiveField(8)
  String? avatar;

  LoginHive(
      {this.uid,
      this.pin,
      this.token,
      this.displayname,
      this.email,
      this.telp,
      this.avatar,
      this.level,
      this.active});
}
