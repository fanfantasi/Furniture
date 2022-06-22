// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginAdapter extends TypeAdapter<LoginHive> {
  @override
  final int typeId = 0;

  @override
  LoginHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginHive(
      uid: fields[0] as String?,
      pin: fields[2] as String?,
      token: fields[1] as String?,
      displayname: fields[3] as String?,
      email: fields[4] as String?,
      telp: fields[5] as String?,
      avatar: fields[8] as String?,
      level: fields[7] as int?,
      active: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, LoginHive obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.pin)
      ..writeByte(3)
      ..write(obj.displayname)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.telp)
      ..writeByte(6)
      ..write(obj.active)
      ..writeByte(7)
      ..write(obj.level)
      ..writeByte(8)
      ..write(obj.avatar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
