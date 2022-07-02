import 'package:easy_localization/easy_localization.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:home_decor/app/data/model/cart.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:path_provider/path_provider.dart';

import '../cart_local_datasoure.dart';
import 'cart.dart';

class CartDatasourceHiveImpl implements CartDataSource {
  final _kCartBoxName = 'cart_box';

  @override
  Future<bool> deleteAllCart() async {
    try {
      final cartBox = Hive.box<CartHive>(_kCartBoxName);
      await cartBox.clear();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<bool> deleteCart({int? id}) async {
    try {
      final cartBox = Hive.box<CartHive>(_kCartBoxName);
      int index =
          cartBox.values.toList().indexWhere((element) => element.id == id);
      if (index != -1) {
        await cartBox.deleteAt(index);
      }
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<List<CartModel>> getCart() async {
    final cartBox = Hive.box<CartHive>(_kCartBoxName);
    return cartBox.values.map<CartModel>((e) {
      return CartModel(
          id: e.id!,
          title: e.title!,
          subtitle: e.subtitle!,
          desc: e.desc!,
          image: e.image!,
          price: e.price!,
          point: e.point!,
          qty: e.qty!,
          isChecked: e.isChecked!,
          createdAt: e.createdAt!);
    }).toList();
  }

  @override
  Future<CartModel> getSingleCart({int? id}) async {
    final cartBox = Hive.box<CartHive>(_kCartBoxName);
    return cartBox.values
        .map<CartModel>((e) {
          return CartModel(
              id: e.id!,
              title: e.title!,
              subtitle: e.subtitle!,
              desc: e.desc!,
              image: e.image!,
              price: e.price!,
              point: e.point!,
              qty: e.qty!,
              isChecked: e.isChecked!,
              createdAt: e.createdAt!);
        })
        .toList()
        .firstWhere((element) => element.id == id!);
  }

  @override
  Future<bool> initDb() async {
    try {
      if (!foundation.kIsWeb) {
        final appDocumentDir = await getApplicationDocumentsDirectory();
        Hive.init(appDocumentDir.path);
      }
      if (!Hive.isAdapterRegistered(3)) {
        Hive.registerAdapter(CartAdapter());
      }
      if (!Hive.isBoxOpen(_kCartBoxName)) {
        await Hive.openBox<CartHive>(_kCartBoxName);
      }

      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<bool> insertCart(CartModel cart) async {
    try {
      final cartBox = Hive.box<CartHive>(_kCartBoxName);
      int i = cartBox.values
          .toList()
          .indexWhere((element) => element.id == cart.id);
      if (i != -1) {
        CartHive converted = cartBox.values
            .map<CartHive>((e) {
              return CartHive(
                  id: e.id!,
                  title: e.title!,
                  subtitle: e.subtitle!,
                  desc: e.desc!,
                  image: e.image!,
                  price: e.price!,
                  point: e.point!,
                  qty: e.qty! + 1,
                  isChecked: e.isChecked,
                  createdAt: e.createdAt!);
            })
            .toList()
            .firstWhere((element) => element.id == cart.id);
        await cartBox.putAt(i, converted);
        Fluttertoast.showToast(msg: 'success update item'.tr());
      } else {
        final converted = CartHive(
            id: cart.id,
            title: cart.title,
            subtitle: cart.subtitle,
            desc: cart.desc,
            image: cart.image,
            price: cart.price,
            point: cart.point,
            qty: cart.qty,
            isChecked: cart.isChecked,
            createdAt: cart.createdAt);
        await cartBox.add(converted);
        Fluttertoast.showToast(msg: 'success add item'.tr());
      }

      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  @override
  Future<CartModel> updateCart({int? id, int? qty}) async {
    final cartBox = Hive.box<CartHive>(_kCartBoxName);
    int i = cartBox.values.toList().indexWhere((element) => element.id == id);
    if (i != -1) {
      CartHive converted = cartBox.values
          .map<CartHive>((e) {
            return CartHive(
                id: e.id!,
                title: e.title!,
                subtitle: e.subtitle!,
                desc: e.desc!,
                image: e.image!,
                price: e.price!,
                point: e.point!,
                qty: qty!,
                isChecked: e.isChecked,
                createdAt: e.createdAt!);
          })
          .toList()
          .firstWhere((element) => element.id == id!);
      await cartBox.putAt(i, converted);
    }

    return cartBox.values
        .map<CartModel>((e) {
          return CartModel(
              id: e.id!,
              title: e.title!,
              subtitle: e.subtitle!,
              desc: e.desc!,
              image: e.image!,
              price: e.price!,
              point: e.point!,
              qty: e.qty!,
              isChecked: e.isChecked!,
              createdAt: e.createdAt!);
        })
        .toList()
        .firstWhere((element) => element.id == id!);
  }

  @override
  Future<bool> isChecked({int? id, bool? isChecked}) async {
    final cartBox = Hive.box<CartHive>(_kCartBoxName);
    int i = cartBox.values.toList().indexWhere((element) => element.id == id);
    if (i != -1) {
      CartHive converted = cartBox.values
          .map<CartHive>((e) {
            return CartHive(
                id: e.id!,
                title: e.title!,
                subtitle: e.subtitle!,
                desc: e.desc!,
                image: e.image!,
                price: e.price!,
                point: e.point!,
                qty: e.qty!,
                isChecked: isChecked,
                createdAt: e.createdAt!);
          })
          .toList()
          .firstWhere((element) => element.id == id!);
      await cartBox.putAt(i, converted);
      return true;
    } else {
      return false;
    }
  }
}
