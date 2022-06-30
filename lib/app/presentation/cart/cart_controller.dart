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
import 'package:home_decor/injector.dart';
import 'package:home_decor/main.dart';

import '../../data/datasources/local/cart_local_datasoure.dart';

class CartController extends GetxController {
  final getLocalCart = Injector.resolve<GetLocalCart>();
  final postLocalCart = Injector.resolve<PostLocalCart>();
  final clearLocalCart = Injector.resolve<ClearLocalCart>();

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
        createdAt: DateTime.now()));
    res.fold((l) {
      result = false;
    }, (r) async {
      localFetch();
      result = true;
    });
    return result;
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
