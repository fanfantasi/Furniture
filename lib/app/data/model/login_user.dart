import 'package:home_decor/app/domain/entities/login_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_user.g.dart';

@JsonSerializable()
class LoginuserModel extends Userlogin {
  const LoginuserModel(
      {required String uid,
      required String token,
      required String pin,
      required String displayname,
      required String email,
      required String telp,
      required int active,
      required int level,
      required String avatar})
      : super(
            uid: uid,
            token: token,
            pin: pin,
            displayname: displayname,
            email: email,
            telp: telp,
            active: active,
            level: level,
            avatar: avatar);

  factory LoginuserModel.fromJson(Map<String, dynamic> json) =>
      _$LoginuserModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginuserModelToJson(this);
}
