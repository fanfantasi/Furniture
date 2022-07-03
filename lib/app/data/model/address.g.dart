// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map json) => AddressModel(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      province: json['province'] as String,
      districts: json['districts'] as String,
      subdistricts: json['subdistricts'] as String,
      village: json['village'] as String,
      zipcode: json['zipcode'] as String,
      address: json['address'] as String,
      other: json['other'] as String,
      option: json['option'] as int,
      status: json['status'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'province': instance.province,
      'districts': instance.districts,
      'subdistricts': instance.subdistricts,
      'village': instance.village,
      'zipcode': instance.zipcode,
      'address': instance.address,
      'other': instance.other,
      'option': instance.option,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
    };
