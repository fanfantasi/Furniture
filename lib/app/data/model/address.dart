import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/address.dart';

part 'address.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class AddressModel extends Address {
  const AddressModel(
      {required int id,
      required String name,
      required String phone,
      required String province,
      required String districts,
      required String subdistricts,
      required String village,
      required String zipcode,
      required String address,
      required String other,
      required int option,
      required int status,
      required DateTime createdAt})
      : super(
            id: id,
            name: name,
            phone: phone,
            province: province,
            districts: districts,
            subdistricts: subdistricts,
            village: village,
            zipcode: zipcode,
            address: address,
            other: other,
            option: option,
            status: status,
            createdAt: createdAt);

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
