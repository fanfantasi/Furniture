// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressAdapter extends TypeAdapter<AddressHive> {
  @override
  final int typeId = 5;

  @override
  AddressHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressHive(
      id: fields[0] as int?,
      name: fields[1] as String?,
      phone: fields[2] as String?,
      province: fields[3] as String?,
      districts: fields[4] as String?,
      subdistricts: fields[5] as String?,
      village: fields[6] as String?,
      zipcode: fields[7] as String?,
      address: fields[8] as String?,
      other: fields[9] as String?,
      option: fields[10] as int?,
      status: fields[11] as int?,
      createdAt: fields[12] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, AddressHive obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.province)
      ..writeByte(4)
      ..write(obj.districts)
      ..writeByte(5)
      ..write(obj.subdistricts)
      ..writeByte(6)
      ..write(obj.village)
      ..writeByte(7)
      ..write(obj.zipcode)
      ..writeByte(8)
      ..write(obj.address)
      ..writeByte(9)
      ..write(obj.other)
      ..writeByte(10)
      ..write(obj.option)
      ..writeByte(11)
      ..write(obj.status)
      ..writeByte(12)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
