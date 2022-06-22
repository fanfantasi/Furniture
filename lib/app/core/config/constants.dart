import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Constants {
  final _getStorage = GetStorage();
  String get token => _getStorage.read('token');
  String get uid => _getStorage.read('uid');

  static const appName = 'Furniture';
  static Color appThemeColor = const Color(0xFF004e89);
  static const supportEmail = 'fan.fantasi@gmail.com';
  static const baseurl = 'http://192.168.1.10:8081/apis/';

  static String tokenKey = "authorization";
}
