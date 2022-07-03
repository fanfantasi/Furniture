import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final int id;
  final String name;
  final String phone;
  final String province;
  final String districts;
  final String subdistricts;
  final String village;
  final String zipcode;
  final String address;
  final String other;
  final int option;
  final int status;
  final DateTime createdAt;
  const Address(
      {required this.id,
      required this.name,
      required this.phone,
      required this.province,
      required this.districts,
      required this.subdistricts,
      required this.village,
      required this.zipcode,
      required this.address,
      required this.other,
      required this.option,
      required this.status,
      required this.createdAt});

  @override
  List<Object> get props => [
        id,
        name,
        phone,
        province,
        districts,
        subdistricts,
        village,
        zipcode,
        address,
        other,
        option,
        status,
        createdAt
      ];
}
