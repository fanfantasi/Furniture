// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginuserModel _$LoginuserModelFromJson(Map<String, dynamic> json) =>
    LoginuserModel(
      uid: json['uid'] as String,
      token: json['token'] as String,
      pin: json['pin'] as String,
      displayname: json['displayname'] as String,
      email: json['email'] as String,
      telp: json['telp'] as String,
      active: json['active'] as int,
      level: json['level'] as int,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$LoginuserModelToJson(LoginuserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'token': instance.token,
      'pin': instance.pin,
      'displayname': instance.displayname,
      'email': instance.email,
      'telp': instance.telp,
      'active': instance.active,
      'level': instance.level,
      'avatar': instance.avatar,
    };
