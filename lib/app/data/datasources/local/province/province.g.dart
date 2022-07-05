// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'province.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProvinceAdapter extends TypeAdapter<ProvinceHive> {
  @override
  final int typeId = 6;

  @override
  ProvinceHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProvinceHive(
      id: fields[0] as int?,
      prov: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProvinceHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.prov);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProvinceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
