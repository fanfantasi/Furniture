// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteAdapter extends TypeAdapter<FavoriteHive> {
  @override
  final int typeId = 7;

  @override
  FavoriteHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteHive(
      id: fields[0] as int?,
      title: fields[1] as String?,
      subtitle: fields[2] as String?,
      desc: fields[3] as String?,
      link: fields[4] as String?,
      status: fields[6] as int?,
      active: fields[7] as int?,
      image: fields[8] as String?,
      view: fields[9] as int?,
      rating: fields[10] as String?,
      recommend: fields[11] as String?,
      point: fields[12] as int?,
      price: fields[13] as int?,
      favorite: fields[14] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteHive obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.subtitle)
      ..writeByte(3)
      ..write(obj.desc)
      ..writeByte(4)
      ..write(obj.link)
      ..writeByte(6)
      ..write(obj.status)
      ..writeByte(7)
      ..write(obj.active)
      ..writeByte(8)
      ..write(obj.image)
      ..writeByte(9)
      ..write(obj.view)
      ..writeByte(10)
      ..write(obj.rating)
      ..writeByte(11)
      ..write(obj.recommend)
      ..writeByte(12)
      ..write(obj.point)
      ..writeByte(13)
      ..write(obj.price)
      ..writeByte(14)
      ..write(obj.favorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
