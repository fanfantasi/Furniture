import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:home_decor/app/core/errors/failure.dart';
import 'package:home_decor/app/core/usecases/usecase.dart';
import 'package:home_decor/app/domain/entities/login_user.dart';
import 'package:home_decor/app/presentation/cart/cart_controller.dart';
import 'package:home_decor/injector.dart';
import 'package:home_decor/main.dart';

import '../../data/datasources/local/login_local_datasource.dart';
import '../../domain/usecases/login/get_local_login.dart';

class ProfilController extends GetxController {
  final getLocalLogin = Injector.resolve<GetLocalLogin>();
  List<String> languages = ['English', 'Indonesia'];

  RxBool isSigningIn = false.obs;
  final viewState = ViewState.initial.obs;

  RxInt get cartCounts => Get.find<CartController>().carts.length.obs;

  @override
  void onInit() async {
    await Injector.resolve<LoginLocalDataSource>().initDb();
    loginlocalFetch();
    super.onInit();
  }

  // feth data from local database
  Future<void> loginlocalFetch() async {
    if (viewState.value == ViewState.busy) return;
    _setState(ViewState.busy);
    final result = await getLocalLogin.call(NoParams());
    _handleFetchResult(result);
  }

  // handle api fetch result
  void _handleFetchResult(Either<Failure, List<Userlogin>> result) {
    result.fold((feilure) {
      _setState(ViewState.error);
      isSigningIn.value = false;
    }, (data) {
      isSigningIn.value = true;
      _setState(ViewState.data);
    });
  }

  // set viewstate
  void _setState(ViewState state) {
    viewState.value = state;
  }
}
