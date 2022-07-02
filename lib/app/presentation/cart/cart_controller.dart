import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/core/errors/failure.dart';
import 'package:home_decor/app/core/usecases/usecase.dart';
import 'package:home_decor/app/data/model/cart.dart';
import 'package:home_decor/app/domain/entities/items.dart';
import 'package:home_decor/app/domain/usecases/cart/clear_local_cart.dart';
import 'package:home_decor/app/domain/usecases/cart/delete_local_cart.dart';
import 'package:home_decor/app/domain/usecases/cart/get_local_cart.dart';
import 'package:home_decor/app/domain/usecases/cart/post_local_cart.dart';
import 'package:home_decor/app/domain/usecases/cart/update_local_cart.dart';
import 'package:home_decor/app/domain/usecases/cart/update_local_checked.dart';
import 'package:home_decor/injector.dart';
import 'package:home_decor/main.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../data/datasources/local/cart_local_datasoure.dart';

class CartController extends GetxController {
  final checkoutController = RoundedLoadingButtonController();

  final getLocalCart = Injector.resolve<GetLocalCart>();
  final updatetLocalChecked = Injector.resolve<UpdatetLocalChecked>();
  final updatetLocalCart = Injector.resolve<UpdatetLocalCart>();
  final postLocalCart = Injector.resolve<PostLocalCart>();
  final deleteLocalCart = Injector.resolve<DeleteLocalCart>();
  final clearLocalCart = Injector.resolve<ClearLocalCart>();

  RxBool isChecked = false.obs;
  int get subtotal => carts.fold(
      0,
      (previous, current) =>
          previous + (current.isChecked ? (current.price * current.qty) : 0));

  final viewState = ViewState.initial.obs;
  RxList<CartModel> cart = <CartModel>[].obs;
  List<CartModel> get carts => List.from(cart);

  @override
  void onInit() async {
    await Injector.resolve<CartDataSource>().initDb();
    localFetch();
    super.onInit();
  }

  // feth data from local database
  Future<void> localFetch() async {
    if (viewState.value == ViewState.busy) return;
    _setState(ViewState.busy);
    final result = await getLocalCart.call(NoParams());
    _handleFetchResult(result);
  }

  // handle api fetch result
  void _handleFetchResult(Either<Failure, List<CartModel>> result) {
    result.fold((feilure) {
      _setState(ViewState.error);
    }, (data) {
      cart.value = data;
      _setState(ViewState.data);
    });
  }

  Future<bool> postCart({ResultItems? cart}) async {
    bool result = false;
    final res = await postLocalCart.call(ParamsCart(
        id: cart!.id,
        title: cart.title,
        subtitle: cart.subtitle,
        desc: cart.desc,
        image: cart.image,
        price: cart.price,
        point: cart.point,
        qty: 1,
        isChecked: true,
        createdAt: DateTime.now()));
    res.fold((l) {
      result = false;
    }, (r) async {
      localFetch();
      result = true;
    });
    return result;
  }

  // update checked
  Future<void> updatechecked({CartModel? cartSelected, bool? isChecked}) async {
    final result =
        await updatetLocalChecked.call(Tuple2(cartSelected!.id, isChecked!));
    result.fold((feilure) {}, (data) {
      cart[cart.indexWhere((e) => e.id == cartSelected.id)] = CartModel(
          id: cartSelected.id,
          title: cartSelected.title,
          subtitle: cartSelected.subtitle,
          desc: cartSelected.desc,
          image: cartSelected.image,
          price: cartSelected.price,
          point: cartSelected.point,
          qty: cartSelected.qty,
          isChecked: isChecked,
          createdAt: cartSelected.createdAt);
    });
  }

  // update Qty
  Future<void> updateqty({CartModel? cartSelected, int? qty}) async {
    if (qty! > 0) {
      final result = await updatetLocalCart.call(Tuple2(cartSelected!.id, qty));
      result.fold((feilure) {}, (data) {
        cart[cart.indexWhere((e) => e.id == cartSelected.id)] = CartModel(
            id: cartSelected.id,
            title: cartSelected.title,
            subtitle: cartSelected.subtitle,
            desc: cartSelected.desc,
            image: cartSelected.image,
            price: cartSelected.price,
            point: cartSelected.point,
            qty: qty,
            isChecked: cartSelected.isChecked,
            createdAt: cartSelected.createdAt);
      });
    }
  }

  // Delete Item
  Future<void> deleteitem({CartModel? cartSelected}) async {
    final result = await deleteLocalCart.call(cartSelected!.id);
    result.fold((feilure) {}, (data) {
      cart.removeWhere((e) => e.id == cartSelected.id);
    });
  }

  // Clear Item
  Future<void> clearItems() async {
    final result = await clearLocalCart.call(NoParams());
    result.fold((feilure) {}, (data) {
      cart.clear();
    });
  }

  Future<void> clearCart() async {
    await clearLocalCart.call(NoParams());
    await localFetch();
  }

  // set viewstate
  void _setState(ViewState state) {
    viewState.value = state;
  }
}
