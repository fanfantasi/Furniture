import 'package:home_decor/app/data/model/cart.dart';

abstract class CartDataSource {
  Future<bool> initDb();
  Future<bool> insertCart(CartModel item);
  Future<bool> deleteAllCart();
  Future<bool> deleteCart({int? id});
  Future<List<CartModel>> getCart();
  Future<CartModel> getSingleCart({int? id});
  Future<CartModel> updateCart({int? id, int? qty});
  Future<bool> isChecked({int? id, bool? isChecked});
}
