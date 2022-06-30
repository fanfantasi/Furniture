// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartAdapter extends TypeAdapter<CartHive> {
  @override
  final int typeId = 3;

  @override
  CartHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartHive(
      id: fields[0] as int?,
      title: fields[1] as String?,
      subtitle: fields[2] as String?,
      desc: fields[3] as String?,
      image: fields[4] as String?,
      price: fields[5] as int?,
      point: fields[6] as int?,
      qty: fields[7] as int?,
      createdAt: fields[8] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, CartHive obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.subtitle)
      ..writeByte(3)
      ..write(obj.desc)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.point)
      ..writeByte(7)
      ..write(obj.qty)
      ..writeByte(8)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
